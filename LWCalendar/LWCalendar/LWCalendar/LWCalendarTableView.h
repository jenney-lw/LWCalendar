//
//  LWCalendarTableView.h
//  LWCalendar
//
//  Created by liaowei on 2018/7/5.
//  Copyright © 2018年 ijufeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LWCalendarManager.h"

@interface LWCalendarTableView : UITableView

@property (nonatomic, strong) LWCalendarManager *manager;

@property (nonatomic, strong) NSArray<NSDate *> *monthArray;

@property (nonatomic, strong) NSMutableArray *existViews;

- (instancetype)initWithFrame:(CGRect)frame manager:(LWCalendarManager *)manager;

@end
