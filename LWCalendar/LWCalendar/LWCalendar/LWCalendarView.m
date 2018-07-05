//
//  LWCalendarView.m
//  LWCalendar
//
//  Created by liaowei on 2018/7/5.
//  Copyright © 2018年 ijufeng. All rights reserved.
//

#import "LWCalendarView.h"
#import "LWCalendarHeaderView.h"
#import "LWCalendarTableView.h"

@interface LWCalendarView()

//选择的日期数组
@property (nonatomic, strong) NSMutableArray *selectDateArray;

@property (nonatomic, strong) LWCalendarHeaderView *headerView;

@end

@implementation LWCalendarView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.selectDateArray = [NSMutableArray array];
    }
    return self;
}

#pragma mark - 初始化子视图
- (void)initSubviews {
    [self createHeaderView];
    
    [self createCalendar];
}

- (void)createHeaderView {
    if (!_headerView) {
        _headerView = [[LWCalendarHeaderView alloc] init];
        _headerView.frame = CGRectMake(0, 0, kScreenWidth, 100);
        [self addSubview:_headerView];
    }
}

- (void)createCalendar {
    LWCalendarTableView *calendarTableView = [[LWCalendarTableView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_headerView.frame), kScreenWidth, kScreenHeight - CGRectGetMaxY(_headerView.frame) - 50) manager:self.manager];
    [self addSubview:calendarTableView];
}

@end
