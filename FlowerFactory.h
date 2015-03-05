//
//  FlowerFactory.h
//  PatternAPp
//
//  Created by china317 on 15/1/8.
//  Copyright (c) 2015年 china317. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(int, FlowerType) {
    kAnemone = 0,
    kCosmos,
    kGerberas,
    kHollyhock,
    kJasmine,
    kZinnia,
    kTotalNumberOfFlowerTypes
};

@interface FlowerFactory : NSObject
{
    @private
    NSMutableDictionary *flowerPool_;
}

- (UIView *)flowerViewWithType:(FlowerType)type;

@end
