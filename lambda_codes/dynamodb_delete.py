import json
import boto3
dynamodb = boto3.resource("dynamodb")
def lambda_handler(event, context):
    table = dynamodb.Table("student")
    primary_key = {"id":  event['queryStringParameters']['id']}
    status="200"    
    if "Item" in table.get_item(Key = primary_key):
        res = table.delete_item(Key= primary_key)
        if not res:
            status = "400" 
    else:
        status = "404"
    return {
        "statusCode": status
    }   
    