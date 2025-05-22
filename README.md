# kloud-cli
A comprehensive container image that provides essential command-line tools for managing infrastructure across multiple cloud providers and automation platforms.

## Overview

This container is built on Fedora Linux and includes pre-installed CLI tools for:
- **Amazon Web Services (AWS)**
- **Microsoft Azure (AZURE)**
- **Google Cloud Platform (GCP)**
- **Oracle Cloud Infrastructure (OCI)**
- **Terraform (HCL)** with OpenTofu

## Included Tools

### Cloud Provider CLIs
- **AWS CLI v2** - Amazon Web Services command-line interface
- **AWS Session Manager Plugin** - Enhanced SSH and port forwarding capabilities for EC2 instances
- **Azure CLI** - Microsoft Azure command-line interface
- **Google Cloud CLI (gcloud)** - Google Cloud Platform command-line interface
- **OCI CLI** - Oracle Cloud Infrastructure command-line interface

### Infrastructure as Code
- **OpenTofu** - Open-source Terraform alternative for infrastructure provisioning

## Building the Container Image

```bash
git clone https://github.com/AlexStorm1313/kloud-cli.git
cd kloud-cli
make build
```

## Quick Setup

Add the following to your `.bashrc`, `.zshrc`, or equivalent shell configuration file:

### Using Podman

#### AWS CLI
```bash
# Create an alias for the containerized AWS CLI
alias aws="podman run --privileged --rm -it --entrypoint aws \
--workdir /root/aws 
-v ~/.aws:/root/.aws 
-v $(pwd):/root/aws \
--env AWS_ACCESS_KEY_ID \
--env AWS_SECRET_ACCESS_KEY \
--env AWS_SESSION_TOKEN \ 
--env AWS_DEFAULT_REGION \
--env AWS_DEFAULT_OUTPUT \
--env AWS_PROFILE \
--env AWS_CA_BUNDLE \
--env AWS_SHARED_CREDENTIALS_FILE \
--env AWS_CONFIG_FILE \
--env AWS_ROLE_ARN \
--env AWS_ROLE_SESSION_NAME \
--env AWS_WEB_IDENTITY_TOKEN_FILE \
--env AWS_ROLE_ARN \
--env AWS_METADATA_SERVICE_TIMEOUT \
--env AWS_METADATA_SERVICE_NUM_ATTEMPTS \
--env AWS_STS_REGIONAL_ENDPOINTS \
--env AWS_MAX_ATTEMPTS \
--env AWS_RETRY_MODE \
--env AWS_EC2_METADATA_DISABLED \
--env AWS_SDK_UA_APP_ID \
ghcr.io/alexstorm1313/kloud-cli:latest $@"
# Bash completion
complete -C "podman run --rm -i --entrypoint aws_completer --env COMP_LINE --env COMP_POINT ghcr.io/alexstorm1313/kloud-cli:latest $@" aws
```

#### Azure CLI
```bash
@todo
```

#### GCP CLI
```bash
@todo
```

#### OCI CLI
```bash
@todo
```

#### Tofu CLI
```bash
# Create an alias for the containerized Tofu CLI
alias tofu="podman run --privileged --rm -it --entrypoint tofu \
--workdir /root/terraform \
-v ~/.aws:/root/.aws \
-v ~/.terraform.d:/root/.terraform.d/ \
-v $(pwd):/root/terraform \
--env AWS_ACCESS_KEY_ID \
--env AWS_SECRET_ACCESS_KEY \
--env AWS_SESSION_TOKEN \ 
--env AWS_DEFAULT_REGION \
--env AWS_DEFAULT_OUTPUT \
--env AWS_PROFILE \
--env AWS_CA_BUNDLE \
--env AWS_SHARED_CREDENTIALS_FILE \
--env AWS_CONFIG_FILE \
--env AWS_ROLE_ARN \
--env AWS_ROLE_SESSION_NAME \
--env AWS_WEB_IDENTITY_TOKEN_FILE \
--env AWS_ROLE_ARN \
--env AWS_METADATA_SERVICE_TIMEOUT \
--env AWS_METADATA_SERVICE_NUM_ATTEMPTS \
--env AWS_STS_REGIONAL_ENDPOINTS \
--env AWS_MAX_ATTEMPTS \
--env AWS_RETRY_MODE \
--env AWS_EC2_METADATA_DISABLED \
--env AWS_SDK_UA_APP_ID \
ghcr.io/alexstorm1313/kloud-cli:latest $@"
# Bash completion
complete -C "podman run --rm -i --entrypoint tofu --env COMP_LINE --env COMP_POINT ghcr.io/alexstorm1313/kloud-cli:latest $@" tofu
```

After adding these lines, restart your shell or run `source ~/.bashrc` (or equivalent) to apply the changes.
