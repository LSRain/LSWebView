//
//  LSWebViewController.m
//  LSWebView
//
//  Created by WangBiao on 2017/8/8.
//  Copyright © 2017年 LSRain. All rights reserved.
//

#import "LSWebViewController.h"
#import "LSWebObj.h"
#import "LSWebView.h"

@interface LSWebViewController ()<LSWebViewDelegate>

@end

@implementation LSWebViewController


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

#pragma mark - self Life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // >>>>>>> init Model >>>>>>
    LSWebObj *webObj = [LSWebObj new];
    webObj.title = @"LSRain";
    webObj.url = @"https://www.lsrain.com";
    self.title = webObj.title;
    
    LSWebView *my = [[LSWebView alloc]initWithFrame:self.view.bounds];
    [my loadURLString:webObj.url];
    [self.view addSubview:my];
    my.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
