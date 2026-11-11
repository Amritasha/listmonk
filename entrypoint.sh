#!/bin/sh
set -e

# Generate config.toml at runtime from environment variables
cat > /listmonk/config.toml << EOF
[app]
address = "0.0.0.0:9000"
admin_username = "${LISTMONK_ADMIN_USER}"
admin_password = "${LISTMONK_ADMIN_PASSWORD}"
secret = "${LISTMONK_SECRET}"

[db]
host = "${PGHOST}"
port = ${PGPORT:-5432}
user = "${PGUSER}"
password = "${PGPASSWORD}"
database = "${PGDATABASE}"
ssl_mode = "disable"
max_open = 25
max_idle = 25
max_lifetime = "300s"
EOF

# Create the schema on a fresh database. Idempotent: a no-op once installed.
./listmonk --config config.toml --install --idempotent --yes

# Apply any pending schema migrations. --install does NOT do this: on an
# existing database whose schema predates the binary, listmonk exits with
# "there are N pending database upgrade(s) ... run listmonk --upgrade" and the
# service never starts. Running it here is a no-op when the schema is current
# ("no upgrades to run"), and the version pin above means migrations only move
# when the tag is deliberately bumped.
./listmonk --config config.toml --upgrade --yes

exec ./listmonk --config config.toml
