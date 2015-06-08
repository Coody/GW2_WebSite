//
//  GW2_WebApi_Gems.h
//  WebSiteForGW2Test
//
//  Created by CoodyChou on 2015/6/8.
//  Copyright (c) 2015年 CoodyChou. All rights reserved.
//
/*
 send:
 https://api.guildwars2.com/v2/commerce/exchange/gems?quantity=100
 back:
 {"coins_per_gem":1340,"quantity":134015}
 */

#import "WebApi.h"

extern NSString *const GW2_KEY_Coins_Per_Gem;
extern NSString *const GW2_KEY_Quantity;


#pragma mark - Response Result
@interface GW2_WebApi_Gems_Result:NSObject

/** 基本單位 */
@property (nonatomic , strong) NSNumber *coinsPerGem;

/**
 * @brief   - 可以換成多少 coins（銅）
 * @details - coinPerGem / 10000 = Gold , exp: 134015(coin)/10000 = 13.4015(Gold)
 */
@property (nonatomic , strong) NSNumber *quantity;

@end


#pragma mark -
@interface GW2_WebApi_Gems : WebApi < WebApi_Policy >

+(NSDictionary *)getGems:(NSInteger)tempGems;
+(GW2_WebApi_Gems_Result *)parserResponse:(id)responseData;

@end
