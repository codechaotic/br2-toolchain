#!/bin/bash -l

set -e

cd $(dirname $(readlink -f "$0"))
exec "$@"
