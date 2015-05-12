//
//  UIView+MasonryLayout.h
//  LayoutDemo
//
//  Created by huayu on 15/5/11.
//  Copyright (c) 2015年 huayu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Masonry.h"

@interface UIView (MasonryLayout)

- (void)layoutHorizontalWithViews:(NSArray *)views;

- (void)layoutVerticalWithViews:(NSArray *)views;

@end
