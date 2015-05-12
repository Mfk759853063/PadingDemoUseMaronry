//
//  UIView+MasonryLayout.m
//  LayoutDemo
//
//  Created by huayu on 15/5/11.
//  Copyright (c) 2015年 huayu. All rights reserved.
//

#import "UIView+MasonryLayout.h"

@implementation UIView (MasonryLayout)


- (void)layoutHorizontalWithViews:(NSArray *)views
{
    NSMutableArray *spaceViews = [NSMutableArray array];
    [views enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        UIView *space = [UIView new];
        [space setBackgroundColor:[UIColor clearColor]];
        [self addSubview:space];
        [spaceViews addObject:space];
    }];
    
    UIView *space = [UIView new];
    [space setBackgroundColor:[UIColor clearColor]];
    [self addSubview:space];
    [spaceViews addObject:space];
    
    UIView *space0 = spaceViews.firstObject;
    
    [space0 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left);
        make.right.equalTo([views.firstObject mas_left]);
        make.height.equalTo(@(1));
        make.centerY.equalTo(self.mas_centerY);
    }];
    
    for (int i =1 ; i<spaceViews.count ; i++) {
        UIView *obj = spaceViews[i];
        [obj mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(space0.mas_width);
            make.height.equalTo(space0.mas_height);
            make.centerY.equalTo(space0.mas_centerY);
        }];
    }
    
    for (int i =0 ; i<views.count; i++) {
        UIView *space = spaceViews[i+1];
        UIView *view = views[i];
        UIView *nextView = nil;
        if (i + 1 < views.count) {
            nextView = views[i+1];
        }
        [space mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(view.mas_right);
            make.right.equalTo(nextView?nextView.mas_left:self.mas_right);
        }];
    }
}

- (void)layoutVerticalWithViews:(NSArray *)views
{
    NSMutableArray *spaceViews = [NSMutableArray array];
    [views enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        UIView *space = [UIView new];
        [space setBackgroundColor:[UIColor clearColor]];
        [self addSubview:space];
        [spaceViews addObject:space];
    }];
    
    UIView *space = [UIView new];
    [space setBackgroundColor:[UIColor clearColor]];
    [self addSubview:space];
    [spaceViews addObject:space];
    
    UIView *space0 = spaceViews.firstObject;
    
    [space0 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top);
        make.bottom.equalTo([views.firstObject mas_top]);
        make.width.equalTo(@(1));
        make.centerX.equalTo(self.mas_centerX);
    }];
    
    for (int i =1 ; i<spaceViews.count ; i++) {
        UIView *obj = spaceViews[i];
        [obj mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(space0.mas_height);
            make.width.equalTo(space0.mas_width);
            make.centerX.equalTo(space0.mas_centerX);
        }];
    }
    
    for (int i =0 ; i<views.count; i++) {
        UIView *space = spaceViews[i+1];
        UIView *view = views[i];
        UIView *nextView = nil;
        if (i + 1 < views.count) {
            nextView = views[i+1];
        }
        [space mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(view.mas_bottom);
            make.bottom.equalTo(nextView?nextView.mas_top:self.mas_bottom);
        }];
    }

}
@end
