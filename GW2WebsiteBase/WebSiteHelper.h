//
//  WebSiteHelper.h
//  GW2BroH
//
//  Created by CoodyChou on 2015/5/25.
//  Copyright (c) 2015年 CoodyChou. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AFHTTPSessionManager.h"


#pragma mark - WebSiteHelper
@class AFHTTPRequestOperation;

extern NSString *const httpGet;
extern NSString *const httpPost;

typedef void(^URLSessionDataTaskHandler)(NSURLSessionDataTask *task, id responseObject);

@protocol WeatherHTTPClientDelegate;

@interface WebSiteHelper : AFHTTPSessionManager

@property (nonatomic, weak) id <WeatherHTTPClientDelegate> delegate;

//+(NSURLSessionDataTask *)createTaskWithUrl:(NSString *)tempUrl
//                             withGetOrPost:(NSString *)tempGetOrPost
//                                withParams:(NSDictionary *)tempParams
//                     withCompletionHandler:(URLSessionDataTaskHandler)tempCompletionHandler;

+(NSString *)getGW2_V1_Url;

+(NSString *)getGW2_V2_Url;

+(WebSiteHelper *)sharedInstance;

+(void)sendRequestWithTailUrl:(NSString *)tempTailUrl withSuccessBlock:(URLSessionDataTaskHandler)successBlock;

@end


#pragma mark - WebSiteRequest
@interface WebSiteRequest : NSObject

/** 送出請求 */
- (void) sendRequest;

/** 中斷請求 */
- (void) terminateRequest;

@end


