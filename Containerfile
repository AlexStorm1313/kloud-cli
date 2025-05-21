FROM quay.io/fedora/fedora:latest as release

RUN curl https://s3.amazonaws.com/session-manager-downloads/plugin/latest/linux_64bit/session-manager-plugin.rpm > session-manager-plugin.rpm && \
    dnf install -y ./session-manager-plugin.rpm && \
    rm -rf ./session-manager-plugin.rpm && \
    echo -e "\
[google-cloud-cli]\n\
name=Google Cloud CLI\n\
baseurl=https://packages.cloud.google.com/yum/repos/cloud-sdk-el9-x86_64\n\
enabled=1\n\
gpgcheck=1\n\
repo_gpgcheck=0\n\
gpgkey=https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg\n"\
> /etc/yum.repos.d/google-cloud-sdk.repo && \
    cat /etc/yum.repos.d/google-cloud-sdk.repo && \
    dnf -y update && \
    dnf -y install \
    python3 \
    bash-completion \
    awscli2 \
    oci-cli \
    azure-cli \
    google-cloud-cli \
    opentofu && \
    dnf -y clean all