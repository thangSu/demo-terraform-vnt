import json
import boto3

dynamodb=boto3.resource('dynamodb')

def lambda_handler(event, context):
    primary_key={"id": json.loads(event['body'])['id']}
    table = dynamodb.Table("student")
    res = table.update_item(
        Key=primary_key,
        UpdateExpression='SET studentname= :studentname, studentclass= :studentclass',
        ExpressionAttributeValues={
            ':studentname' : json.loads(event['body'])['studentname'],
            ':studentclass' : json.loads(event['body'])['studentclass']
        })
    return {
    'statusCode': 200,
    'body': json.dumps(event),
    }
