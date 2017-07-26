//
//  ViewController.m
//  ColorProcess
//
//  Created by CAIMINWEI on 2017/7/25.
//  Copyright © 2017年 NE. All rights reserved.
//

#import "ViewController.h"
#import "ColorLineProcessView.h"
#import "ColorCircleProcessView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //demo
    //三段直线
    [self create3xLinerView];
    //四段直线
    [self create4xLinerView];
    //2d圆环
    [self createCircleView];
    //2.5d圆环
    [self create2x5DCircleView];
}

-(void)create3xLinerView
{
    ColorLineProcessView *view = [[ColorLineProcessView alloc] initWithFrame:CGRectMake(25,60, [UIScreen mainScreen].bounds.size.width-50, 10)];
    
    view.lineArray =@[
                      @{
                          @"strokeColor":[UIColor redColor],
                          },
                      @{
                          @"strokeColor":[UIColor greenColor],
                          },
                      @{
                          @"strokeColor":[UIColor blueColor],
                          }
                      ];
    [self.view addSubview:view];
}


-(void)create4xLinerView
{
    ColorLineProcessView *view = [[ColorLineProcessView alloc] initWithFrame:CGRectMake(25,100, [UIScreen mainScreen].bounds.size.width-50, 10)];
    
    view.lineArray =@[
                        @{
                            @"strokeColor":[UIColor redColor],
                            },
                        @{
                            @"strokeColor":[UIColor greenColor],
                            },
                        @{
                            @"strokeColor":[UIColor blueColor],
                            },
                        @{
                            @"strokeColor":[UIColor blackColor],
                            }
                        ];
        [self.view addSubview:view];
}

-(void)createCircleView
{
    float a=301.25,b=235.23,c=452.65;
    ColorCircleProcessView *view = [[ColorCircleProcessView alloc] initWithFrame:CGRectMake(25,200, 100, 100)];
    
    view.circleArray =@[
                        @{
                            @"strokeColor":[UIColor redColor],
                            @"precent"    :@(a/(a+b+c))
                            },
                        @{
                            @"strokeColor":[UIColor greenColor],
                            @"precent"    :@(b/(a+b+c))
                            },
                        @{
                            @"strokeColor":[UIColor blueColor],
                            @"precent"    :@(c/(a+b+c))
                            }
                        ];
    [self.view addSubview:view];

}

-(void)create2x5DCircleView
{
    float a=301.25,b=235.23,c=452.65;
    ColorCircleProcessView *view = [[ColorCircleProcessView alloc] initWithFrame:CGRectMake(155,200, 150, 50)];
    
    view.circleArray =@[
                        @{
                            @"strokeColor":[UIColor redColor],
                            @"precent"    :@(a/(a+b+c))
                            },
                        @{
                            @"strokeColor":[UIColor greenColor],
                            @"precent"    :@(b/(a+b+c))
                            },
                        @{
                            @"strokeColor":[UIColor blueColor],
                            @"precent"    :@(c/(a+b+c))
                            }
                        ];
    [self.view addSubview:view];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
