//
//  NSMutableArray+Stack.m
//  PatternAPp
//
//  Created by china317 on 14-9-5.
//  Copyright (c) 2014年 china317. All rights reserved.
//

#import "NSMutableArray+Stack.h"

@implementation NSMutableArray (Stack)

- (void) push:(id)object
{
    [self addObject:object];
}

- (id) pop
{
    if ([self count] ==0) {
        return nil;
    }
    id object = [self lastObject];
    return object;
}

@end
