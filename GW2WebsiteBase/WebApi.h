//
//  WebApi.h
//  WebSiteForGW2Test
//
//  Created by CoodyChou on 2015/6/5.
//  Copyright (c) 2015年 CoodyChou. All rights reserved.
//

#import <Foundation/Foundation.h>

/** 
 * @brief   - 如要撰寫新的 WebApi ，請實作此 Policy ，並且使用內部定義的方法來取得完整網址
 */
@protocol WebApi_Policy <NSObject>

@required
/**
 * @brief   - 請實作這個 WebApi 是要詢問什麼東西
 * @details - exp: 如果是物品，請裡面直接寫 
 * @details - return @"items";
 */
+(NSString *)uri;

@end

@interface WebApi : NSObject

//+(NSString *)getGW2_Tail_Request_Url_WithClass:(Class <WebApi_Policy> )tempClass;

@end
