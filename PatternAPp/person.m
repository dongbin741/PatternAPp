//
//  person.m
//  PatternAPp
//
//  Created by china317 on 14/10/22.
//  Copyright (c) 2014年 china317. All rights reserved.
//

#import "person.h"
#import <objc/runtime.h>
@implementation person


-(void)encodeWithCoder:(NSCoder *)encoder
{
    person *obj = [person new];
    NSLog(@"%p",&obj);
    unsigned int count = 0;
    Ivar *ivars = class_copyIvarList([person class], &count);
    for (int i = 0; i<count; i++) {
        // 取出i位置对应的成员变量
        Ivar ivar = ivars[i];
        
        // 查看成员变量
        const char *name = ivar_getName(ivar);
        
        // 归档
        NSString *key = [NSString stringWithUTF8String:name];
        id value = [self valueForKey:key];
        [encoder encodeObject:value forKey:key];
    }
    
    free(ivars);
}

-(id)initWithCoder:(NSCoder *)decoder
{
    if (self = [super init]) {
        unsigned int count = 0;
        Ivar *ivars = class_copyIvarList([person class], &count);
        
        for (int i = 0; i<count; i++) {
            // 取出i位置对应的成员变量
            Ivar ivar = ivars[i];
            
            // 查看成员变量
            const char *name = ivar_getName(ivar);
            
            // 归档
            NSString *key = [NSString stringWithUTF8String:name];
            id value = [decoder decodeObjectForKey:key];
            
            // 设置到成员变量身上
            [self setValue:value forKey:key];
        }
        
        free(ivars);
        
    }
    return self;
}

@end
