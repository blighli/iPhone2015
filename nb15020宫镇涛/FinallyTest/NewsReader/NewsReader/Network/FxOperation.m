

#import "FxOperation.h"

@implementation FxOperation 

- (id)initWithDelegate:(id<FxOperationDelegate>)delegate
                opInfo:(NSDictionary *)opInfo
{
    self = [super init];
    if (self) {
        _delegate = delegate;
        _opInfo = opInfo;
        _totalLength = 0;
    }
    
    return self;
}

- (void)cancelOp
{
    if (_connection != nil) {
        BASE_INFO_FUN(@"_connection dealloc cancel");
        [_connection cancel];
    }
    _connection = nil;
}

- (void)dealloc
{
    if (_connection != nil) {
        BASE_INFO_FUN(@"_connection dealloc cancel");
        [_connection cancel];
    }
    _connection = nil;
    _delegate = nil;
}

- (NSTimeInterval)timeoutInterval
{
    return FxRequestTimeout;
}

- (NSMutableURLRequest *)urlRequest
{
    NSString *urlString = [_opInfo objectForKey:@"url"];
    id body = [_opInfo objectForKey:@"body"];
    NSURL *url = [NSURL URLWithString:urlString];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    BASE_INFO_FUN(urlString);
    
    if (body != nil) {
        [request setHTTPMethod:HTTPPOST];
        if ([body isKindOfClass:[NSString class]]) {
            [request setHTTPBody:[body dataUsingEncoding:NSUTF8StringEncoding]];
            BASE_INFO_FUN(body);
        }
        else
            [request setHTTPBody:body];
    }
    else {
        [request setHTTPMethod:HTTPGET];
    }
    [request setTimeoutInterval:[self timeoutInterval]];
    
    return request;
}

- (void)executeOp
{
    _connection = [[NSURLConnection alloc] initWithRequest:[self urlRequest] delegate:self];
}

- (void)parseData:(NSData *)data
{
    if (data.length <= 0) { //返回的长度为0，认为成功
        [self parseSuccess:nil jsonString:nil];
        return;
    }
    
    NSString *jsonString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSMutableDictionary *dict = [FxJsonUtility jsonValueFromString:jsonString];
    
    NSString *result = [dict objectForKey:NetResult];
    if ([result isEqualToString:NetOk]) {
        [self parseSuccess:dict jsonString:jsonString];
    }
    else {
        [self parseFail:dict];
    }
    
    _receiveData = nil;
}

- (void)parseSuccess:(NSDictionary *)dict jsonString:jsonString
{
    [_delegate opSuccess:dict];
}

- (void)parseProgress:(long long)receivedLength
{

}

- (void)parseFail:(NSDictionary *)dict
{
    if ([dict isKindOfClass:[NSString class]]) {
        [_delegate opFail:(NSString *)dict];
        return;
    }
    
    // token失效后重新登录
    if ([[dict objectForKey:NetResult] isEqualToString:NetInvalidateToken]) {
        BASE_ERROR_FUN(NetInvalidateToken);
    }
    
    [_delegate opFail:[dict objectForKey:NetMessage]];
}


#pragma mark - NSURLConnectionDelegate methods

- (void)connection:(NSURLConnection *)aConnection didReceiveResponse:(NSURLResponse *)aResponse
{
    NSHTTPURLResponse *response = (NSHTTPURLResponse *)aResponse;
    NSString *statusCode = [NSString stringWithFormat:@"%ld",(long)[response statusCode]];
    
    _statusCode = [statusCode intValue];
    _receiveData = [[NSMutableData alloc] init];
    
    if (_statusCode ==200 || _statusCode == 206) {
        _totalLength = [response expectedContentLength];
    }
    
    BASE_INFO_FUN(statusCode);
}

- (void)connection:(NSURLConnection *)aConn didReceiveData:(NSData *)data
{
    BASE_INFO_FUN(([NSString stringWithFormat:@"%lu", (unsigned long)data.length]));
	[_receiveData appendData:data];
    [self parseProgress:_receiveData.length];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)aConn
{
    BASE_INFO_FUN([[NSString alloc] initWithData:_receiveData encoding:NSUTF8StringEncoding]);
    
    // 成功接受：200有数据，204没有数据，206断点续传
    if (_statusCode == 200 || _statusCode == 204 || _statusCode == 206) {
        [self parseData:_receiveData];
    }
    else {
        
        NSString *errorMessage = [[NSString alloc] initWithData:_receiveData encoding:NSUTF8StringEncoding];
        
        if (errorMessage.length <= 0) {
            errorMessage = [[NSString alloc] initWithFormat:@"ResponseCode:%ld", (long)_statusCode];
        }
        
        [self parseFail:errorMessage];
    }
    
    _connection = nil;
    _receiveData = nil;
}

- (void)connection:(NSURLConnection *)aConn didFailWithError:(NSError *)error
{
    [self parseFail:[error localizedDescription]];
    
    _connection = nil;
    _receiveData = nil;
}

@end
