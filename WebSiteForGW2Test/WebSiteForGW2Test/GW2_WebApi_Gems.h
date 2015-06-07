//
//  GW2_WebApi_Gems.h
//  WebSiteForGW2Test
//
//  Created by CoodyChou on 2015/6/8.
//  Copyright (c) 2015年 CoodyChou. All rights reserved.
//
/*
 send:
 https://api.guildwars2.com/v2/commerce/exchange/coins?quantity=100000
 back:
 {"coins_per_gem":1851,"quantity":54}
 */


#import "WebApi.h"


#pragma mark - Response Result
@interface GW2_WebApi_Gems_Result:NSObject

@property (nonatomic , strong) NSNumber *coinsPerGem;
@property (nonatomic , strong) NSNumber *quantity;

@end

#pragma mark -
@interface GW2_WebApi_Gems : WebApi < WebApi_Policy >

+(GW2_WebApi_Gems_Result *)parserResponse:(NSData *)responseData;

@end
