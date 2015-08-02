//
//  GW2_Request_Coins.m
//  WebSiteForGW2Test
//
//  Created by CoodyChou on 2015/8/2.
//  Copyright (c) 2015年 CoodyChou. All rights reserved.
//

#import "GW2_Request_Coins.h"

#import "GW2_WebApi_Coins.h"

@interface GW2_Request_Coins()

@property (nonatomic , weak) id <GW2_Request_Coins_Protocol> delegate;

@end

@implementation GW2_Request_Coins

-(id)initWithDelegate:(id)tempDelegate{
    self = [super init];
    if ( self != nil ) {
        _delegate = tempDelegate;
    }
    return self;
}

-(void(^)(NSURLSessionDataTask *task, id responseObject , NSError *error))responseBlock{
    return ^(NSURLSessionDataTask *task, id responseObject , NSError *error){
        if ( error != nil ) {
            // TODO: 處理錯誤
            [_delegate gotCoinsRequestFailWithErrorMsg:error.description withErrorCode:error.code];
        }
        else{
            [_delegate gotCoinsRequestSuccessWithDic:[GW2_WebApi_Coins parserResponse:responseObject]];
        }
    };
}

-(void)setGold:(NSInteger)tempGolds{
    self.params = [GW2_WebApi_Coins getGold:tempGolds];
}

-(void)sendRequest{
    [WebSiteHelper sendRequestWithTailUrl:[GW2_WebApi_Coins uri]
                               withParams:self.params
                                withBlock:[self responseBlock]];
}

@end
