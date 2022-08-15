import { Context, APIGatewayProxyResult, APIGatewayEvent } from 'aws-lambda';

export const handler = async (event: APIGatewayEvent, context: Context): Promise<APIGatewayProxyResult> => {
  console.log(`Event: ${JSON.stringify(event, null, 2)}`);
  console.log(`Context: ${JSON.stringify(context, null, 2)}`);
  console.log(`User Agent: ${JSON.stringify(event.requestContext.identity.userAgent, null, 2)}`);
  
  if (JSON.stringify(event.path, null, 2) == '/my-endpoint') {
    return {
      statusCode: 200,
      body: JSON.stringify({
        msg: 'Response from my endpoint!',
      }),
   };
  }
  
  return {
      statusCode: 200,
      body: JSON.stringify({
        msg: 'Hello World!!!',
      }),
   };
};