//
//  Vertex.m
//  PatternAPp
//
//  Created by china317 on 14-8-27.
//  Copyright (c) 2014年 china317. All rights reserved.
//

#import "Vertex.h"

@implementation Vertex

@synthesize location = location_;
@dynamic color, size;

- (id) initWithLocation:(CGPoint)location
{
    if (self = [super init]) {
        [self setLocation:location];
    }
    return self;
}

- (void) setColor:(UIColor *)color
{
    
}

- (UIColor *) color
{
    return nil;
}

- (id<Mark>) childMarkAtIndex:(NSInteger)index
{
    return nil;
}

- (id<Mark>) lastChild
{
    return nil;
}

- (NSUInteger) count
{
    return 0;
}

- (NSEnumerator *) enumerator
{
    return nil;
}

- (void) addMark:(id<Mark>)mark
{
    
}

- (void) removeMark:(id<Mark>)mark
{
    
}

- (void) drawWithContext:(CGContextRef)context
{
    CGFloat x = self.location.x;
    CGFloat y = self.location.y;
    CGContextAddLineToPoint(context, x, y);
}

#pragma mark -
#pragma mark NSCopying method

- (id)copyWithZone:(NSZone *)zone
{
    Vertex *vertexCopy = [[[self class] allocWithZone:zone] initWithLocation:location_];
    return vertexCopy;
}

@end
