//
//  NSDate+LWCalendar.m
//  LWCalendar
//
//  Created by liaowei on 2018/7/6.
//  Copyright © 2018年 ijufeng. All rights reserved.
//

#import "NSDate+LWCalendar.h"
#import <objc/runtime.h>

static const void *lw_calendar = &lw_calendar;

@implementation NSDate (LWCalendar)

/**  私有方法  */
- (NSCalendar *)cld {
    return objc_getAssociatedObject(self, lw_calendar);
}

- (void)setCld:(NSCalendar *)cld {
    objc_setAssociatedObject(self, lw_calendar, cld, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSCalendar *)calendar {
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    calendar.timeZone = [NSTimeZone localTimeZone];
    calendar.locale = [NSLocale currentLocale];
    return calendar;
}

- (NSDateComponents *)components:(NSDate *)date {
    NSDateComponents *compts = [[self calendar] components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday fromDate:date];
    compts.timeZone = [NSTimeZone localTimeZone];
    return compts;
}

- (NSDate *)firstDay {
    NSCalendar *calendar = [self calendar];
    NSDateComponents *compts = [self components:self];
    compts.day = 2; //设定周一为周首日
    NSDate *date = [calendar dateFromComponents:compts];
    return date;
}

- (NSDate *)lastDay {
    NSCalendar *calendar = [self calendar];
    NSDateComponents *compts = [self components:self];
    compts.day = 0; //设定周日为周的最后一天
    compts.month += 1;
    NSDate *date = [calendar dateFromComponents:compts];
    return date;
}

- (NSInteger)getYear:(NSDate *)date {
    NSDateComponents *compts = [self components:date];
    return compts.year;
}

- (NSInteger)getMonth:(NSDate *)date {
    NSDateComponents *compts = [self components:date];
    return compts.month;
}

- (NSInteger)getDay:(NSDate *)date {
    NSDateComponents *compts = [self components:date];
    return compts.day;
}

/**  公共方法  */
#pragma mark - 获取当前年
- (NSInteger)getCurrentYear {
    NSDateComponents *compts = [self components:self];
    return compts.year;
}

#pragma mark - 获取当前月
- (NSInteger)getCurrentMonth {
    NSDateComponents *compts = [self components:self];
    return compts.month;
}

#pragma mark - 获取当前日
- (NSInteger)getCurrentDay {
    NSDateComponents *compts = [self components:self];
    return compts.day;
}

#pragma mark - 计算当月的天数
- (NSInteger)getDaysOfMonth {
    NSCalendar *calendar = [self calendar];
    NSRange days = [calendar rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:self];
    return days.length;
}

#pragma mark - 获取当前日期是星期几
- (NSInteger)getCurrentWeek {
    NSDateComponents *compts = [self components:self];
    return compts.weekday - 1;
}

#pragma mark - 获取本月第一天是星期几
- (NSInteger)getWeekInFirstDay {
    NSDate *firstDate = [self firstDay];
    NSDateComponents *compts = [self components:firstDate];
    NSArray *arr = @[@1, @6, @0, @1, @2, @3, @4, @5];
    return [arr[compts.weekday] integerValue];
}

#pragma mark - 获取本月最后一天是星期几
- (NSInteger)getWeekInLastDay {
    NSDate *lastDate = [self lastDay];
    NSDateComponents *compts = [self components:lastDate];
    NSInteger week = compts.weekday;
    return week - 1;
}

#pragma mark - 增加某些年后的日期
- (NSDate *)addYear:(NSInteger)year {
    NSCalendar *calendar = [self calendar];
    NSDateComponents *compts = [self components:self];
    compts.year += 1;
    return [calendar dateFromComponents:compts];
}

#pragma mark - 增加某些月后的日期
- (NSDate *)addMonth:(NSInteger)month {
    NSCalendar *calentar = [self calendar];
    NSDateComponents *compts = [self components:self];
    compts.month += month;
    compts.day = 1;
    return [calentar dateFromComponents:compts];
}

#pragma mark - 增加某些日后的日期
- (NSDate *)addDay:(NSInteger)day {
    NSCalendar *calendar = [self calendar];
    NSDateComponents *compts = [self components:self];
    compts.day += day;
    return [calendar dateFromComponents:compts];
}

#pragma mark - 判断两个日期是否一致
- (BOOL)isSameDate:(NSDate *)date {
    if (([self getCurrentYear] == [self getYear:date]) && ([self getCurrentMonth] == [self getMonth:date]) && ([self getCurrentDay] == [self getDay:date])) {
        return YES;
    }
    return NO;
}

@end
