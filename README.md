# AWSCli

AWS Cli tool container

This container was created by me to be used mostly in some CI situations when i needed some commands to be executed on some amazon objects.
You can set the environment variables and on startup they are going to be set and default user credential and all the command you put on the container run will be executed using those variables.

The variables will be reset every time the container restart so you can reuse the container as many time as you want just change the environment variables and run the command.

**Since this container always create the configuration files it will never ask you to execute the _aws configure_ command.**

Example:

```sh

docker run --rm -it --link dynamodb-local jmtvms/awscli \
    aws dynamodb create-table --table-name myTable \
    --attribute-definitions AttributeName=id,AttributeType=S \
    --key-schema AttributeName=id,KeyType=HASH \
    --provisioned-throughAttributeName=id,KeyType=HASH \
    --provisioned-throughput ReadCapacityUnits=5,WriteCapacityUnits=5 \
    --endpoint-url http://dynamodb-local:8000

```

The command was to create a table in a linked container _jmtvms/dynamodb-local_.

## Environments variables

### AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY, AWS_DEFAULT_REGION and OUTPUT

Those environment variables are used on the container startup process to create the _~/.aws/credentials_ and _~/.aws/config_.

To create your container with your credentials type the following command.

```sh

docker run --rm -it \
 -e "AWS_ACCESS_KEY_ID=1234645435"
 -e "AWS_SECRET_ACCESS_KEY=lkhflkh34k3hakjf2359uajji3259u" \
 -e "AWS_DEFAULT_REGION=us-east-1" \
 jmtvms/awscli <aws> <aws> <cmd arguments>

```

You can lear more about CLI configuration files [here](https://docs.aws.amazon.com/cli/latest/userguide/cli-config-files.html).