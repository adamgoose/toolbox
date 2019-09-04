FROM nicolaka/netshoot:latest

RUN apk add --update \
    postgresql-client \
  && rm -rf /var/cache/apk/*

# HashiCorp Vault
COPY --from=vault:latest /bin/vault /usr/bin/vault

ENV VAULT_ADDR https://vault.vault.svc:8200
ENV VAULT_SKIP_VERIFY true

# HashiCorp Consul
COPY --from=consul:latest /bin/consul /usr/bin/consul
ENV CONSUL_HTTP_ADDR http://consul.vault.svc:8500

COPY motd /etc/motd
