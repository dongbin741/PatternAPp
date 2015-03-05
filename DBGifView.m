//
//  DBGifView.m
//  PatternAPp
//
//  Created by china317 on 15/1/20.
//  Copyright (c) 2015年 china317. All rights reserved.
//

#import "DBGifView.h"
#import <QuartzCore/QuartzCore.h>
#import <ImageIO/ImageIO.h>

@interface DBGifView() {
    NSMutableArray *_frames;
    NSMutableArray *_delayTimes;
    
    CGFloat _totalTime;
    CGFloat _width;
    CGFloat _height;
}

@end

@implementation DBGifView

void getFrameInfos(CFURLRef url, NSMutableArray *frames, NSMutableArray *delayTimes, CGFloat *totalTime, CGFloat *gifWidth, CGFloat *gifHeight)
{
//    CGImageSourceRef gifSource = CGImageSourceCreateWithURL(url, NULL);
//    size_t frameCount = CGImageSourceGetCount(gifSource);
//    
//    for (size_t i = 0 ; i<frameCount; i++) {
//        CGImageRef frame = CGImageSourceCreateImageAtIndex(gifSource, i, NULL);
//        [frames addObject:(__bridge id)frame];
//        CGImageRelease(frame);
//        NSDictionary *dic = (NSDictionary *)CFBridgingRelease(CGImageSourceCopyPropertiesAtIndex(gifSource, i, NULL));
//        if (gifHeight != NULL && gifWidth != NULL) {
//            *gifHeight = [[dic valueForKey:(__bridge NSString *)kCGImagePropertyPixelHeight] floatValue];
//            *gifWidth = [[dic valueForKey:(__bridge NSString *)kCGImagePropertyPixelWidth] floatValue];
//        }
//        NSDictionary *gifDic = [dic objectForKey:(__bridge NSString *)kCGImagePropertyGIFDictionary];
//        [delayTimes addObject:[gifDic objectForKey:(__bridge NSString *)kCGImagePropertyGIFDelayTime]];
//        if (totalTime) {
//            *totalTime += [[gifDic objectForKey:(__bridge NSString *)kCGImagePropertyGIFDelayTime] floatValue];
//        }
//    }
    CGImageSourceRef gifSource = CGImageSourceCreateWithURL(url, NULL);
    
    // get frame count
    size_t frameCount = CGImageSourceGetCount(gifSource);
    for (size_t i = 0; i < frameCount; ++i) {
        // get each frame
        CGImageRef frame = CGImageSourceCreateImageAtIndex(gifSource, i, NULL);
        [frames addObject:(__bridge id)frame];
        CGImageRelease(frame);
        
        // get gif info with each frame
        //NSDictionary *dict = (NSDictionary*)CGImageSourceCopyPropertiesAtIndex(gifSource, i, NULL);
        NSDictionary *dict = (NSDictionary*)CFBridgingRelease(CGImageSourceCopyPropertiesAtIndex(gifSource, i, NULL));
        
        NSLog(@"kCGImagePropertyGIFDictionary %@", [dict valueForKey:(NSString*)kCGImagePropertyGIFDictionary]);
        
        // get gif size
        if (gifWidth != NULL && gifHeight != NULL) {
            *gifWidth = [[dict valueForKey:(NSString*)kCGImagePropertyPixelWidth] floatValue];
            *gifHeight = [[dict valueForKey:(NSString*)kCGImagePropertyPixelHeight] floatValue];
        }
        
        // kCGImagePropertyGIFDictionary中kCGImagePropertyGIFDelayTime，kCGImagePropertyGIFUnclampedDelayTime值是一样的
        NSDictionary *gifDict = [dict valueForKey:(NSString*)kCGImagePropertyGIFDictionary];
        [delayTimes addObject:[gifDict valueForKey:(NSString*)kCGImagePropertyGIFDelayTime]];
        
        if (totalTime) {
            *totalTime = *totalTime + [[gifDict valueForKey:(NSString*)kCGImagePropertyGIFDelayTime] floatValue];
        }
    }

}

- (id)initWithCenter:(CGPoint)center fileURL:(NSURL *)fileURL
{
    self = [super initWithFrame:CGRectZero];
    
    if (self) {
        _frames = [[NSMutableArray alloc] init];
        _delayTimes = [[NSMutableArray alloc] init];
        
        _width = 0 ;
        _height = 0 ;
        //_totalTime = 0;
        
        if (fileURL) {
            getFrameInfos((__bridge CFURLRef)fileURL, _frames, _delayTimes, &_totalTime, &_width, &_height);
        }
        self.frame = CGRectMake(0, 0, _width, _height);
        self.center = center;
    }
    
    return self;
}


+ (NSArray *)framesInGif:(NSURL *)fileURL
{
    NSMutableArray *frames = [NSMutableArray arrayWithCapacity:3];
    NSMutableArray *delays = [NSMutableArray arrayWithCapacity:3];
    
    getFrameInfos((__bridge CFURLRef)fileURL, frames, delays, NULL, NULL, NULL);
    return frames;
}

- (void)startGif
{
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"contents"];
    NSMutableArray *times = [NSMutableArray arrayWithCapacity:3];
    CGFloat currentTime = 0;
    NSUInteger count = _frames.count;
    NSMutableArray *images = [NSMutableArray arrayWithCapacity:3];
    for (int i=0; i<count; i++) {
        [images addObject:[_frames objectAtIndex:i]];
        [times addObject:[NSNumber numberWithFloat:(currentTime/_totalTime)]];
        currentTime += [[_delayTimes objectAtIndex:i] floatValue];
    }
    
    [animation setKeyTimes:times];
    [animation setValues:images];
    [animation setTimingFunction:[CAMediaTimingFunction functionWithName:@"linear"]];
    animation.duration = _totalTime;
    animation.delegate = self;
    animation.repeatCount = 5;
    
    [self.layer addAnimation:animation forKey:@"gifAnimation"];
}

- (void)stopGif
{
    [self.layer removeAllAnimations];
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    NSLog(@"animation is end~!");
    [self startGif];
}





@end
