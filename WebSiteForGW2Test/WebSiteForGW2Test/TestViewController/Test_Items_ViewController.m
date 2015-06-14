//
//  Test_Items_ViewController.m
//  WebSiteForGW2Test
//
//  Created by CoodyChou on 2015/6/14.
//  Copyright (c) 2015年 CoodyChou. All rights reserved.
//

#import "Test_Items_ViewController.h"

#import "GW2_WebApi_Items.h"
#import "GW2_Request_Items.h"

@interface Test_Items_ViewController ()< BaseViewController_Protocol , GW2_Request_Items_Protocol >
{
    GW2_Request_Items *itemsRequest;
}
@end

@implementation Test_Items_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    self.delegate = self;
    [self createLabelWithText:@"取得 item ids"];
    [self endAdd];
    
    itemsRequest = [[GW2_Request_Items alloc] initWithDelegate:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)pressedButtonSend:(NSArray *)sender{
    [itemsRequest sendRequest];
}

-(void)gotItemIdsSuccessWithArray:(GW2_WebApi_Items_Result *)tempItemIds{
    NSLog(@"\n%@\n" , tempItemIds.itemId);
}

-(void)gotItemIdsFailWithErrorMsg:(NSString *)tempErrorMsg withErrorCode:(NSInteger)tempErrorCode{
    [self createErrorResultAlertWithString:tempErrorMsg withErrorCode:tempErrorCode];
}

@end
