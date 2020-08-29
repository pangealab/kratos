FROM amazon/aws-cli:latest
# FROM alpine:3.11

# Kubectl version
ENV KUBECTL_VERSION="1.14.6"

# Install Tools
# RUN apk add py-pip curl unzip

# Install AWS CLI
# RUN \
#   curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
#   unzip awscliv2.zip && \
#   ./aws/install

# Install Kubectl
RUN \
  curl -o kubectl https://amazon-eks.s3-us-west-2.amazonaws.com/1.14.6/2019-08-22/bin/linux/amd64/kubectl  && \
  chmod +x ./kubectl && \
  mv ./kubectl /usr/local/bin/kubectl

# Install IAM Autenticatior
# RUN \
#   curl -o aws-iam-authenticator https://amazon-eks.s3-us-west-2.amazonaws.com/1.14.6/2019-08-22/bin/linux/amd64/aws-iam-authenticator && \
#   chmod +x ./aws-iam-authenticator && \
#   mv ./aws-iam-authenticator /usr/local/bin/aws-iam-authenticator

# Set entrypoint
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]