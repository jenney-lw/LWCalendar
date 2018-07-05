//
//  LWCalendarTableView.m
//  LWCalendar
//
//  Created by liaowei on 2018/7/5.
//  Copyright © 2018年 ijufeng. All rights reserved.
//

#import "LWCalendarTableView.h"

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
        
        self.manager = manager;
    }
    return self;
}

#pragma mark - tableview
- (NSInteger)numberOfRowsInSection:(NSInteger)section {
    return self.monthArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 0;
}

#pragma mark - 懒加载
- (NSArray<NSDate *> *)monthArray {
    if (!_monthArray) {
        NSDate *currentDate = _manager.currentDate;
        NSMutableArray *mDatas = [NSMutableArray array];
        if (!_manager.isShowBeforeDate) {
            for (int i = 0; i < 6; i++) {
                
            }
        } else {
            
        }
        _monthArray = [mDatas copy];
    }
    return _monthArray;
}

@end
