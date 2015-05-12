//
//  ViewController.m
//  LayoutDemo
//
//  Created by huayu on 15/5/11.
//  Copyright (c) 2015年 huayu. All rights reserved.
//

#import "ViewController.h"
#import "UIView+MasonryLayout.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIView *v1 = [UIView new];
    [v1 setBackgroundColor:[UIColor randomFlatColor]];
    [self.view addSubview:v1];
    [v1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    
    UIView *v2 = [UIView new];
    [v2 setBackgroundColor:[UIColor randomFlatColor]];
    [v1 addSubview:v2];
    
    UIView *v3 = [UIView new];
    [v3 setBackgroundColor:[UIColor randomFlatColor]];
    [v1 addSubview:v3];
    
    UIView *v4 = [UIView new];
    [v4 setBackgroundColor:[UIColor randomFlatColor]];
    [v1 addSubview:v4];
    
    
    [v2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(v1.mas_centerY);
        make.width.equalTo(@(100));
        make.height.equalTo(@(100));
    }];
    
    [v3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(v1.mas_centerY);
        make.width.equalTo(v2);
        make.height.equalTo(v2);
    }];
    
    [v4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(v1.mas_centerY);
        make.width.equalTo(v2);
        make.height.equalTo(v2);
    }];
    
    NSArray *views = @[v2,v3,v4];
    
    [v1 layoutHorizontalWithViews:views];
    
    
    UIView *v5 = [UIView new];
    [v5 setBackgroundColor:[UIColor randomFlatColor]];
    [v1 addSubview:v5];
    
    UIView *v6 = [UIView new];
    [v6 setBackgroundColor:[UIColor randomFlatColor]];
    [v1 addSubview:v6];
    
    UIView *v7 = [UIView new];
    [v7 setBackgroundColor:[UIColor randomFlatColor]];
    [v1 addSubview:v7];
    
    [v5 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(v1.mas_centerX);
        make.width.equalTo(@(40));
        make.height.equalTo(@(40));
    }];
    
    [v6 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(v1.mas_centerX);
        make.width.equalTo(v5);
        make.height.equalTo(v5);
    }];
    
    [v7 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(v1.mas_centerX);
        make.width.equalTo(v5);
        make.height.equalTo(v5);
    }];

    views = @[v5,v6,v7];
    
    [v1 layoutVerticalWithViews:views];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
