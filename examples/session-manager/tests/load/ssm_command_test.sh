#!/bin/bash
INSTANCE_ID=$1
REGION=$2

while [ "$status" != "\"Success\"" ]
do
    SSM_SEND_COMMAND=$(aws ssm send-command --region ${REGION} \
    --instance-ids ${INSTANCE_ID} \
    --document-name "AWS-RunShellScript" \
    --comment "Execute Command" --parameter commands="pwd" \
    --output json | jq .Command.CommandId | sed -e 's/"//g')

    COMMAND_INVOCATIONS=$(aws ssm list-command-invocations --region ${REGION} --command-id ${SSM_SEND_COMMAND} --details --output json)
    status=$(echo $COMMAND_INVOCATIONS | jq .CommandInvocations[].Status)
    result=$(echo $COMMAND_INVOCATIONS | jq .CommandInvocations[].CommandPlugins[].Output)
    sleep 5
done

jq -n --arg result "$result" --arg status "$status" '{"result":$result, "status":$status}'