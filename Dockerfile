FROM alpine:3.11

# Kubectl version
ENV KUBECTL_VERSION="1.14.6"

# Install AWS CLI
RUN apk add py-pip curl
RUN pip install awscli

# Install Kubectl
RUN \
  curl -o kubectl https://amazon-eks.s3-us-west-2.amazonaws.com/1.14.6/2019-08-22/bin/linux/amd64/kubectl  && \
  chmod +x ./kubectl && \
  mv ./kubectl /usr/local/bin/kubectl
  

# Install IAM Autenticatior
RUN \
  curl -o aws-iam-authenticator https://amazon-eks.s3-us-west-2.amazonaws.com/1.14.6/2019-08-22/bin/linux/amd64/aws-iam-authenticator && \
  chmod +x ./aws-iam-authenticator && \
  mv ./aws-iam-authenticator /usr/local/bin/aws-iam-authenticator

# Set entrypoint
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]