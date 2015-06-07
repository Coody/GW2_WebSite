//
//  GW2_WebApi_Gems.m
//  WebSiteForGW2Test
//
//  Created by CoodyChou on 2015/6/8.
//  Copyright (c) 2015年 CoodyChou. All rights reserved.
//

#import "GW2_WebApi_Gems.h"


#pragma mark - 
@implementation GW2_WebApi_Gems_Result
@end

#pragma mark -
@implementation GW2_WebApi_Gems

+(NSString *)uri{
    return @"commerce/exchange/coins";
}

+(NSDictionary *)params{
    return @{@"quantity":@(100000)};
}

+ (GW2_WebApi_Gems_Result *) parserResponse:(NSData *)responseData
{
    GW2_WebApi_Gems_Result *gemResult = [GW2_WebApi_Gems_Result new];
    
    
//    @try
//    {
//        NSError *error;
//        NSDictionary *responseDic = [NSJSONSerialization JSONObjectWithData:responseData options:kNilOptions error:&error];
//        
//        if (error)
//        {
//            reVal.detail = [error description];
//        }
//        else if (nil == responseDic)
//        {
//            reVal.detail = @"nil == responseDic";
//        }
//        else
//        {
//            NSNumber *resultCode = [responseDic objectForKey:@"ResultCode"];
//            
//            if (resultCode)
//            {
//                reVal.isParsedOK = YES;
//                reVal.result = [resultCode intValue];
//                
//                reVal.resultMessage = [responseDic objectForKey:@"ResultMsg"];
//                
//                NSMutableArray *infos = [NSMutableArray array];
//                NSArray *jsonArray = [responseDic objectForKey:@"Data"];
//                for (NSDictionary *jsonObj in jsonArray)
//                {
//                    InApp_Product_Info *info = [InApp_Product_Info new];
//                    
//                    info.skuID = [jsonObj objectForKey:@"SkuId"];
//                    info.identifier = [jsonObj objectForKey:@"Name"];
//                    info.value = [jsonObj objectForKey:@"Value"];
//                    info.productDescription = [jsonObj objectForKey:@"Description"];
//                    
//                    [infos addObject:info];
//                }
//                
//                if ([infos count])
//                {
//                    reVal.infos = [infos copy];
//                }
//            }
//            else
//            {
//                reVal.detail = @"nil == resultCode";
//            }
//        }
//    }
//    @catch (NSException *exception)
//    {
//        reVal.isParsedOK = NO;
//        reVal.detail = exception.description;
//    }
    
    return gemResult;
}

@end
