//
//  FlowerFactory.m
//  PatternAPp
//
//  Created by china317 on 15/1/8.
//  Copyright (c) 2015年 china317. All rights reserved.
//

#import "FlowerFactory.h"
#import "FlowerView.h"


@implementation FlowerFactory

- (UIView *)flowerViewWithType:(FlowerType)type
{
    if (flowerPool_ == nil) {
        flowerPool_ = [[NSMutableDictionary alloc] initWithCapacity:kTotalNumberOfFlowerTypes];
    }
    UIView *flowerView = flowerPool_[[NSNumber numberWithInt:type]];
    if (flowerView == nil) {
        UIImage *flowerImage;
        switch (type) {
            case kAnemone:
                flowerImage = [UIImage imageNamed:@"anemone.png"];
                break;
                
            default:
                break;
        }
        flowerView = [[FlowerView alloc] initWithImage:flowerImage];
        flowerPool_[[NSNumber numberWithInt:type]] = flowerView;
    }
    return flowerView;
}

@end
