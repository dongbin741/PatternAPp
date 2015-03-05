//
//  InputValidator.m
//  PatternAPp
//
//  Created by china317 on 15/1/7.
//  Copyright (c) 2015年 china317. All rights reserved.
//

#import "InputValidator.h"

@implementation InputValidator


- (BOOL)ValidateInput:(UITextField *)input error:(NSError **)error
{
    if (error) {
        *error = nil;
    }
    return NO;
}

@end
