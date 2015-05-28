//
//  WebSiteHelper.h
//  GW2BroH
//
//  Created by CoodyChou on 2015/5/25.
//  Copyright (c) 2015年 CoodyChou. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AFHTTPRequestOperation;

extern NSString *const httpGet;
extern NSString *const httpPost;

typedef void(^URLSessionDataTaskHandler)(AFHTTPRequestOperation *operation, id responseObject);

@interface WebSiteHelper : NSObject

//+(NSURLSessionDataTask *)createTaskWithUrl:(NSString *)tempUrl
//                             withGetOrPost:(NSString *)tempGetOrPost
//                                withParams:(NSDictionary *)tempParams
//                     withCompletionHandler:(URLSessionDataTaskHandler)tempCompletionHandler;

@end
