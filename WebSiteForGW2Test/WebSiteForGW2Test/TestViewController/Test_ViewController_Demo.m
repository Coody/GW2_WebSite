//
//  Test_ViewController_Demo.m
//  WebSiteForGW2Test
//
//  Created by CoodyChou on 2015/6/3.
//  Copyright (c) 2015年 CoodyChou. All rights reserved.
//

#import "Test_ViewController_Demo.h"

@interface Test_ViewController_Demo ()

@end

@implementation Test_ViewController_Demo

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    // 只要加按鈕就好
    [self createLabelWithText:@"這是測試範例"];
    [self createTextFieldWithDefaultText:@"Test"];
    
    [self createLabelWithText:@"這是測試範例"];
    [self createTextFieldWithDefaultText:@"Test"];
    
    [self createLabelWithText:@"這是測試範例"];
    [self createTextFieldWithDefaultText:@"Test"];
    
    [self createLabelWithText:@"這是測試範例"];
    [self createTextFieldWithDefaultText:@"Test"];
    
    [self createLabelWithText:@"這是測試範例"];
    [self createTextFieldWithDefaultText:@"Test"];
    
    [self createLabelWithText:@"這是測試範例"];
    [self createTextFieldWithDefaultText:@"Test"];
    
    [self createLabelWithText:@"這是測試範例"];
    [self createTextFieldWithDefaultText:@"Test"];
    
    [self createLabelWithText:@"這是測試範例"];
    [self createTextFieldWithDefaultText:@"Test"];
    
    [self createLabelWithText:@"這是測試範例"];
    [self createTextFieldWithDefaultText:@"Test"];
    
    // 記得加完結束通知一下
    [self endAdd];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
