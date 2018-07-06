//
//  NSDate+LWCalendar.h
//  LWCalendar
//
//  Created by liaowei on 2018/7/6.
//  Copyright © 2018年 ijufeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (LWCalendar)

@property (nonatomic, strong) NSCalendar *cld;

// 获取当前年
- (NSInteger)getCurrentYear;

// 获取当前月
- (NSInteger)getCurrentMonth;

// 获取当前日
- (NSInteger)getCurrentDay;

// 计算当月的天数
- (NSInteger)getDaysOfMonth;

// 获取当前日期是星期几
- (NSInteger)getCurrentWeek;

// 获取本月第一天是星期几
- (NSInteger)getWeekInFirstDay;

// 获取本月最后一天是星期几
- (NSInteger)getWeekInLastDay;

// 增加某些年后的日期
- (NSDate *)addYear:(NSInteger)year;

// 增加某些月后的日期
- (NSDate *)addMonth:(NSInteger)month;

// 增加某些日后的日期
- (NSDate *)addDay:(NSInteger)day;

// 判断两个日期是否一致
- (BOOL)isSameDate:(NSDate *)date;

@end
