import json
import boto3

dynamodb=boto3.resource("dynamodb")

def lambda_handler(event, context):
    # TODO implement
    primary_key={'id' :  event['queryStringParameters']['id']}
    table = dynamodb.Table('student')
    res = table.get_item(Key=primary_key)
    status = "200"
    body = ""
    if ["Item"] in res:
        body = json.dumps(res["Item"])
    else:
        status = "404"
    return {
    'statusCode': status,
    'body': body
    }