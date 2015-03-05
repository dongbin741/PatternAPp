//
//  CustomTextField.m
//  PatternAPp
//
//  Created by china317 on 15/1/7.
//  Copyright (c) 2015年 china317. All rights reserved.
//

#import "CustomTextField.h"

@implementation CustomTextField

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (BOOL)validate
{
    NSError *error = nil;
    BOOL validationResult = [inputValidator_ ValidateInput:self error:&error];
    if (!validationResult) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:[error localizedDescription] message:[error localizedFailureReason] delegate:nil cancelButtonTitle:NSLocalizedString(@"ok", @"好") otherButtonTitles:nil];
        [alertView show];
    }
    return validationResult;
}

@end
