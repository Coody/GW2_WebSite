//
//  GW2_WebApi_Gems.m
//  WebSiteForGW2Test
//
//  Created by CoodyChou on 2015/6/8.
//  Copyright (c) 2015年 CoodyChou. All rights reserved.
//

#import "GW2_WebApi_Gems.h"

// {"coins_per_gem":1340,"quantity":134015}
NSString *const GW2_KEY_Coins_Per_Gem = @"coins_per_gem";
NSString *const GW2_KEY_Quantity = @"quantity";

#pragma mark - 
@implementation GW2_WebApi_Gems_Result
@end

#pragma mark -
@interface GW2_WebApi_Gems()
@property (nonatomic) NSUInteger gems;
@end

@implementation GW2_WebApi_Gems

+(NSString *)uri{
    return @"commerce/exchange/gems";
}

+(NSDictionary *)getGems:(NSInteger)tempGems{
    return @{ @"quantity" : [NSNumber numberWithInteger:tempGems] };
}

+ (GW2_WebApi_Gems_Result *) parserResponse:(id)responseData
{
    GW2_WebApi_Gems_Result *gemResult = [GW2_WebApi_Gems_Result new];
    
    gemResult.coinsPerGem = [responseData objectForKey:GW2_KEY_Coins_Per_Gem];
    gemResult.quantity = [responseData objectForKey:GW2_KEY_Quantity];
    
    return gemResult;
}

@end
