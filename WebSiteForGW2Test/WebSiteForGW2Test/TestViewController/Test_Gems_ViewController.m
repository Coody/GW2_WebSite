//
//  Test_ViewController_Gems.m
//  WebSiteForGW2Test
//
//  Created by CoodyChou on 2015/6/8.
//  Copyright (c) 2015年 CoodyChou. All rights reserved.
//

#import "Test_Gems_ViewController.h"

#import "GW2_WebApi_Gems.h"
#import "GW2_Request_Gems.h"

@interface Test_Gems_ViewController () < BaseViewController_Protocol , GW2_Request_Gems_Protocol >
{
    GW2_Request_Gems *gemsRequest;
    NSInteger _gem;
}

@end

@implementation Test_Gems_ViewController

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
    [self createLabelWithText:@"輸入你想用多少 Gem 換成金？"];
    [self createTextFieldWithDefaultText:@"100"];
    [self endAdd];
    
    // 處理 Request
    gemsRequest = [[GW2_Request_Gems alloc] initWithDelegate:self];
    
}

#pragma mark - Base VC's delegate
-(void)pressedButtonSend:(NSArray *)sender{
    _gem = [((UITextField *)[sender objectAtIndex:0]).text integerValue];
    [gemsRequest setGems:_gem];
    [gemsRequest sendRequest];
}

#pragma mark - Request's delegate
-(void)gotGemsRequestSuccessWithDic:(GW2_WebApi_Gems_Result *)tempGemsResult{
    NSString *resultString = [NSString stringWithFormat:@"{ 1 Gem = %.4f 金 ,\n  %ld Gem 可以換成 %.4f 金 }" , (float)tempGemsResult.coins_per_gem/10000.0f , (long)_gem , (float)tempGemsResult.quantity/10000.0f];
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
