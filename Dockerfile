FROM nicolaka/netshoot:latest

COPY --from=vault:latest /bin/vault /usr/bin/vault

ENV VAULT_ADDR https://vault.vault.svc:8200
ENV VAULT_SKIP_VERIFY true

COPY --from=consul:latest /bin/consul /usr/bin/consul
ENV CONSUL_HTTP_ADDR http://consul.vault.svc:8500

COPY motd /etc/motd