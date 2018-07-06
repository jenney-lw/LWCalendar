//
//  LWCalendarHeaderView.h
//  LWCalendar
//
//  Created by liaowei on 2018/7/5.
//  Copyright © 2018年 ijufeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LWCalendarManager.h"

@interface LWCalendarHeaderView : UIView

@property (nonatomic, strong) LWCalendarManager *manager;

- (void)initSubviews;

@end
