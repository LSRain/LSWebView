//
//  ViewController.m
//  LSWebView
//
//  Created by WangBiao on 2017/7/20.
//  Copyright © 2017年 LSRain. All rights reserved.
//

#import "ViewController.h"
#import "LSWebObj.h"
#import "LSWebView.h"

@interface ViewController ()<LSWebViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // >>>>>>> init Model >>>>>>
    LSWebObj *webObj = [LSWebObj new];
    webObj.title = @"Test Title";
    webObj.url = @"https://www.baidu.com";
    self.title = webObj.title;
    
    LSWebView *my = [[LSWebView alloc]initWithFrame:self.view.bounds];
    [my loadURLString:webObj.url];
    [self.view addSubview:my];
    my.delegate = self;
}

#pragma mark - this is LSWebViewDelegate

- (void)lswebViewDidStartLoad:(LSWebView *)webview{
    NSLog(@"页面开始加载");
}

- (void)lswebView:(LSWebView *)webview shouldStartLoadWithURL:(NSURL *)URL{
    NSLog(@"截取到URL：%@",URL);
}

- (void)lswebView:(LSWebView *)webview didFinishLoadingURL:(NSURL *)URL{
    NSLog(@"页面加载完成");
}

- (void)lswebView:(LSWebView *)webview didFailToLoadURL:(NSURL *)URL error:(NSError *)error{
    NSLog(@"加载出现错误");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
