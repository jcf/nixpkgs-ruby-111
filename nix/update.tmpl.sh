#!@shell@

echo >&2 "==> Removing lock-files..."
rm -f ./Gemfile.lock
rm -f ./gemset.nix

echo >&2 "==> Locking dependencies..."
BUNDLE_FORCE_RUBY_PLATFORM=true @bundix@ --lock

echo >&2 "🚀 Dependencies locked and updated!"
