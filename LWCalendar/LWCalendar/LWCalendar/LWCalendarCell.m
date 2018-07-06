//
//  LWCalendarCell.m
//  LWCalendar
//
//  Created by liaowei on 2018/7/6.
//  Copyright © 2018年 ijufeng. All rights reserved.
//

#import "LWCalendarCell.h"
#import "NSDate+LWCalendar.h"
#import "LWCalendarButton.h"

@implementation LWCalendarCell

/* 生成一个月的日历 */
- (UIView *)createDateView:(NSDate *)date {
    self.backgroundColor = [UIColor clearColor];
    self.contentView.backgroundColor = [UIColor clearColor];
    
    CGFloat top = 15 * scale_h;
    CGFloat left = 25 * scale_w;
    CGFloat monthLabelH = 24 * scale_h;
    
    UIView *dateBgView = [UIView new];
    dateBgView.frame = CGRectMake(0, 0, kScreenWidth, self.bounds.size.height);
    [self.contentView addSubview:dateBgView];
    
    UILabel *monthLabel = [UILabel new];
    monthLabel.backgroundColor = [UIColor clearColor];
    monthLabel.textColor = [UIColor blueColor];
    [monthLabel setFont:[UIFont boldSystemFontOfSize:monthLabel.font.pointSize]];
    monthLabel.frame = CGRectMake(left, top, kScreenWidth/2, monthLabelH);
    [dateBgView addSubview:monthLabel];
    
    NSString *month = [NSString stringWithFormat:@"%02ld", (long)[date getCurrentMonth]];
    if ([date getCurrentYear] == [self.manager.currentDate getCurrentYear]) {
        month = [NSString stringWithFormat:@"%@月", month];
        monthLabel.text = month;
    } else {
        monthLabel.text = [NSString stringWithFormat:@"%ld年%@月", (long)date.getCurrentYear, month];
    }
    
    
    NSInteger week_first = [date getWeekInFirstDay];
    NSInteger week_last = [date getWeekInLastDay];
    NSInteger days = [date getDaysOfMonth];
    CGFloat w = kScreenWidth / 7;
    NSInteger count = week_first + days + 6 - week_last;
    for (int i = 0; i < count; i++) {
        NSInteger row = i / 7;
        NSInteger column = i - row * 7;
        
        LWCalendarButton *btn = [[LWCalendarButton alloc] initWithFrame:CGRectMake(column * w, row * w + CGRectGetMaxY(monthLabel.frame) + 10 * scale_h, w, w)];
        NSString *year_month = [NSString stringWithFormat:@"%ld%02ld%02d", [date getCurrentYear], [date getCurrentMonth], i];
        btn.tag = [year_month integerValue];
        btn.enabled = NO;
        
        if (i >= week_first && i < (count + week_last - 6)) {
            NSString *titleNum = [NSString stringWithFormat:@"%ld", i - week_first + 1];
            btn.enabled = YES;
            [btn setTitle:titleNum forState:UIControlStateNormal];
        }
        [dateBgView addSubview:btn];
    }
    
    
    return dateBgView;
}

@end
