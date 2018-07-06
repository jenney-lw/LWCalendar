//
//  LWCalendarManager.h
//  LWCalendar
//
//  Created by liaowei on 2018/7/5.
//  Copyright © 2018年 ijufeng. All rights reserved.
//

#define kScreenBounds [UIScreen mainScreen].bounds
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

//相对iphone6布局
#define scale_w kScreenWidth / 375.0
#define scale_h kScreenHeight / 667.0

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, LWCalendar_select_type) {
    SELECT_TYPE_SINGLE = 0,
    SELECT_TYPE_MULTIPLE,
};

typedef void(^CompleteBlock)(NSArray<__kindof NSObject *> *dateArray);

@interface LWCalendarManager : NSObject

@property (nonatomic, strong) NSDate *currentDate;

@property (nonatomic, assign) BOOL isShowBeforeDate;

// 点击确定后的回掉
@property (nonatomic, assign) CompleteBlock complete;

// 选择某一天
+ (void)show_single_date:(CompleteBlock)complete;

// 选择某一段时间
+ (void)show_multi_date:(CompleteBlock)complete;

@end
