//
//  MarkEnumerator.h
//  PatternAPp
//
//  Created by china317 on 14-9-4.
//  Copyright (c) 2014年 china317. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Mark.h"

@interface MarkEnumerator : NSEnumerator
{
    @private
    NSMutableArray *stack_;
}

- (id) initWithMark:(id<Mark>)mark;
- (void) traverseAndBuildStackWithMark:(id<Mark>)mark;

@end
