//
//  MarkVisitor.h
//  PatternAPp
//
//  Created by china317 on 14-9-5.
//  Copyright (c) 2014年 china317. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol Mark;
@class Dot, Vertex, Stroke;

@protocol MarkVisitor <NSObject>

- (void) visitMark:(id<Mark>)mark;
- (void) visitDot:(Dot *)dot;
- (void) visitVertex:(Vertex *)vertex;
- (void) visitStroke:(Stroke *)stroke;

@end



@interface MarkVisitor : NSObject

@end
