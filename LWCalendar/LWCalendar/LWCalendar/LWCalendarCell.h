//
//  LWCalendarCell.h
//  LWCalendar
//
//  Created by liaowei on 2018/7/6.
//  Copyright © 2018年 ijufeng. All rights reserved.
//

#define LWCalendarCell_ReuseIdentifier @"LWCalendarCell"

#import <UIKit/UIKit.h>
#import "LWCalendarManager.h"

@interface LWCalendarCell : UITableViewCell

@property (nonatomic, strong) LWCalendarManager *manager;

- (UIView *)createDateView:(NSDate *)date;

@end
