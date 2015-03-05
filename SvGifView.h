//
//  SvGifView.h
//  PatternAPp
//
//  Created by china317 on 15/1/19.
//  Copyright (c) 2015年 china317. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SvGifView : UIView
- (id)initWithCenter:(CGPoint)center fileURL:(NSURL*)fileURL;

/*
 * @brief start Gif Animation
 */
- (void)startGif;

/*
 * @brief stop Gif Animation
 */
- (void)stopGif;

/*
 * @brief get frames image(CGImageRef) in Gif
 */
+ (NSArray*)framesInGif:(NSURL*)fileURL;


@end
