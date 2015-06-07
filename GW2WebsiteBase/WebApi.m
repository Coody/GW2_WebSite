//
//  WebApi.m
//  WebSiteForGW2Test
//
//  Created by CoodyChou on 2015/6/5.
//  Copyright (c) 2015年 CoodyChou. All rights reserved.
//
//  GW2 WebApi 參考：https://wiki.guildwars2.com/wiki/API:2
//



#import "WebApi.h"


@implementation WebApi

+(NSString *)getGW2_Tail_Request_Url_WithClass:(Class<WebApi_Policy>)tempClass
{
    
    NSMutableString *fullUrl = [[NSMutableString alloc] init];
    
    // 加入 Uri
    if ( [tempClass uri] ) {
        [fullUrl appendFormat:@"/%@",[tempClass uri]];
    }
    
    // 加入 params (如果 params 裡面還有 array ，會再兜一層)
    if ( [tempClass params] ) {
        for ( id key in [[tempClass params] allKeys] ) {
            
            // 兜 key
            [fullUrl appendFormat:@"?%@=" , key ];
            
            // 先檢視 value 的資料型態
            id value = [[tempClass params] objectForKey:key];
            
            // 是否為 NSArray ?
            if ( [value isMemberOfClass:[NSArray class]] ) {
                
                // 是
                id checkLastObject = [NSString stringWithFormat:@"%@" , [[value allObjects] lastObject]];
                for ( id members in [value allObjects] ) {
                    if ( [[NSString stringWithFormat:@"%@" , members] isEqualToString:checkLastObject] ) {
                        [fullUrl appendFormat:@"%@" , members];
                    }
                    else{
                        [fullUrl appendFormat:@"%@," , members];
                    }
                }
            }
            else{
                // 否，直接兜
                [fullUrl appendFormat:@"%@" , value];
            }
        }
    }
    return fullUrl;
}

+(NSString *)getGW2_Tail_Request_Url_WithClass:(Class <WebApi_Policy> )tempClass
                            withSpecialPolicy:(id)tempParams
{
    NSMutableString *fullUrl = [[NSMutableString alloc] init];
    
    // 加入 Uri
    if ( [tempClass uri] ) {
        [fullUrl appendFormat:@"/%@",[tempClass uri]];
    }
    
    // 加入 params (如果 params 裡面還有 array ，會再兜一層)
    if ( [tempClass params] ) {
        for ( id key in [[tempClass params] allKeys] ) {
            
            // 兜 key
            [fullUrl appendFormat:@"?%@=" , key ];
            [fullUrl appendFormat:@"%@" , [[tempClass params] objectForKey:key]];
            
        }
    }
    return fullUrl;
}

@end
