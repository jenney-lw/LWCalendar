//
//  LWCalendarManager.m
//  LWCalendar
//
//  Created by liaowei on 2018/7/5.
//  Copyright © 2018年 ijufeng. All rights reserved.
//

#import "LWCalendarManager.h"
#import "AppDelegate.h"
#import "LWCalendarView.h"

@interface LWCalendarManager()

@property (nonatomic, strong) LWCalendarView *calendarView;

@end

@implementation LWCalendarManager

#pragma mark - 选择某一天
+ (void)show_single_date:(CompleteBlock)complete {
    LWCalendarManager *manager = [LWCalendarManager new];
    manager.isShowBeforeDate = NO;
    manager.complete = complete;
    [manager showCalendar];
}

#pragma mark - 选择某一段时间
+ (void)show_multi_date:(CompleteBlock)complete {
    LWCalendarManager *manager = [LWCalendarManager new];
    manager.isShowBeforeDate = NO;
    manager.complete = complete;
    [manager showCalendar];
}

#pragma mark - 显示日历视图
- (void)showCalendar {
    if (!_calendarView) {
        _calendarView = [[LWCalendarView alloc] init];
        _calendarView.frame = CGRectMake(0, kScreenHeight, kScreenWidth, kScreenHeight);
        _calendarView.backgroundColor = [UIColor whiteColor];
        _calendarView.manager = self;
        [_calendarView initSubviews];
        [[self appWindow] addSubview:_calendarView];
    }
    
    __weak typeof(self) weakSelf = self;
    [UIView animateWithDuration:0.35 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
        weakSelf.calendarView.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight);
    } completion:nil];
}

#pragma mark - 获取整个应用的window
- (UIWindow *)appWindow {
    AppDelegate *delegate = (AppDelegate *) [UIApplication sharedApplication].delegate;
    return delegate.window;
}

#pragma mark - 获取当前日期
- (NSDate *)currentDate {
    if (!_currentDate) {
        _currentDate = [NSDate date];
    }
    return _currentDate;
}

@end
