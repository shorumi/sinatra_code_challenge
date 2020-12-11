#!/bin/bash

set -e

# Check whether or not gems are installed, and install it case not installed.
bundle check || bundle install --jobs=$(nproc) --retry=5

exec "/bin/bash"
