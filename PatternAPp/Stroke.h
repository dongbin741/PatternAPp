//
//  Stroke.h
//  PatternAPp
//
//  Created by china317 on 14-8-27.
//  Copyright (c) 2014年 china317. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Mark.h"

@interface Stroke : NSObject <Mark, NSCopying>
{
    @private
    UIColor *color_;
    CGFloat size_;
    NSMutableArray *children_;
}

@property (nonatomic, strong) UIColor *color;
@property (nonatomic, assign) CGFloat size;
@property (nonatomic, assign) CGPoint location;
@property (nonatomic, readonly) NSUInteger count;
@property (nonatomic, readonly) id<Mark> lastChild;

- (void) addMark:(id<Mark>) mark;
- (void) removeMark:(id<Mark>)mark;
- (id<Mark>) childMarkAtIndex:(NSInteger)index;
- (void) drawWithContext:(CGContextRef)context;

- (id) copyWithZone:(NSZone *)zone;

@end
