FROM alpine:latest

LABEL maintainer="joao@miguel.ms"
LABEL description="DynamoDB Container to be used with CI environments"
LABEL repository="https://github.com/jmtvms/awscli.git"
LABEL bugs="https://github.com/jmtvms/awscli/issues"
LABEL github="https://github.com/jmtvms/awscli"
LABEL version="1.0.0"

#AWS access key.
ENV AWS_ACCESS_KEY_ID=
#AWS secret key.
ENV AWS_SECRET_ACCESS_KEY=
#AWS region.
ENV AWS_DEFAULT_REGION="us-east-1"
#output format (json, text, or table)
ENV OUTPUT="json"

# Installing AWS Cli
RUN apk add --update py-pip && rm -rf /var/cache/apk/*
RUN pip install awscli --upgrade

COPY start.sh ./
RUN chmod +x start.sh

ENTRYPOINT ["./start.sh"]
