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

// Get
extern NSString *const httpGet;
// Post
extern NSString *const httpPost;

// Response Data Task 的 block
typedef void(^URLSessionDataTaskHandler)(NSURLSessionDataTask *task, id responseObject , NSError *error);

@interface WebSiteHelper : AFHTTPSessionManager

// GW2 官方 Api Version 1 的 url
+(NSString *)getGW2_V1_Url;
// GW2 官方 Api Version 2 的url
+(NSString *)getGW2_V2_Url;

+(WebSiteHelper *)sharedInstance;

+(void)sendRequestWithTailUrl:(NSString *)tempTailUrl
                   withParams:(NSDictionary *)tempParams
                    withBlock:(URLSessionDataTaskHandler)responseBlock;

@end


#pragma mark - WebSiteRequest
@protocol WebSiteRequest_Policy <NSObject>
@required
/** 送出請求 */
- (void) sendRequest;
@optional
/** 中斷請求 */
- (void) terminateRequest;
@end

@interface WebSiteRequest : NSObject

@property (nonatomic, strong) NSDictionary* params;

@end


