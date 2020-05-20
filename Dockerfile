FROM ubuntu:18.04

ENV TZ=America/Sao_Paulo
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get -y install --no-install-recommends \
    curl \
    unzip \
    wget \
    git \
    apt-transport-https \
    ca-certificates \
    awscli \
    gettext-base \
    make \
    && cd /tmp \
    && wget https://releases.hashicorp.com/terraform/0.12.25/terraform_0.12.25_linux_amd64.zip \
    && unzip terraform_0.12.25_linux_amd64.zip -d /usr/bin \
    && curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl \
    && chmod +x ./kubectl \
    && mv ./kubectl /usr/local/bin/kubectl \
    && rm -rf /tmp/* \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir /root/.kube /root/.aws

WORKDIR /workspace

ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]