//
//  CanvasViewController.m
//  PatternAPp
//
//  Created by china317 on 14-8-28.
//  Copyright (c) 2014年 china317. All rights reserved.
//

#import "CanvasViewController.h"

@interface CanvasViewController ()


@end

@implementation CanvasViewController

@synthesize canvasView= canvasView_;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    CanvasViewGenerator *defaultGenerator = [[CanvasViewGenerator alloc] init];
    [self loadCanvasViewWithGenerator:defaultGenerator];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loadCanvasViewWithGenerator:(CanvasViewGenerator *)generator
{
    [canvasView_ removeFromSuperview];
    CGRect frame = CGRectMake(0, 0, 320, 400);
    CanvasView *aCanvasView = [generator canvasViewWithFrame:frame];
    [self setCanvasView:aCanvasView];
    [self.view addSubview:canvasView_];
}



@end
