//
//  GW2_Request_Gems.m
//  WebSiteForGW2Test
//
//  Created by CoodyChou on 2015/6/8.
//  Copyright (c) 2015年 CoodyChou. All rights reserved.
//

#import "GW2_Request_Gems.h"
#import "GW2_WebApi_Gems.h"


#pragma mark - Interface
@interface GW2_Request_Gems()

@property (nonatomic , weak) id < GW2_Request_Gems_Protocol > delegate;

@end


#pragma mark - Implementation
@implementation GW2_Request_Gems

-(id)initWithDelegate:(id<GW2_Request_Gems_Protocol>)tempDelegate{
    self = [super init];
    if ( self ) {
        _delegate = tempDelegate;
    }
    return self;
}

-(void(^)(NSURLSessionDataTask *task, id responseObject , NSError *error))responseBlock{
    return ^(NSURLSessionDataTask *task, id responseObject , NSError *error){
        if ( error != nil ) {
            // TODO: 處理錯誤
            [_delegate gotGemsRequestFailWithErrorMsg:error.description withErrorCode:error.code];
        }
        else{
            [_delegate gotGemsRequestSuccessWithDic:[GW2_WebApi_Gems parserResponse:responseObject]];
        }
    };
}

-(void)setGems:(NSInteger)tempGems{
    self.params = [GW2_WebApi_Gems getGems:tempGems];
}

-(void)sendRequest{
    [WebSiteHelper sendRequestWithTailUrl:[GW2_WebApi_Gems uri]
                               withParams:self.params
                                withBlock:[self responseBlock]];
}



@end
