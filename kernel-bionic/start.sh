#!/bin/bash

(
    set -e

    startfiles=$(find /opt/startup-scripts -executable -type f | sort)

    for s in ${startfiles}; do
        . "$s"
    done

    set +e

    exec "$@"
)
