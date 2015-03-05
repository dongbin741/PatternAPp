//
//  DBGifView.h
//  PatternAPp
//
//  Created by china317 on 15/1/20.
//  Copyright (c) 2015年 china317. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DBGifView : UIView

/*!
 初始化gif
 @abstract 用位置和文件地址初始化
 @discussion 初始化
 @param center
 图片中心点
 @param fileURL
 文件url
 */
- (id)initWithCenter:(CGPoint)center fileURL:(NSURL *)fileURL;

- (void)startGif;

- (void)stopGif;

+ (NSArray *)framesInGif:(NSURL *)fileURL;

@end
