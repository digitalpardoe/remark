#!/bin/bash
set -euo pipefail

# Run asynchronously with 5 minute timeout
echo '{"async": true, "asyncTimeout": 300000}'

# Only run in remote (Claude Code on the web) environments
if [ "${CLAUDE_CODE_REMOTE:-}" != "true" ]; then
  exit 0
fi

cd "$CLAUDE_PROJECT_DIR"

# Install system dependencies for rmagick gem (ImageMagick)
if ! pkg-config --exists MagickCore 2>/dev/null; then
  sudo apt-get update -qq
  sudo apt-get install -y -qq libmagickwand-dev imagemagick > /dev/null 2>&1
fi

# Install Ruby 3.4.8 via rbenv if not present
RUBY_VERSION="3.4.8"
eval "$(rbenv init - bash)"
if ! rbenv versions --bare | grep -q "^${RUBY_VERSION}$"; then
  rbenv install "$RUBY_VERSION"
fi
rbenv shell "$RUBY_VERSION"

# Install bundler (matching lockfile version) and gems
gem install bundler --no-document --conservative
bundle config set --local without 'production'
bundle install

# Set up database (idempotent: create if needed, load schema, seed)
bundle exec rake db:prepare db:seed 2>/dev/null || bundle exec rake db:create db:schema:load db:seed 2>/dev/null || true
