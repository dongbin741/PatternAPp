//
//  NumericInputValidator.m
//  PatternAPp
//
//  Created by china317 on 15/1/7.
//  Copyright (c) 2015年 china317. All rights reserved.
//

#import "NumericInputValidator.h"

@implementation NumericInputValidator

- (BOOL)ValidateInput:(UITextField *)input error:(NSError **)error
{
    NSError *regError = nil;
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"^[0-9]*$" options:NSRegularExpressionAnchorsMatchLines error:&regError];
    NSUInteger numberOfMatches = [regex numberOfMatchesInString:[input text] options:NSMatchingAnchored range:NSMakeRange(0, input.text.length)];
    
    if (numberOfMatches == 0) {
        if (error != nil) {
            NSString *description = NSLocalizedString(@"Input Validation Failed", @"");
            NSString *reason = NSLocalizedString(@"The input can contain only numerical values", @"");
            NSArray *objArray = @[description, reason];
            NSArray *keyArray = @[NSLocalizedDescriptionKey, NSLocalizedFailureReasonErrorKey];
            NSDictionary *userInfo = @{objArray: keyArray};
            *error = [NSError errorWithDomain:@"InputValidationErrorDomain" code:1001 userInfo:userInfo];
        }
        return NO;
    }
    return YES;
}

@end
