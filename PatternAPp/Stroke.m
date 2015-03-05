//
//  Stroke.m
//  PatternAPp
//
//  Created by china317 on 14-8-27.
//  Copyright (c) 2014年 china317. All rights reserved.
//

#import "Stroke.h"

@implementation Stroke

@synthesize color = color_;
@dynamic location;

- (id) init
{
    if (self = [super init]) {
        children_ = [[NSMutableArray alloc] initWithCapacity:5];
    }
    return self;
}

- (void)setLocation:(CGPoint)location
{
    
}

- (CGPoint) location
{
    //return first object location
    if (children_.count > 0) {
        return [(id<Mark>)children_[0] location];
    }
    // else return zero Point
    return CGPointZero;
}

- (void) addMark:(id<Mark>)mark
{
    [children_ addObject:mark];
}

- (void) removeMark:(id<Mark>)mark
{
    //if mark on the level, remove it, then return
    if ([children_ containsObject:mark]) {
        [children_ removeObject:mark];
    }
    //let every child to find it
    else {
        [children_ makeObjectsPerformSelector:@selector(removeMark:) withObject:mark];
    }
}

- (id<Mark>) childMarkAtIndex:(NSInteger)index
{
    if (index >= children_.count) {
        return nil;
    }
    return children_[index];
}

- (id<Mark>) lastChild
{
    return [children_ lastObject];
}

- (NSUInteger) count
{
    return children_.count;
}

- (void) drawWithContext:(CGContextRef)context
{
    CGContextMoveToPoint(context, self.location.x, self.location.y);
    for (id<Mark> mark in children_) {
        [mark drawWithContext:context];
    }
    CGContextSetStrokeColorWithColor(context, [self.color CGColor]);
    CGContextStrokePath(context);
}

//- (NSEnumerator *)enumerator
//{
//    return [[]]
//}

#pragma mark -
#pragma mark NSCopying method

- (id)copyWithZone:(NSZone *)zone
{
    Stroke *strokeCopy = [[[self class] allocWithZone:zone] init];
    //copy color and size
    [strokeCopy setColor:[UIColor colorWithCGColor:[color_ CGColor]]];
    [strokeCopy setSize:size_];
    
    for (id<Mark> child in children_) {
        id<Mark> childCopy = [child copy];
        [strokeCopy addMark:childCopy];
    }
    return strokeCopy;
}

@end
