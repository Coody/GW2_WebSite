//
//  GW2_Request_Items.m
//  WebSiteForGW2Test
//
//  Created by CoodyChou on 2015/6/14.
//  Copyright (c) 2015年 CoodyChou. All rights reserved.
//

#import "GW2_Request_Items.h"

#import "GW2_WebApi_Items.h"

@implementation GW2_Request_Items

-(id)initWithDelegate:(id<GW2_Request_Items_Protocol>)tempDelegate{
    self = [super init];
    if ( self ) {
        _delegate = tempDelegate;
    }
    return self;
}

-(void(^)(NSURLSessionDataTask *task, id responseObject , NSError *error))responseBlock{
    __weak __typeof(self) weakSelf = self;
    return ^(NSURLSessionDataTask *task, id responseObject , NSError *error){
        __strong __typeof(weakSelf) strongSelf = weakSelf;
        if ( error != nil ) {
            [strongSelf->_delegate gotItemIdsFailWithErrorMsg:error.description withErrorCode:error.code];
        }
        else{
            [strongSelf->_delegate gotItemIdsSuccessWithArray:[GW2_WebApi_Items parserResponse:responseObject]];
        }
    };
}

-(void)sendRequest{
    [WebSiteHelper sendRequestWithTailUrl:[GW2_WebApi_Items uri]
                               withParams:nil
                                withBlock:[self responseBlock]];
}

@end
