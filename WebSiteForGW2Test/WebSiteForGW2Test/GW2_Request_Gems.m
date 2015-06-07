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

-(void)sendRequest{
    [WebSiteHelper sendRequestWithTailUrl:[GW2_WebApi_Gems uri] withSuccessBlock:^(AFHTTPRequestOperation *operation, id responseObject) {
        
    }];
}

@end
