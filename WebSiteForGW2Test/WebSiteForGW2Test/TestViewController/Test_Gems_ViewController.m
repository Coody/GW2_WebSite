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

#import "GW2_WebApi_Coins.h"
#import "GW2_Request_Coins.h"

/******************************************************
 
 How to use this Api??
 
 1. Create request object
 2. Init Request ( delegate is necessary!! )
 3. Put gems whatever you want
 4. Send request
 5. Implement request's delegate ( success and fail )
 
 ******************************************************/

@interface Test_Gems_ViewController () < BaseViewController_Protocol ,
                                         GW2_Request_Gems_Protocol ,
                                         GW2_Request_Coins_Protocol >
{
    // 1. Create request object
    GW2_Request_Gems *gemsRequest;
    GW2_Request_Coins *coinsRequest;
    
    // you can put gems in textfield
    NSInteger _gem;
    NSInteger _gold;
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
    [self createLabelWithText:@"輸入你想用多少 Gold 換成 Gems？"];
    [self createTextFieldWithDefaultText:@"100"];
    [self endAdd];
    
    // 2. Init Request ( delegate is necessary!! )
    gemsRequest = [[GW2_Request_Gems alloc] initWithDelegate:self];
    coinsRequest = [[GW2_Request_Coins alloc] initWithDelegate:self];
    
}

#pragma mark - Base VC's delegate
-(void)pressedButtonSend:(NSArray *)sender{
//    _gem = [((UITextField *)[sender objectAtIndex:0]).text integerValue];
//    [gemsRequest setGems:_gem];
//    [gemsRequest sendRequest];
    _gold = [((UITextField *)[sender objectAtIndex:0]).text integerValue];
    [coinsRequest setGold:_gold];
    [coinsRequest sendRequest];
    _gem = [((UITextField *)[sender objectAtIndex:0]).text integerValue];
    
    // 3. Put gems whatever you want
    [gemsRequest setGems:_gem];
    
    // 4. Send request
    [gemsRequest sendRequest];
}

// 5. Implement request's delegate ( success and fail )
#pragma mark - Request's delegate
-(void)gotGemsRequestSuccessWithDic:(GW2_WebApi_Gems_Result *)tempGemsResult{
    NSString *resultString = [NSString stringWithFormat:@"{ 1 Gem = %.4f Golds ,\n  %ld Gem can exchange %.4f golds }" , (float)tempGemsResult.coins_per_gem/10000.0f , (long)_gem , (float)tempGemsResult.quantity/10000.0f];
    [self createResultAlertWithString:resultString];
}

-(void)gotGemsRequestFailWithErrorMsg:(NSString *)tempErrorMsg withErrorCode:(NSInteger)tempErrorCode{
    [self createErrorResultAlertWithString:tempErrorMsg
                             withErrorCode:tempErrorCode];
}

#pragma mark - Request's delegate
-(void)gotCoinsRequestSuccessWithDic:(GW2_WebApi_Coins_Result *)tempCoinsResult{
    NSString *resultString = [NSString stringWithFormat:@"{ 1 金 = %.4f Gems ,\n  %ld 金 可以換成 %lld Gems }" , (float)tempCoinsResult.coins_per_gem/10000.0f , (long)_gold , tempCoinsResult.quantity];
    [self createResultAlertWithString:resultString];
}

-(void)gotCoinsRequestFailWithErrorMsg:(NSString *)tempErrorMsg withErrorCode:(NSInteger)tempErrorCode{
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
