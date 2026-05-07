#!/bin/sh
set -e

# Generate config.toml at runtime from environment variables
cat > /listmonk/config.toml << EOF
[app]
address = "0.0.0.0:9000"

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

# Run DB install/migrations (idempotent — safe on every start)
./listmonk --config config.toml --install --idempotent --yes

exec ./listmonk --config config.toml
