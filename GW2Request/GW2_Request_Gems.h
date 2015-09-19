//
//  GW2_Request_Gems.h
//  WebSiteForGW2Test
//
//  Created by CoodyChou on 2015/6/8.
//  Copyright (c) 2015年 CoodyChou. All rights reserved.
//

#import "WebSiteRequest.h"

#import "GW2_WebApi_Gems.h"

@protocol GW2_Request_Gems_Protocol <NSObject>

/** 成功 */
-(void)gotGemsRequestSuccessWithDic:(GW2_WebApi_Gems_Result *)tempGemsResult;
/** 失敗 */
-(void)gotGemsRequestFailWithErrorMsg:(NSString *)tempErrorMsg
                        withErrorCode:(NSInteger)tempErrorCode;

@end

@interface GW2_Request_Gems : WebSiteRequest < WebSiteRequest_Policy >

-(void)setGems:(NSInteger)tempGems;
-(id)initWithDelegate:( id < GW2_Request_Gems_Protocol > ) tempDelegate;

@end
