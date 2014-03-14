//
//  ViewController.h
//  SWOMC
//
//  Created by RainboW on 14-3-13.
//  Copyright (c) 2014年 RainboW.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITextFieldDelegate>

@property (copy, nonatomic) NSString *userName;
@property (copy, nonatomic) NSString *passWord;

//按return隐藏键盘
- (IBAction)textFiledReturnEditing:(id)sender;

//轻触背景关闭键盘
- (IBAction)backgroundTap:(id)sender;

@end
