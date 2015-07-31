//
//  GW2_WebApi_Coins.h
//  WebSiteForGW2Test
//
//  Created by Coody on 2015/7/31.
//  Copyright (c) 2015年 CoodyChou. All rights reserved.
//

#import "WebApi.h"

#import "JSONModel.h"


#pragma mark - Result
@interface GW2_WebApi_Coins_Result : JSONModel

/** 
 * @brief - 1 coin = 此數值/10000 （Gem)。
 */
@property (assign , nonatomic) int coins_per_gem;

/**
 * @brief   - 可以換成多少 coins（銅）
 * @details - coinPerGem / 10000 = Gold , exp: 134015(coin)/10000 = 13.4015(Gold)
 * @details - 當輸入 100 Gem = 11~12金（所以請用12金換 100 Gem）
 */
@property (assign , nonatomic) long long quantity;

@end

#pragma mark - WebApi
@interface GW2_WebApi_Coins : WebApi < WebApi_Policy >

+(NSDictionary *)getGold:(NSInteger)tempGold;

@end
