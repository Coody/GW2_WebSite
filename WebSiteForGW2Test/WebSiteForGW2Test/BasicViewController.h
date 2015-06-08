//
//  ViewController.h
//  WebSiteForGW2Test
//
//  Created by CoodyChou on 2015/6/3.
//  Copyright (c) 2015年 CoodyChou. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol BaseViewController_Protocol <NSObject>

@required
-(void)pressedButtonSend:(NSArray *)sender;

@end

/**
 * @brief   - 建立測試用的 view 的基本 ViewController
 * @details - 直接繼承後使用
 * @details - 兩個基本方法：
 * @details - [self createLabelWithText:@"ooxx"] 來加入輸入參數的 label
 * @details - [self createTextFieldWithDefaultText:@"xxoo"] 來輸入傳輸參數（可變更）
 */
@interface BasicViewController : UIViewController

@property (nonatomic , weak) id < BaseViewController_Protocol > delegate;

/**
 * @brief   - 建立排序的 UILabel（ 一個 label + 一個 textField ）
 * @warning - 請直接建立不用設定 frame
 * @details -
 */
-(void)createLabelWithText:(NSString *)tempText;

/**
 * @brief   - 建立排序的 UITextField（ 一個 label + 一個 textField ）
 * @warning - 請直接建立不用設定 frame
 * @details -
 */
-(void)createTextFieldWithDefaultText:(NSString *)tempText;

/**
 * @brief   - 結束編輯頁面
 * @details - 會重新整理畫面並且調整 scroll view
 */
-(void)endAdd;

/** 結果，使用 UIAlertView 顯示 */
-(void)createResultAlertWithString:(NSString *)tempString;

/** 錯誤，使用 UIAlertView 顯示 error code , 以及 error message */
-(void)createErrorResultAlertWithString:(NSString *)tempString
                          withErrorCode:(NSInteger)tempErrorCode;

@end

