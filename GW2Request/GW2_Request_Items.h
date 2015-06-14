//
//  GW2_Request_Items.h
//  WebSiteForGW2Test
//
//  Created by CoodyChou on 2015/6/14.
//  Copyright (c) 2015年 CoodyChou. All rights reserved.
//

#import "WebSiteHelper.h"

@class GW2_WebApi_Items_Result;

@protocol GW2_Request_Items_Protocol <NSObject>

/** 成功 */
-(void)gotItemIdsSuccessWithArray:(GW2_WebApi_Items_Result *)tempItemIds;
/** 失敗 */
-(void)gotItemIdsFailWithErrorMsg:(NSString *)tempErrorMsg
                    withErrorCode:(NSInteger)tempErrorCode;

@end

@interface GW2_Request_Items : WebSiteRequest

@property (nonatomic , weak) id < GW2_Request_Items_Protocol >delegate;

-(id)initWithDelegate:(id < GW2_Request_Items_Protocol >)tempDelegate;

@end
