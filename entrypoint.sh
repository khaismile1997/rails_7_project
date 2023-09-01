#!/bin/bash
set -e

# Remove a potentially pre-existing server.pid for Rails.
rm -f /rails_7_project/tmp/pids/server.pid

# Run migrations.
bundle exec rails db:migrate

# Start the Rails server.
exec "$@"
