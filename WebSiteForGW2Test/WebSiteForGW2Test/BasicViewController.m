//
//  ViewController.m
//  WebSiteForGW2Test
//
//  Created by CoodyChou on 2015/6/3.
//  Copyright (c) 2015年 CoodyChou. All rights reserved.
//

#import "BasicViewController.h"

#define D_Separate (10.0f)
#define D_Hight (30.0f)

#define FRAME_SIZE(TEXT,FONT) [(TEXT) boundingRectWithSize: CGSizeMake( CGFLOAT_MAX, CGFLOAT_MAX) options: NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: FONT} context: nil].size
#define FRAME_SIZE_STATIC_WIDTH(TEXT,FONT,WIDTH) [(TEXT) boundingRectWithSize: CGSizeMake( WIDTH , CGFLOAT_MAX) options: NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: FONT} context: nil].size

@interface BasicViewController ()
{
    NSMutableArray *labelArray;
    NSMutableArray *textFieldArray;
}

@property (nonatomic , strong) UIView *testMainView;
@property (nonatomic , strong) UIView *testResultMainView;
@property (nonatomic , strong) UIScrollView *sendScrollView;
@property (nonatomic , strong) UITextView *resultTextView;

@property (nonatomic , strong) UIButton *sendBtn;

@end

@implementation BasicViewController

-(id)init{
    self = [super init];
    if ( self ) {
        
        // 主要容器 View
        _testMainView = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
        [_testMainView setBackgroundColor:[UIColor colorWithRed:0.5f green:0.5f blue:0.5f alpha:1.0f]];
        
        // 初始化陣列
        labelArray = [[NSMutableArray alloc] init];
        textFieldArray = [[NSMutableArray alloc] init];
        
        // 傳送參數區的 scroll view
        _sendScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - D_Separate*2 - D_Hight*2)];
        [_sendScrollView setBackgroundColor:[UIColor colorWithRed:0.95f green:0.95f blue:0.95f alpha:1.0f]];
        _sendScrollView.layer.masksToBounds = YES;
        _sendScrollView.layer.cornerRadius = 15.0f;
        [_testMainView addSubview:_sendScrollView];
        
        // 建立傳送 button
        [self createSendButton];
               
        // 加入總 view
        [self.view addSubview:_testMainView];
        
        // 處理鍵盤點擊縮放
        if ( &UIViewNoIntrinsicMetric ) {
            UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
            [self.view addGestureRecognizer:tapGesture];
        }
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)createSendButton
{
    _sendBtn = [UIButton buttonWithType:(UIButtonTypeRoundedRect)];
    [_sendBtn setFrame:CGRectMake(D_Separate,
                                  self.view.frame.size.height - D_Separate - D_Hight*2 ,
                                  self.view.frame.size.width - D_Separate*2,
                                  D_Hight*2)];
    [_sendBtn setTitle:@"Send !!" forState:(UIControlStateNormal)];
    [[_sendBtn titleLabel] setFont:[UIFont boldSystemFontOfSize:30.0f]];
    [_sendBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [_sendBtn setBackgroundColor:[UIColor colorWithRed:0.95f green:0.95f blue:0.95f alpha:1.0f]];
    _sendBtn.layer.borderColor=[UIColor blackColor].CGColor;
    _sendBtn.layer.borderWidth=5.0f;
    _sendBtn.layer.masksToBounds = YES;
    _sendBtn.layer.cornerRadius = 10.0f;
    [_sendBtn addTarget:self action:@selector(pressedSendBtn) forControlEvents:UIControlEventTouchUpInside];
    [_testMainView addSubview:_sendBtn];
}

-(void)createResultAlertWithString:(NSString *)tempString{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"結果："
                                                    message:tempString
                                                   delegate:nil
                                          cancelButtonTitle:@"確定"
                                          otherButtonTitles:nil];
    [alert show];
}

-(void)createErrorResultAlertWithString:(NSString *)tempString withErrorCode:(NSInteger)tempErrorCode{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:@"錯誤!（code:%ld）" , (long)tempErrorCode]
                                                    message:tempString
                                                   delegate:nil
                                          cancelButtonTitle:@"確定"
                                          otherButtonTitles:nil];
    [alert show];
}

#pragma mark - Send Button
-(void)pressedSendBtn{
    // TODO:
    
    NSLog(@" Send !!");
    
    if ( [_delegate respondsToSelector:@selector(pressedButtonSend:)] ) {
        [_delegate pressedButtonSend:textFieldArray];
    }
    else{
        NSLog(@" \n\n*****\n\n  You have to Implement BaseViewController_Protocol's Delegate !!!! \n\n*****\n\n");
    }
}

#pragma mark - Label
-(void)createLabelWithText:(NSString *)tempText
{
    UILabel *label = [[UILabel alloc] init];
    [label setFrame:CGRectMake(D_Separate ,
                               D_Separate + ([labelArray count] + [textFieldArray count])*(D_Hight + D_Separate) ,
                               self.view.frame.size.width - D_Separate*2 ,
                               D_Hight)];
    [label setText:[NSString stringWithFormat:@"  %@ :" , tempText]];
    [label setTextColor:[UIColor blackColor]];
    [label setFont:[UIFont systemFontOfSize:16.0f]];
    [label setTag:([labelArray count]+1)];
    label.layer.masksToBounds = YES;
    label.layer.cornerRadius = 4.0f;
    [label setBackgroundColor:[UIColor colorWithRed:0.86f green:0.86f blue:0.86f alpha:1.0f]];
    [labelArray addObject:label];
    [_sendScrollView addSubview:label];
}

#pragma mark - TextField
-(void)createTextFieldWithDefaultText:(NSString *)tempText
{
    UITextField *textField = [[UITextField alloc] init];
    [textField setFrame:CGRectMake(D_Separate ,
                                   D_Separate + ([labelArray count] + [textFieldArray count])*(D_Hight + D_Separate),
                                   self.view.frame.size.width - D_Separate*2,
                                   D_Hight)];
    [textField setText:[NSString stringWithFormat:@"  %@" , tempText]];
    [textField setTextColor:[UIColor blackColor]];
    [textField setFont:[UIFont systemFontOfSize:16.0f]];
    [textField setTag:[textFieldArray count]+1];
    textField.layer.masksToBounds = YES;
    textField.layer.cornerRadius = 4.0f;
    [textField setBackgroundColor:[UIColor colorWithRed:0.76f green:0.76f blue:0.76f alpha:1.0f]];
    [textFieldArray addObject:textField];
    [_sendScrollView addSubview:textField];
}

#pragma mark - end
-(void)endAdd{
    if ( self.view.frame.size.height - D_Separate*2 - D_Hight*2 < D_Separate + ([labelArray count] + [textFieldArray count])*(D_Hight + D_Separate) ) {
        _sendScrollView.contentSize = CGSizeMake(_sendScrollView.frame.size.width, D_Separate*3 + ([labelArray count] + [textFieldArray count])*(D_Hight + D_Separate));
    }
}

#pragma mark - 點擊觸碰縮回鍵盤
-(void)tap:(id)sender{
    [self.view endEditing:YES];
}

@end
