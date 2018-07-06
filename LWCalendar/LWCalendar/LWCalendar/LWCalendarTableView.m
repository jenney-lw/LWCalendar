//
//  LWCalendarTableView.m
//  LWCalendar
//
//  Created by liaowei on 2018/7/5.
//  Copyright © 2018年 ijufeng. All rights reserved.
//

#import "LWCalendarTableView.h"
#import "NSDate+LWCalendar.h"
#import "LWCalendarCell.h"

@interface LWCalendarTableView()<UITableViewDataSource, UITableViewDelegate>

@end

@implementation LWCalendarTableView

- (instancetype)initWithFrame:(CGRect)frame manager:(LWCalendarManager *)manager {
    self = [super initWithFrame:frame];
    if (self) {
        self.showsVerticalScrollIndicator = NO;
        self.dataSource = self;
        self.delegate = self;
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
        [self registerClass:[LWCalendarCell class] forCellReuseIdentifier:LWCalendarCell_ReuseIdentifier];
        
        self.manager = manager;
    }
    return self;
}

#pragma mark - tableview
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.monthArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    LWCalendarCell *cell = [tableView dequeueReusableCellWithIdentifier:LWCalendarCell_ReuseIdentifier];
    if (!cell) {
        cell = [LWCalendarCell new];
    } else {
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.manager = self.manager;
        [cell.contentView.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [obj removeFromSuperview];
        }];
        
        NSDate *date = self.monthArray[indexPath.row];
        [cell createDateView:date];
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSDate *date = self.monthArray[indexPath.row];
    return [self getHeightWithDate:date];
}

- (CGFloat)getHeightWithDate:(NSDate *)date {
    NSInteger firstWeek = [date getWeekInFirstDay];
    NSInteger days = [date getDaysOfMonth];
    NSInteger lastWeek = [date getWeekInLastDay];
    NSInteger count = firstWeek + days + 6 - lastWeek;
    NSInteger h = count / 7;
    if (count % 7 > 0) {
        h += 1;
    }
    return h * kScreenWidth / 7 + 49 * scale_h;
}

#pragma mark - 懒加载
- (NSArray<NSDate *> *)monthArray {
    if (!_monthArray) {
        NSDate *currentDate = _manager.currentDate;
        NSMutableArray *mDatas = [NSMutableArray array];
        if (!_manager.isShowBeforeDate) {
            for (int i = 0; i < 6; i++) {
                [mDatas addObject:[currentDate addMonth:i]];
            }
        } else {
            for (int i = -6; i < 12; i++) {
                [mDatas addObject:[currentDate addMonth:i]];
            }
        }
        _monthArray = [mDatas copy];
    }
    return _monthArray;
}

@end
