//
//  NSDictionary+DBCopyDictionary.m
//  PatternAPp
//
//  Created by china317 on 14/12/4.
//  Copyright (c) 2014年 china317. All rights reserved.
//

#import "NSDictionary+DBCopyDictionary.h"

@implementation NSDictionary (DBCopyDictionary)

- (NSMutableDictionary *)mutableDeepCopy
{
    NSMutableDictionary *ret=[NSMutableDictionary dictionaryWithCapacity:[self count] ]; //new construct NSMutableDictionary
    NSArray *keys=[self allKeys];
    
    for (id key in keys) {
        id oneValue=[self valueForKey:key]; //old NSObject
        id oneCopy=nil; //new NSObject
        
        if ([oneValue respondsToSelector:@selector(mutableDeepCopy)])
            oneCopy=[oneValue mutableDeepCopy];
        else if ([oneValue respondsToSelector:@selector(mutableCopy)])
            oneCopy=[oneValue mutableCopy];
        
        if (oneCopy==nil)
        {
            oneCopy=[oneValue copy];
        }
        [ret setValue:oneCopy forKey:key];
    }//end for
    return ret;
}

@end
