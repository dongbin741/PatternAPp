//
//  FBCDViewController.h
//  PatternAPp
//
//  Created by china317 on 14-8-27.
//  Copyright (c) 2014年 china317. All rights reserved.
//

#import <UIKit/UIKit.h>

#define func(x,y,z) x+y+z

#define Min(A,B) ({__typeof__(A) __a = (A); __typeof__(B) __b = (B); __a< __b ? __a : __b;})

typedef NS_ENUM(NSUInteger, Statue) {
    socketstatue = 1,
    socketstatuea = 1<<1,
    socketstaua = 1 <<2,
    socketst = 1 << 3
};

typedef void(^dbBlock) (UIViewController *VC, NSString *key);
typedef int(^myBlock) (int a, int b);
typedef void(^fetchDataResult) (NSError *error, NSArray *results);

@interface FBCDViewController : UIViewController
{
    BOOL threadProcess1Finished;
    BOOL threadProcess2Finished;
    
    __weak IBOutlet UIImageView *imageView1;
    __weak IBOutlet UIImageView *imageView2;
    
    
    void(^BarkCallback)(NSObject *thisDog, int count);
    myBlock simBlcok;
    __weak IBOutlet UILabel *label;
    NSTimer *_timer;
}

- (void)SetBark:(void(^)(NSObject *thisDog, int count))eachBark;
- (void)GetMyBlock:(myBlock)mb;
- (void)fetchDataResult:(fetchDataResult)results;

@end
