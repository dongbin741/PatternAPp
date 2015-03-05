//
//  NSString+appendString.m
//  PatternAPp
//
//  Created by china317 on 14/12/4.
//  Copyright (c) 2014年 china317. All rights reserved.
//

#import "NSString+appendString.h"

@implementation NSString (appendString)

- (NSString *)appendingStr
{
    NSString *str = [self stringByAppendingString:@"aaaaa"];
    return str;
}
@end
