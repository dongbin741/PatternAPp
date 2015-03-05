//
//  CustomTextField.h
//  PatternAPp
//
//  Created by china317 on 15/1/7.
//  Copyright (c) 2015年 china317. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "InputValidator.h"

@interface CustomTextField : UITextField
{
    @private
    InputValidator *inputValidator_;
}
@property (nonatomic, strong) IBOutlet InputValidator *inputValidator;

- (BOOL)validate;

@end
