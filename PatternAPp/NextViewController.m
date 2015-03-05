//
//  NextViewController.m
//  PatternAPp
//
//  Created by china317 on 14/11/26.
//  Copyright (c) 2014年 china317. All rights reserved.
//

#import "NextViewController.h"
#import <JavaScriptCore/JavaScriptCore.h>


@interface NextViewController ()

@end

@implementation NextViewController

@synthesize numericTextField;

#pragma -mark viewProtocol
-(BOOL)clickTapped
{
    return YES;
}


- (void)willTransitionToTraitCollection:(UITraitCollection *)newCollection withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator
{
    [super willTransitionToTraitCollection:newCollection withTransitionCoordinator:coordinator];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"next";

    NSArray *array = NSSearchPathForDirectoriesInDomains(NSDocumentationDirectory, NSUserDomainMask, YES);
    NSLog(@"%@",array[0]);
    JSContext *context = [[JSContext alloc] init];
    
    Box *box = [[Box alloc] init];
    NSLog(@"%@",box.volume);
    adView.frame = CGRectOffset(adView.frame, 0, -50);
    adView.delegate =self;
    bannerIsVisible = NO;
    
    [self parseString];
    [self parseNumber];
}

- (void)test:(dbBlock)block
{
    if (block) {
        
    }
}

#pragma -mark ADBannerViewDelegate
- (void)bannerView:(ADBannerView *)banner didFailToReceiveAdWithError:(NSError *)error
{
    
}

-(void)bannerViewDidLoadAd:(ADBannerView *)banner
{
    if (!bannerIsVisible) {
        [UIView beginAnimations:@"AdBanner" context:NULL];
        adView.frame = CGRectOffset(adView.frame, 0, 50);
        [UIView commitAnimations];
        bannerIsVisible = YES;
    }
}

//组装一个字符串，需要把里面的网址解析出来
-(void)parseString{
    NSString *urlString=@"sfdsfhttp://www.baidu.com";
    //NSRegularExpression类里面调用表达的方法需要传递一个NSError的参数。下面定义一个
    NSError *error;
    //http+:[^\\s]* 这个表达式是检测一个网址的。
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"http+:[^\\s]*" options:0 error:&error];
    if (regex != nil) {
        NSTextCheckingResult *firstMatch=[regex firstMatchInString:urlString options:0 range:NSMakeRange(0, [urlString length])];
        if (firstMatch) {
            NSRange resultRange = [firstMatch rangeAtIndex:0]; //等同于 firstMatch.range --- 相匹配的范围
            //从urlString当中截取数据
            NSString *result=[urlString substringWithRange:resultRange];
            //输出结果
            NSLog(@"%@",result);
        }
    }
}

- (void)parseNumber{
    NSString *number = @"124354";
    NSError *error;
    NSRegularExpression *regex2 = [NSRegularExpression regularExpressionWithPattern:@"^[0-9]*$" options:0 error:&error];
    if (regex2) {
        NSTextCheckingResult *result2 = [regex2 firstMatchInString:number options:0 range:NSMakeRange(0, [number length])];
        if (result2) {
            NSRange resultRange = [result2 rangeAtIndex:0];
            NSString *result = [number substringWithRange:resultRange];
            NSLog(@"%@",result);
        }
    }
    if ([self isValidateNumber:number]) {
        NSLog(@"yes");
    }
}

- (BOOL)isValidateNumber:(NSString *)number
{
    NSString *regex = @"[0-9]";
    NSPredicate *numberTest = [NSPredicate predicateWithFormat:@"SELF MATCHES%@",regex];
    return [numberTest evaluateWithObject:number];
}

- (IBAction)pop:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
    if (_pop) {
        _pop(sender, textF.text, textV.text);
        
    }
    CGFloat r = .5, g = .5, b = .5;
    if (_rgbValue) {
        _rgbValue(&r, &g, &b);
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark UITextFieldDelegate method
- (void)textFieldDidEndEditing:(UITextField *)textField
{
    if ([textField isKindOfClass:[CustomTextField class]]) {
        [(CustomTextField *)textField validate];
    }
}

@end
