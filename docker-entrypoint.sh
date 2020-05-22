#!/bin/bash
set -e

cd /app/bootstrap-icons-gem
bundle install

# cd /app/bootstrap-icons-helper
# bundle install

exec "$@"
