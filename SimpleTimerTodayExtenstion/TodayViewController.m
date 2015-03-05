//
//  TodayViewController.m
//  SimpleTimerTodayExtenstion
//
//  Created by china317 on 14/12/24.
//  Copyright (c) 2014年 china317. All rights reserved.
//

#import "TodayViewController.h"
#import <NotificationCenter/NotificationCenter.h>
#import "Timer.h"

@interface TodayViewController () <NCWidgetProviding>

@property (nonatomic, strong)Timer *timer;

@end

@implementation TodayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    NSUserDefaults *userDefaults = [[NSUserDefaults alloc]initWithSuiteName:@"group.PatterAPpDefaults"];
    NSInteger value = [userDefaults integerForKey:@"com.china317.simpleTimer"];
    label.text = [NSString stringWithFormat:@"%ld",(long)value];
    
    
}

- (IBAction)buttonTapped:(id)sender
{
    NSExtensionContext *extensionContext = [[NSExtensionContext alloc]init];
    [extensionContext openURL:[NSURL URLWithString:@"simpleTimer://finished"] completionHandler:nil];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    NSUserDefaults *userDefaults = [[NSUserDefaults alloc]initWithSuiteName:@"group.PatterAPpDefaults"];
    NSInteger value = [userDefaults integerForKey:@"com.china317.simpleTimer"];
    label.text = [NSString stringWithFormat:@"%ld",(long)value];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)widgetPerformUpdateWithCompletionHandler:(void (^)(NCUpdateResult))completionHandler {
    // Perform any setup necessary in order to update the view.
    
    // If an error is encountered, use NCUpdateResultFailed
    // If there's no update required, use NCUpdateResultNoData
    // If there's an update, use NCUpdateResultNewData

    completionHandler(NCUpdateResultNewData);
}

@end
