//
//  LWCalendarButton.m
//  LWCalendar
//
//  Created by liaowei on 2018/7/6.
//  Copyright © 2018年 ijufeng. All rights reserved.
//

#import "LWCalendarButton.h"

@interface LWCalendarButton()
{
    CALayer *orginMask;
}

@end

@implementation LWCalendarButton

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.font = [UIFont systemFontOfSize:14 * scale_w];
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        self.imageView.contentMode = UIViewContentModeScaleAspectFit;
        self.backgroundColor = [UIColor clearColor];
        
        orginMask = self.layer;
    }
    return self;
}

@end
