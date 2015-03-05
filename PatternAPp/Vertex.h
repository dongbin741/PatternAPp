//
//  Vertex.h
//  PatternAPp
//
//  Created by china317 on 14-8-27.
//  Copyright (c) 2014年 china317. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Mark.h"

@interface Vertex : NSObject <Mark, NSCopying>
{
    @protected
    CGPoint location_;
}

@property (nonatomic, strong) UIColor *color;
@property (nonatomic, assign) CGFloat size;
@property (nonatomic, assign) CGPoint location;
@property (nonatomic, readonly) NSUInteger count;
@property (nonatomic, readonly) id<Mark> lastChild;

- (id) initWithLocation:(CGPoint)location;
- (void) addMark:(id<Mark>)mark;
- (void) removeMark:(id<Mark>)mark;
- (id<Mark>) childMarkAtIndex:(NSInteger)index;
- (void) drawWithContext:(CGContextRef)context;

- (id)copyWithZone:(NSZone *)zone;

@end
