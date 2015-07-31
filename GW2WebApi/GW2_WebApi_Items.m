//
//  GW2_WebApi_Items.m
//  WebSiteForGW2Test
//
//  Created by CoodyChou on 2015/6/10.
//  Copyright (c) 2015年 CoodyChou. All rights reserved.
//

/*
 send: https://api.guildwars2.com/v2/items/28445
 receive:
 
 */

#import "GW2_WebApi_Items.h"


@implementation GW2_WebApi_Items_Result_Unit

@end


@implementation GW2_WebApi_Items_Result

@end


@implementation GW2_WebApi_Items

+(NSString *)uri{
    return @"items";
}

+(GW2_WebApi_Items_Result *)parserResponse:(id)responseData{
    NSError *error;
    GW2_WebApi_Items_Result *result = [[GW2_WebApi_Items_Result alloc] initWithData:responseData error:&error];
    if ( error != nil ) {
        // TODO: 處理 error
    }
    result.itemId = responseData;
    return result;
}

@end
