//
//  WebSiteHelper.m
//  GW2BroH
//
//  Created by CoodyChou on 2015/5/25.
//  Copyright (c) 2015年 CoodyChou. All rights reserved.
//
//  7參考自：http://www.raywenderlich.com/59255/afnetworking-2-0-tutorial
//

#import "WebSiteHelper.h"

#import "AFNetworking.h"

#pragma mark - base url & v1,v2
#define D_GW2_BASE_URL @"https://api.guildwars2.com"
#define D_GW2_V1 @"v1"
#define D_GW2_V2 @"v2"


//#pragma mark - get & post
//NSString *const httpGet = @"get";
//NSString *const httpPost = @"post";


#pragma mark - WebSiteHelper
@implementation WebSiteHelper


////////////////////////////////////////////
#pragma mark - Get base url
+(NSString *)getGW2_V1_Url
{
    return [NSString stringWithFormat:@"%@/%@" , D_GW2_BASE_URL , D_GW2_V1 ];
}

+(NSString *)getGW2_V2_Url
{
    return [NSString stringWithFormat:@"%@/%@" , D_GW2_BASE_URL , D_GW2_V2];
}


////////////////////////////////////////////
#pragma mark - init
+ (WebSiteHelper *)sharedInstance
{
    static WebSiteHelper *_sharedWebSiteHelper = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedWebSiteHelper = [[self alloc] initWithBaseURL:[NSURL URLWithString:[self getGW2_V2_Url]]];
    });
    
    return _sharedWebSiteHelper;
}

- (instancetype)initWithBaseURL:(NSURL *)url
{
    self = [super initWithBaseURL:url];
    
    if (self) {
        self.responseSerializer = [AFJSONResponseSerializer serializer];
        self.requestSerializer = [AFJSONRequestSerializer serializer];
    }
    
    return self;
}


////////////////////////////////////////////
#pragma mark - Request
+(void)sendRequestWithTailUrl:(NSString *)tempTailUrl withSuccessBlock:(URLSessionDataTaskHandler)successBlock
{
    [[WebSiteHelper sharedInstance] GET:tempTailUrl parameters:nil
                                success:^(NSURLSessionDataTask *task, id responseObject) {
                                    successBlock(task,responseObject);
                                } failure:^(NSURLSessionDataTask *task, NSError *error) {
                                    
                                }];
    
}

/** 
 * 
 */
//+(NSURLSessionDataTask *)createTaskWithUrl:(NSString *)tempUrl
//                             withGetOrPost:(NSString *)tempGetOrPost
//                                withParams:(NSDictionary *)tempParams
//                     withCompletionHandler:(URLSessionDataTaskHandler)tempCompletionHandler
//{
//    /**
//     用 tempUrl 取得 request
//     
//     */
//    
//    
//    /* 
//     AFHTTPRequestOperation is an all-in-one class for handling HTTP transfers across the network. You tell it that the response should be read as JSON by setting the responseSerializer property to the default JSON serializer. AFNetworking will then take care of parsing the JSON for you.
//     */
//    AFHTTPRequestOperation *requestOperation = [[AFHTTPRequestOperation alloc] initWithRequest:<#(NSURLRequest *)#>];
//    
//}
//
//#pragma mark - private
//+(NSURLRequest *)createRequestWithUrl:(NSString *)tempUrl{
////    NSString *string = [NSString stringWithFormat:@"%@weather.php?format=json", BaseURLString];
////    NSURL *url = [NSURL URLWithString:string];
////    NSURLRequest *request = [NSURLRequest requestWithURL:url];
//    
//    NSString *urlString = [NSString stringWithFormat:[tempUrl ]];
//    
//}

@end


#pragma mark - WebSiteRequest
@implementation WebSiteRequest

-(void)sendRequest{
    
}

-(void)terminateRequest{
    // ?
}

@end

