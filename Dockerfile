FROM alpine:3.11

# Versions
ENV KUBECTL_VERSION="1.14.6"
ENV AWSCLI_VERSION "1.18.128"
ENV IAMAUTH_VERSION="1.14.6"

# Install Tools
RUN apk add py-pip curl unzip

# Install AWS CLI
RUN pip install awscli==$AWSCLI_VERSION --upgrade --user

# Install Kubectl
RUN \
  curl -o kubectl https://amazon-eks.s3-us-west-2.amazonaws.com/${KUBECTL_VERSION}/2019-08-22/bin/linux/amd64/kubectl  && \
  chmod +x ./kubectl && \
  mv ./kubectl /usr/local/bin/kubectl

# Install IAM Autenticatior
RUN \
  curl -o aws-iam-authenticator https://amazon-eks.s3-us-west-2.amazonaws.com/${IAMAUTH_VERSION}/2019-08-22/bin/linux/amd64/aws-iam-authenticator && \
  chmod +x ./aws-iam-authenticator && \
  mv ./aws-iam-authenticator /usr/local/bin/aws-iam-authenticator

# Set entrypoint
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]