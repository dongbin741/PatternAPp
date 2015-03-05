//
//  MarkEnumerator.m
//  PatternAPp
//
//  Created by china317 on 14-9-4.
//  Copyright (c) 2014年 china317. All rights reserved.
//

#import "MarkEnumerator.h"
#import "NSMutableArray+Stack.h"

@implementation MarkEnumerator

- (NSArray *)allObjects
{
    return [[stack_ reverseObjectEnumerator] allObjects];
}

- (id)nextObject
{
    return [stack_ pop];
}

#pragma mark - Private Methods

- (id) initWithMark:(id<Mark>)mark
{
    if (self = [super init]) {
        stack_ = [[NSMutableArray alloc] initWithCapacity:[mark count]];
        [self traverseAndBuildStackWithMark:mark];
    }
    return self;
}

- (void) traverseAndBuildStackWithMark:(id<Mark>)mark
{
    if (mark == nil) {
        return;
    }
    [stack_ push:mark];
    
    NSUInteger index = [mark count];
    id<Mark> childMark;
    while (childMark == [mark childMarkAtIndex:--index]) {
        [self traverseAndBuildStackWithMark:childMark];
    }
}

@end
