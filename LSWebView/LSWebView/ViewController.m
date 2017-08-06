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
    
    LSWebView *my = [[LSWebView alloc]initWithFrame:CGRectMake(0, 64, self.view.bounds.size.width, self.view.bounds.size.height)];
    [my loadURLString:webObj.url];
    [self.view addSubview:my];
    my.delegate = self;
}

#pragma mark - this is LSWebViewDelegate

- (void)lswebViewDidStartLoad:(LSWebView *)webview{
    NSLog(@"The page starts loading...");
}

- (void)lswebView:(LSWebView *)webview shouldStartLoadWithURL:(NSURL *)URL{
    NSLog(@"Intercept to URL：%@",URL);
}

- (void)lswebView:(LSWebView *)webview didFinishLoadingURL:(NSURL *)URL{
    NSLog(@"The page is loaded!");
}

- (void)lswebView:(LSWebView *)webview didFailToLoadURL:(NSURL *)URL error:(NSError *)error{
    NSLog(@"Loading error!");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
