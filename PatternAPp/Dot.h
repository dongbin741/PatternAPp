//
//  Dot.h
//  PatternAPp
//
//  Created by china317 on 14-8-27.
//  Copyright (c) 2014年 china317. All rights reserved.
//

#import "Vertex.h"

@interface Dot : Vertex
{
    @private
    UIColor *color_;
    CGFloat size_;
}

@property (nonatomic, strong) UIColor *color;
@property (nonatomic, assign) CGFloat size;

- (id) copyWithZone:(NSZone *)zone;

@end
