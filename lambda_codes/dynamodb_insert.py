import json
import boto3
def lambda_handler(event, context):
    dynamodb=boto3.resource('dynamodb')
    table=dynamodb.Table('student')
    res= table.put_item(
        Item= json.loads(event['body'])
        )
    return {
    'statusCode': 200,
    'body': json.dumps(res),
    }