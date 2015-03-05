//
//  FBCDViewController.m
//  PatternAPp
//
//  Created by china317 on 14-8-27.
//  Copyright (c) 2014年 china317. All rights reserved.
//

#import "FBCDViewController.h"
#import "NextViewController.h"
#import "NSDictionary+DBCopyDictionary.h"
#import "NSString+appendString.h"
#import "NSString+appendString.h"
#import "NSMutableArray+Stack.h"
#import "SvGifView.h"
#import "DBGifView.h"

@interface FBCDViewController ()


@end

static int count = 0;
static int timerCount = 100;

int GlbalInt = 0;
int (^getGlobalInt)(void) = ^{ return GlbalInt; };

@implementation FBCDViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"HW" withExtension:@"gif"];
    DBGifView *textView = [[DBGifView alloc] initWithCenter:CGPointMake(280, 100) fileURL:url];
    textView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:textView];
    [textView startGif];
    
    threadProcess1Finished =NO;
    threadProcess2Finished = NO;
    
	// Do any additional setup after loading the view, typically from a nib.
    NSArray *anArray = @[@"this", @"is", @"a", @"test", @"!"];
    NSString *string = @"test";
    [anArray enumerateObjectsUsingBlock:^(id obj, NSUInteger index, BOOL *stop)
     {
         if ([obj localizedCaseInsensitiveCompare:string] == NSOrderedSame) {
             *stop = YES;
         }
     }];
    DEBUG_LOG(@"afd");
    
    NSSet *sets = [[NSSet alloc] initWithObjects:@"a", @"b", @"c", @"d", @"e", nil];
    [sets enumerateObjectsUsingBlock:^(id obj, BOOL *stop) {
        if ([obj localizedCaseInsensitiveCompare:@"d"] == NSOrderedSame) {
            *stop = YES;
        }
    }];

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(applicationWillResignActive) name:UIApplicationWillResignActiveNotification object:nil];
    
    
    UIButton *but = [[UIButton alloc] initWithFrame:CGRectMake(40, 100, 200, 50)];
    [but setTitle:@"aa" forState:UIControlStateNormal];
    [but addTarget:self action:@selector(push) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:but];
    
    Statue gg;
    NSLog(@"fsdafs=%lx",gg);

    gg &= ~socketstaua;
    NSLog(@"socketstatue= %lx",(unsigned long)socketstaua);

    if (count<10) {
        goto addCount;
    }
    
addCount:
    {
        count ++;
        NSLog(@"count++");
        sleep(1);
    }
    
    
    //...
    NSLog(@"%d",func(3, 4, 5));
    int a= 5, b = 7;
    NSLog(@"%d",Min(a, b));
    MIN(a, b);
    int w = 1;
    __typeof__(w) ss;
    ss = w;
    NSLog(@"%d", w);
    NSString *sb = @"8888";
    NSLog(@"%@",sb.appendingStr);
//    int *oo;
//    int cc = 3;
//    oo = &cc;
//    NSLog(@"ss=%d",*oo);
//    int oo=888;
//    int *p;
//    p=&oo;
//    NSLog(@"%d",*p);
    
    NSMapTable *objectToObjectMapping = [NSMapTable strongToStrongObjectsMapTable];
    NSString *key = @"aa";
    [objectToObjectMapping setObject:anArray forKey:key];
    
    
    
    __block int x = 123;
    void (^printXandY)(int) = ^(int y) {
        x = x+y;
    };
    printXandY(456);
    
    int (^oneForm)(int) = ^(int anInt) {
        return anInt-1;
    };
    oneForm(10);
    
    
    
    
     char *myCharacters[3] = { "TomJohn", "George", "Charles Condomine" };
    qsort_b(myCharacters, 3, sizeof(char *), ^(const void *l, const void *r) {
        char *left = *(char **)l;
        char *right = *(char **)r;
        return strncmp(left, right, 1);
    });
    
    dispatch_apply(10, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(size_t i) {
        NSLog(@"aaa%zu",i);
    });
    
    NSArray *array = @[@"A", @"B", @"C", @"A", @"B", @"Z",@"G", @"are", @"Q"];
    NSString *str = @"test";
    [array enumerateObjectsUsingBlock:^(id obj, NSUInteger index, BOOL *stop) {
        if ([obj localizedCaseInsensitiveCompare:str] == NSOrderedSame) {
            *stop = YES;
        }
    }];
    
    
    NSSet *filterSet = [NSSet setWithObjects: @"A", @"Z", @"Q", nil];
    BOOL (^test)(id obj, NSInteger idx, BOOL *stop);
    test = ^(id obj, NSInteger idx, BOOL *stop) {
        if (idx<5) {
            if ([filterSet containsObject:obj]) {
                return YES;
            }
        }
        return NO;
    };
    
    //NSIndexSet *indexs = [array indexOfObjectPassingTest:test];
    int outa = 8;
    int (^add)(int) = ^(int a) {
        return outa+a;
    };
    int result = add(4);
    NSLog(@"a%d",result);
    

}

- (void)push
{
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    NextViewController *VC = [sb instantiateViewControllerWithIdentifier:@"NextViewController"];
    VC.pop = ^(id sender, NSString *textF, NSString *textV) {
        label.text = [NSString stringWithFormat:@"%@\n%@",textF,textV];
    };
    VC.rgbValue = ^(CGFloat *red, CGFloat *green, CGFloat *blue) {
        NSLog(@"a");
        NSLog(@"%f",*red);
    };
//    __weak weakSelf = self;
//    VC.myBlock = ^(weakSelf, @"aaa") {
//        
//    };
    [self showViewController:VC sender:nil];
    return;
    
    //不用push方法
    [self.navigationController pushViewController:VC animated:YES];
}

- (void)alert:(UIButton *)sender
{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"保存" message:@"删除数据将不可恢复" preferredStyle:UIAlertControllerStyleActionSheet];
    UIPopoverPresentationController *popover = alertController.popoverPresentationController;
    if (popover) {
        popover.sourceView = sender;
        popover.sourceRect = sender.bounds;
        popover.permittedArrowDirections = UIPopoverArrowDirectionAny;
    }
}

- (void)SetBark:(void (^)(NSObject *, int))eachBark
{
    if (BarkCallback != eachBark) {
        //...
    }
    [BarkCallback copy];
}

- (void)GetMyBlock:(myBlock)mb
{
    if (simBlcok != mb) {
        //...
    }
    
}

- (void)applicationWillResignActive
{
    if (_timer == nil) {
        NSUserDefaults *userDefaults = [[NSUserDefaults  alloc]initWithSuiteName:@"group.PatterAPpDefaults"];
        [userDefaults setInteger:label.text.integerValue forKey:@"com.china317.simpleTimer"];
        [userDefaults synchronize];
        NSLog(@"%@:%@",NSStringFromSelector(_cmd),self);
    }
}

- (void)printf
{
    NSLog(@"%@",self.description);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
   
}


-(void)threadProce1{
    NSLog(@"Enter threadProce1.");
    for (int i=0; i<5;i++) {
        NSLog(@"InthreadProce1 count = %d.", i);
        sleep(2);
    }
    threadProcess1Finished =YES;
    NSLog(@"Exit threadProce1.");
}

-(void)threadProce2{
    NSLog(@"Enter threadProce2.");
    for (int i=0; i<5;i++) {
        NSLog(@"InthreadProce2 count = %d.", i);
        sleep(2);
    }
    threadProcess2Finished =YES;
    NSLog(@"Exit threadProce2.");
}

- (IBAction)buttonNormalThreadTestPressed:(UIButton *)sender {
    NSLog(@"EnterbuttonNormalThreadTestPressed");
    threadProcess1Finished =NO;
    NSLog(@"Start a new thread.");
    [NSThread detachNewThreadSelector: @selector(threadProce1)
                            toTarget: self
                          withObject: nil];
    // 通常等待线程处理完后再继续操作的代码如下面的形式。
    // 在等待线程threadProce1结束之前，调用buttonTestPressed，界面没有响应，直到threadProce1运行完，才打印buttonTestPressed里面的日志。
    while (!threadProcess1Finished) {
        [NSThread sleepForTimeInterval: 0.5];
        NSLog(@"天哪");
    }
    NSLog(@"ExitbuttonNormalThreadTestPressed");   
}

- (IBAction)buttonRunloopPressed:(id)sender {
    NSLog(@"Enter buttonRunloopPressed");
    threadProcess2Finished =NO;
    NSLog(@"Start a new thread.");
    [NSThread detachNewThreadSelector: @selector(threadProce2)
                            toTarget: self
                          withObject: nil];
    // 使用runloop，情况就不一样了。
    // 在等待线程threadProce2结束之前，调用buttonTestPressed，界面立马响应，并打印buttonTestPressed里面的日志。
    // 这就是runloop的神奇所在
    while (!threadProcess2Finished) {
        NSLog(@"Begin runloop");
        [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode
                                beforeDate: [NSDate distantFuture]];
        NSLog(@"End runloop.");
    }
    NSLog(@"Exit buttonRunloopPressed");
    [self downLoadImages];
}

- (IBAction)buttonTestPressed:(id)sender{
    NSLog(@"Enter buttonTestPressed");
    NSLog(@"Exit buttonTestPressed");
    
}

- (IBAction)startTimer
{
    _timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(flushUI) userInfo:nil repeats:YES];
}
- (void)flushUI
{
    label.text = [NSString stringWithFormat:@"%d",timerCount++];
    [self applicationWillResignActive];
}

- (UIImage *)imageWithURLString:(NSString *)urlString
{
    NSURL *url = [NSURL URLWithString:urlString];
    NSData *data = [NSData dataWithContentsOfURL:url];
    return [[UIImage alloc] initWithData:data];
}

- (void)downLoadImages
{
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(queue, ^{
        dispatch_group_t group = dispatch_group_create();
        __block UIImage *image1 = nil;
        __block UIImage *image2 = nil;
        dispatch_group_async(group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
           NSString *url1 = @"http://car0.autoimg.cn/upload/spec/9579/u_20120110174805627264.jpg";
            image1 = [self imageWithURLString:url1];
        });
        dispatch_group_async(group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
           NSString *url2 = @"http://hiphotos.baidu.com/lvpics/pic/item/3a86813d1fa41768bba16746.jpg";
            image2 = [self imageWithURLString:url2];
        });
        dispatch_group_notify(group, dispatch_get_main_queue(), ^{
            imageView1.image = image1;
            imageView2.image = image2;
        });
    });
}

@end
