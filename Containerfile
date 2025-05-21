FROM quay.io/fedora/fedora:latest as release

RUN curl https://s3.amazonaws.com/session-manager-downloads/plugin/latest/linux_64bit/session-manager-plugin.rpm > session-manager-plugin.rpm && \
    dnf install -y ./session-manager-plugin.rpm && \
    rm -rf ./session-manager-plugin.rpm && \
    dnf -y update && \
    dnf -y install \
    python3 \
    bash-completion \
    awscli2 \
    oci-cli \
    azure-cli \
    opentofu && \
    dnf -y clean all