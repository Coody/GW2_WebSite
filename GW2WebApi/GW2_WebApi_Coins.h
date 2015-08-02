//
//  GW2_WebApi_Coins.h
//  WebSiteForGW2Test
//
//  Created by Coody on 2015/7/31.
//  Copyright (c) 2015年 CoodyChou. All rights reserved.
//
/*
 send:
 https://api.guildwars2.com/v2/commerce/exchange/coins?quantity=100000
 back:
 {
 "coins_per_gem": 1363,
 "quantity": 73
 }
 */


#import "WebApi.h"

#import "JSONModel.h"


#pragma mark - Result
@interface GW2_WebApi_Coins_Result : JSONModel

/** 
 * @brief - 1 coin = 此數值/10000 （Gold)。
 */
@property (assign , nonatomic) float coins_per_gem;

/**
 * @brief   - 可以換成多少 Gems
 * @details - coins_per_gem , 多少 Gems
 * @details - 當輸入 10 Gold = 73 Gems
 */
@property (assign , nonatomic) long long quantity;

@end

#pragma mark - WebApi
@interface GW2_WebApi_Coins : WebApi < WebApi_Policy >

+(NSDictionary *)getGold:(NSInteger)tempGold;
+(GW2_WebApi_Coins_Result *)parserResponse:(id)responseData;

@end
