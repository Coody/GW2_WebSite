//
//  Test_ViewController_Demo.m
//  WebSiteForGW2Test
//
//  Created by CoodyChou on 2015/6/3.
//  Copyright (c) 2015年 CoodyChou. All rights reserved.
//

#import "Test_Demo_ViewController.h"

@interface Test_Demo_ViewController () <BaseViewController_Protocol>

@end

@implementation Test_Demo_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    // 只要加按鈕就好
    [self createLabelWithText:@"這是測試範例"];
    [self createTextFieldWithDefaultText:@"Test"];
    
    [self createLabelWithText:@"1.請繼承此 ViewController"];
    [self createTextFieldWithDefaultText:@""];
    
    [self createLabelWithText:@"2.請直接使用方法 create Label"];
    [self createTextFieldWithDefaultText:@""];
    
    [self createLabelWithText:@"3.請直接使用方法 create TextField"];
    [self createTextFieldWithDefaultText:@""];
    
    [self createLabelWithText:@"4.請實作 pressedButtonSend:"];
    [self createTextFieldWithDefaultText:@"ps:參數為 UITextField 的 Array"];
    
    [self createLabelWithText:@"5.請用 endAdd 結束 view 的處理"];
    [self createTextFieldWithDefaultText:@""];
    
    [self createLabelWithText:@"6.記得去 AppDelegate 替換成此 viewController"];
    [self createTextFieldWithDefaultText:@""];
       
    // 記得加完結束通知一下
    [self endAdd];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Base VC's delegate
-(void)pressedButtonSend:(NSArray *)sender{
    // TODO: send request
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
