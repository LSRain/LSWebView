//
//  ViewController.m
//  LSWebView
//
//  Created by WangBiao on 2017/7/20.
//  Copyright © 2017年 LSRain. All rights reserved.
//

#import "ViewController.h"
#import "LSWebViewController.h"


@interface ViewController ()

@end

@implementation ViewController


- (void)targetBtnClick:(UIButton *)sender{
    [self.navigationController pushViewController:[LSWebViewController new] animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"LSWeb";
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    UIButton *targetBtn = [[UIButton alloc]initWithFrame:CGRectMake(160, 200, 80, 80)];
    [targetBtn setTitle:@"target" forState:UIControlStateNormal];
    [targetBtn setBackgroundColor:[UIColor redColor]];
    [self.view addSubview:targetBtn];
    [targetBtn addTarget:self action:@selector(targetBtnClick:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
