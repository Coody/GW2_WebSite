//
//  Test_ViewController_Gems.m
//  WebSiteForGW2Test
//
//  Created by CoodyChou on 2015/6/8.
//  Copyright (c) 2015年 CoodyChou. All rights reserved.
//

#import "Test_ViewController_Gems.h"

#import "GW2_WebApi_Gems.h"
#import "GW2_Request_Gems.h"

@interface Test_ViewController_Gems () < BaseViewController_Protocol , GW2_Request_Gems_Protocol >
{
    GW2_Request_Gems *gemsRequest;
}

@end

@implementation Test_ViewController_Gems

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    self.delegate = self;
    
    // 顯示介面
    [self createLabelWithText:@"輸入 Gems"];
    [self createTextFieldWithDefaultText:@"100"];
    [self endAdd];
    
    // 處理 Request
    gemsRequest = [[GW2_Request_Gems alloc] initWithDelegate:self];
    
}

#pragma mark - Base VC's delegate
-(void)pressedButtonSend:(NSArray *)sender{
    [gemsRequest setGems:[((UITextField *)[sender objectAtIndex:0]).text integerValue]];
    [gemsRequest sendRequest];
}

#pragma mark - Request's delegate
-(void)gotGemsRequestSuccessWithDic:(GW2_WebApi_Gems_Result *)tempGemsResult{
    NSString *resultString = [NSString stringWithFormat:@"{ %@ : %@ ,\n  %@ : %@ }" , GW2_KEY_Coins_Per_Gem , tempGemsResult.coinsPerGem , GW2_KEY_Quantity , tempGemsResult.quantity];
    [self createResultAlertWithString:resultString];
}

-(void)gotGemsRequestFailWithErrorMsg:(NSString *)tempErrorMsg withErrorCode:(NSInteger)tempErrorCode{
    [self createErrorResultAlertWithString:tempErrorMsg
                             withErrorCode:tempErrorCode];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
