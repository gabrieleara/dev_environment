# dirs        = $(shell ls -d */ | sed 's#/##' | sort)
branches    = $(shell git branch -a | grep remotes/origin/ | grep -v HEAD | grep -v main | grep -v 'dependabot/' | sed 's#remotes/origin/##' | xargs)
cur_branch  = $(shell git rev-parse --abbrev-ref HEAD)

branches_rebase = $(addprefix rebase-, $(branches))
branches_manual = $(addprefix manual-, $(branches))

.PHONY: all build rebase $(dirs) $(branches) $(branches_rebase)

all: build
build: rebase $(branches)

$(branches):
	git checkout $@
	docker build $@ --tag gabrieleara/dev_environment:$@
	docker push gabrieleara/dev_environment:$@
	git checkout $(cur_branch)

rebase: $(branches_rebase)

$(branches_rebase):
	git checkout $(shell echo $@ | sed 's/rebase-//')
	git pull
	git rebase main
	git push --force
	git checkout $(cur_branch)

$(branches_manual):
	gh workflow run "Build and Push on DockerHub" --ref $(shell echo $@ | sed 's/manual-//')

# all: $(dirs)
# $(dirs):
# 	docker build $@ --tag gabrieleara/dev_environment:$@
