//
//  GW2_Request_Coins.h
//  WebSiteForGW2Test
//
//  Created by CoodyChou on 2015/8/2.
//  Copyright (c) 2015年 CoodyChou. All rights reserved.
//

#import "WebSiteRequest.h"

#import "GW2_WebApi_Coins.h"


#pragma mark - Protocol
@protocol GW2_Request_Coins_Protocol <NSObject>

/** 成功 */
-(void)gotCoinsRequestSuccessWithDic:(GW2_WebApi_Coins_Result *)tempCoinsResult;
/** 失敗 */
-(void)gotCoinsRequestFailWithErrorMsg:(NSString *)tempErrorMsg
                         withErrorCode:(NSInteger)tempErrorCode;

@end


#pragma mark - Request
@interface GW2_Request_Coins : WebSiteRequest <WebSiteRequest_Policy>

-(id)initWithDelegate:(id)tempDelegate;
-(void)setGold:(NSInteger)tempGolds;

@end
