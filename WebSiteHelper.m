//
//  WebSiteHelper.m
//  GW2BroH
//
//  Created by CoodyChou on 2015/5/25.
//  Copyright (c) 2015年 CoodyChou. All rights reserved.
//
// 參考自：http://www.raywenderlich.com/59255/afnetworking-2-0-tutorial
//

#import "WebSiteHelper.h"

#import "AFNetworking.h"

#pragma mark - get & post
NSString *const httpGet = @"get";
NSString *const httpPost = @"post";

#pragma mark -
@implementation WebSiteHelper

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
