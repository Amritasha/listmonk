FROM listmonk/listmonk:latest

COPY config.toml /listmonk/config.toml
COPY entrypoint.sh /listmonk/entrypoint.sh

RUN chmod +x /listmonk/entrypoint.sh

WORKDIR /listmonk

EXPOSE 9000

ENTRYPOINT ["./entrypoint.sh"]
