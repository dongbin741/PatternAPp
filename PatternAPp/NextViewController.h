//
//  NextViewController.h
//  PatternAPp
//
//  Created by china317 on 14/11/26.
//  Copyright (c) 2014年 china317. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FBCDViewController.h"
#import "NumericInputValidator.h"
#import "CustomTextField.h"
#import "PatternApp-Swift.h"
#import <iAd/iAd.h>

typedef void(^testblock) (id sender, NSString *textF, NSString *textV);
//传递3个颜色参数
typedef void (^RGBValueProvide) (CGFloat *red, CGFloat *green, CGFloat *blue);

@interface NextViewController : UIViewController <UITextFieldDelegate, viewProtocol, ADBannerViewDelegate>{
    IBOutlet UITextField *textF;
    IBOutlet UITextView *textV;
    IBOutlet UIButton *backBtn;
    IBOutlet ADBannerView *adView;
    BOOL bannerIsVisible;
    CustomTextField *numericTextField_;
}

@property (nonatomic, weak) dbBlock myBlock;
@property (nonatomic, strong) testblock pop;
@property (nonatomic, strong) RGBValueProvide rgbValue;
@property (nonatomic, strong) IBOutlet CustomTextField *numericTextField;
@end
