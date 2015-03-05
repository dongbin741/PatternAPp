//
//  CanvasViewController.h
//  PatternAPp
//
//  Created by china317 on 14-8-28.
//  Copyright (c) 2014年 china317. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CanvasView.h"
#import "CanvasViewGenerator.h"

@interface CanvasViewController : UIViewController
{
    @private
    CanvasView *canvasView;
}

@property (nonatomic, strong) CanvasView *canvasView;

- (void)loadCanvasViewWithGenerator:(CanvasViewGenerator *)generator;

@end
