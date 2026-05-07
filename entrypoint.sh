#!/bin/sh
set -e

# Run DB install/migrations (idempotent — safe to run on every start)
./listmonk --config config.toml --install --idempotent --yes

# Start the server
exec ./listmonk --config config.toml
