# Pinned, not :latest. listmonk refuses to start when the binary is newer than
# the database schema -- cmd/upgrade.go ends in lo.Fatalf("there are N pending
# database upgrade(s)"). On a moving tag the image can jump version under a
# running deployment and brick it on the next restart, with no change by you.
FROM listmonk/listmonk:v6.2.0

COPY config.toml /listmonk/config.toml.template
COPY entrypoint.sh /listmonk/entrypoint.sh

RUN chmod +x /listmonk/entrypoint.sh

WORKDIR /listmonk

EXPOSE 9000

ENTRYPOINT ["/bin/sh", "/listmonk/entrypoint.sh"]
