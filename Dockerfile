FROM ubuntu:xenial

LABEL \
  "maintainer"="Mike Ball <mikedball@gmail.com>" \
  "repository"="https://github.com/mdb/terrajux-action" \
  "homepage"="https://github.com/mdb/terrajux-action" \
  "com.github.actions.name"="terrajux-action" \
  "com.github.actions.description"="Execute terrajux" \
  "com.github.actions.icon"="check-circle" \
  "com.github.actions.color"="package"

RUN \
  apt-get update && \
  apt-get install -y \
    curl \
    gnupg \
    software-properties-common \
    apt-transport-https \
    ca-certificates \
    git

RUN \
  curl -fsSL https://apt.releases.hashicorp.com/gpg | apt-key add - && \
  apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main" && \
  apt-get update && \
  apt-get install terraform

RUN \
  curl \
    --location \
    --remote-name \
    https://github.com/rhenning/terrajux/releases/download/v0.2.0/terrajux_0.2.0_linux_amd64.tar.gz && \
  tar zxvf terrajux_0.2.0_linux_amd64.tar.gz && \
  cp terrajux_0.2.0_linux_amd64/terrajux /usr/bin && \
  rm -rf terrajux_0.2.0_linux_amd64 && \
  rm terrajux_0.2.0_linux_amd64.tar.gz

COPY entrypoint.sh /entrypoint.sh
COPY test.sh /test.sh
RUN ./test.sh

ENTRYPOINT ["/entrypoint.sh"]
