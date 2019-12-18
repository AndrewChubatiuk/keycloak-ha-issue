FROM hashicorp/terraform:light

ARG TERRAFORM_PROVIDER_DIR=/root/.terraform.d/plugins
ARG KEYCLOAK_PROVIDER_VERSION=1.14.0
ARG KEYCLOAK_PROVIDER_URL=https://github.com/mrparkers/terraform-provider-keycloak/releases/download/${KEYCLOAK_PROVIDER_VERSION}/terraform-provider-keycloak_v${KEYCLOAK_PROVIDER_VERSION}_linux_amd64.zip

RUN apk add --no-cache libc6-compat bash curl && \
    mkdir -p ${TERRAFORM_PROVIDER_DIR} && \
    wget $KEYCLOAK_PROVIDER_URL -O /tmp/terraform-provider-keycloak.zip && \
    unzip -q -o /tmp/terraform-provider-keycloak.zip -d ${TERRAFORM_PROVIDER_DIR}/ && \
    chmod -R +x ${TERRAFORM_PROVIDER_DIR}/

COPY vars /vars
COPY scripts/ /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh /usr/bin/wait-for.sh

WORKDIR /vars
ENTRYPOINT /usr/bin/wait-for.sh /usr/bin/entrypoint.sh
