//
//  ViewController.m
//  SWOMC
//
//  Created by RainboW on 14-3-13.
//  Copyright (c) 2014年 RainboW.com. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *userNameTextField;

@property (weak, nonatomic) IBOutlet UITextField *passWordTextField;

- (IBAction)changeGreeting:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)textFiledReturnEditing:(id)sender {
    [sender resignFirstResponder];
}

- (IBAction)backgroundTap:(id)sender {
    [self.userNameTextField resignFirstResponder];
    [self.passWordTextField resignFirstResponder];
}


- (IBAction)changeGreeting:(id)sender {
    //用户名
    self.userName = self.userNameTextField.text;
    //密码
    self.passWord = self.passWordTextField.text;
    
    NSString *userNameStr = self.userName;
    if ([userNameStr length] == 0) {
        userNameStr = @"1";
    }
    
    NSString *passWordStr = self.passWord;
    if ([passWordStr length] == 0) {
        passWordStr = @"2";
    }
    
    NSString *result = [[NSString alloc] initWithFormat:@"userName=%@&passWord=%@",userNameStr,passWordStr];
    
    NSLog(@"username: %@",userNameStr);
    NSLog(@"password: %@",passWordStr);
    NSLog(@"result: %@",result);
    
    
    //http请求,验证用户
    //创建url
    NSURL *url = [NSURL URLWithString:@"http://192.168.111.238/ios/checkUser"];
    //创建请求
     NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:30];
    //设置请求类型
    [request setHTTPMethod:@"POST"];
    //NSString *params = @"type=focus-c";//设置参数
    NSData *data = [result dataUsingEncoding:NSUTF8StringEncoding];
    [request setHTTPBody:data];
    //返回值
    NSData *received = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    //将返回值转成字符串
    NSString *backResult = [[NSString alloc]initWithData:received encoding:NSUTF8StringEncoding];
    
    NSLog(@"%@",backResult);
    
    //alert提示信息初始化
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Title" message:@"message" delegate:self cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
    alertView.title = @"Title";
    alertView.message = backResult;
    //显示alert
    [alertView show];
}

@end
