//
//  LWCalendarHeaderView.m
//  LWCalendar
//
//  Created by liaowei on 2018/7/5.
//  Copyright © 2018年 ijufeng. All rights reserved.
//

#import "LWCalendarHeaderView.h"

@implementation LWCalendarHeaderView

- (instancetype)init {
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)initSubviews {
    [self showWeeks];
}

- (void)showWeeks {
//    NSArray *weekArray = @[@"星期天", @"星期一", @"星期二", @"星期三", @"星期四", @"星期五", @"星期六"];
    NSArray *weekArray = @[@"日", @"一", @"二", @"三", @"四", @"五", @"六"];
    CGFloat w = kScreenWidth / 7;
    CGFloat y;
    for (int idx = 0; idx < weekArray.count; idx++) {
        NSString *week = weekArray[idx];
        UILabel *weekLabel = [[UILabel alloc] initWithFrame:CGRectMake(w * idx, 55, w, 25 * scale_h)];
        weekLabel.textAlignment = NSTextAlignmentCenter;
        weekLabel.font = [UIFont systemFontOfSize:14 * scale_h];
        weekLabel.textColor = [UIColor blueColor];
        weekLabel.text = week;
        [self addSubview:weekLabel];
    }
}

@end
