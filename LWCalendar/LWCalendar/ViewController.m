//
//  ViewController.m
//  LWCalendar
//
//  Created by liaowei on 2018/7/5.
//  Copyright © 2018年 ijufeng. All rights reserved.
//

#import "ViewController.h"
#import "LWCalendarManager.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *singleSelectDate = [UIButton buttonWithType:UIButtonTypeCustom];
    [singleSelectDate setTitle:@"选择某一天" forState:UIControlStateNormal];
    singleSelectDate.backgroundColor = [UIColor blueColor];
    singleSelectDate.frame = CGRectMake(50, 100, 160, 40);
    [singleSelectDate addTarget:self action:@selector(singleSelectDateAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:singleSelectDate];
    
    UIButton *multiSelectDate = [UIButton buttonWithType:UIButtonTypeCustom];
    [multiSelectDate setTitle:@"选择某一段时间" forState:UIControlStateNormal];
    multiSelectDate.backgroundColor = [UIColor redColor];
    multiSelectDate.frame = CGRectMake(50, 160, 160, 40);
    [multiSelectDate addTarget:self action:@selector(multiSelectDateAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:multiSelectDate];
}

- (void)singleSelectDateAction {
    [LWCalendarManager show_single_date:^(NSArray<__kindof NSObject *> *dateArray) {
        
    }];
}

- (void)multiSelectDateAction {
    [LWCalendarManager show_multi_date:^(NSArray<__kindof NSObject *> *dateArray) {
        
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
