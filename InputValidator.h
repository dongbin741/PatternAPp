//
//  InputValidator.h
//  PatternAPp
//
//  Created by china317 on 15/1/7.
//  Copyright (c) 2015年 china317. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface InputValidator : NSObject

- (BOOL)ValidateInput:(UITextField *)input error:(NSError **)error;

@end
