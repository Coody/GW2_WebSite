//
//  ViewController.h
//  WebSiteForGW2Test
//
//  Created by CoodyChou on 2015/6/3.
//  Copyright (c) 2015年 CoodyChou. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 * @brief   - 建立測試用的 view 的基本 ViewController
 * @details - 直接繼承後使用
 * @details - 兩個基本方法：
 * @details - [self createLabelWithText:@"ooxx"] 來加入輸入參數的 label
 * @details - [self createTextFieldWithDefaultText:@"xxoo"] 來輸入傳輸參數（可變更）
 */
@interface BasicViewController : UIViewController


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

@end

