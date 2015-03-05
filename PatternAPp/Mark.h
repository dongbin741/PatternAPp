//
//  Mark.h
//  PatternAPp
//
//  Created by china317 on 14-8-27.
//  Copyright (c) 2014年 china317. All rights reserved.
//

#import <Foundation/Foundation.h>

#define markEnumerationBlock ^(id<Mark> item, BOOL *stop)

@protocol Mark <NSObject>

@property (nonatomic, strong) UIColor *color;
@property (nonatomic, assign) CGFloat size;
@property (nonatomic, assign) CGPoint location;
@property (nonatomic, readonly) NSUInteger count;
@property (nonatomic, readonly) id<Mark> lastChild;

- (id)copy;
- (void) addMark:(id<Mark>) mark;
- (void)removeMark:(id<Mark>) mark;
- (void) drawWithContext:(CGContextRef)context;

- (id<Mark>)childMarkAtIndex:(NSInteger) index;
- (NSEnumerator *) enumerator;
- (void)enumerateMarksUsingBlock:(void (^)(id<Mark> item, BOOL *stop)) block;

@end
