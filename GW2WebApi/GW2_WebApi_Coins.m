//
//  GW2_WebApi_Coins.m
//  WebSiteForGW2Test
//
//  Created by Coody on 2015/7/31.
//  Copyright (c) 2015年 CoodyChou. All rights reserved.
//

#import "GW2_WebApi_Coins.h"


#pragma mark - Result
@implementation GW2_WebApi_Coins_Result
@end


#pragma mark - WebApi
@implementation GW2_WebApi_Coins

+(NSString *)uri{
    return @"commerce/exchange/coins";
}

+(NSDictionary *)getGold:(NSInteger)tempGold{
    return @{@"quantity":[NSNumber numberWithInteger:tempGold*10000]};
}

+(GW2_WebApi_Coins_Result *)parserResponse:(id)responseData{
    NSError *error;
    GW2_WebApi_Coins_Result *result = [[GW2_WebApi_Coins_Result alloc] initWithDictionary:responseData
                                                                                    error:&error];
    if ( error ) {
        NSLog(@"%@ : %@ , error description: %@" , NSStringFromClass([self class]) , NSStringFromSelector(_cmd) , error.description );
    }
    return result;
}

@end
