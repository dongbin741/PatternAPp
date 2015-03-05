//
//  Dot.m
//  PatternAPp
//
//  Created by china317 on 14-8-27.
//  Copyright (c) 2014年 china317. All rights reserved.
//

#import "Dot.h"

@implementation Dot

@synthesize size = size_, color = color_;

- (id) copyWithZone:(NSZone *)zone
{
    Dot *dotCopy = [[[self class] allocWithZone:zone] initWithLocation:location_];
    //copy color
    [dotCopy setColor:[UIColor colorWithCGColor:[color_ CGColor]]];
    //copy size
    [dotCopy setSize:size_];
    return dotCopy;
}

- (void) drawWithContext:(CGContextRef)context
{
    CGFloat x = self.location.x;
    CGFloat y = self.location.y;
    CGFloat frameSize = self.size;
    CGRect frame = CGRectMake(x, y, frameSize, frameSize);
    CGContextSetFillColorWithColor(context, [self.color CGColor]);
    CGContextFillEllipseInRect(context, frame);
}



@end
