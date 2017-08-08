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

/// back Button
@property (nonatomic, strong) UIBarButtonItem *backItem;
/// close Button
@property (nonatomic, strong) UIBarButtonItem *closeItem;
@property (nonatomic, weak) LSWebView *webView;

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
    [webview.wkWebView evaluateJavaScript:@"document.title" completionHandler:^(id title, NSError * _Nullable error) {
        self.title = title;
    }];
}

- (void)lswebView:(LSWebView *)webview didFailToLoadURL:(NSURL *)URL error:(NSError *)error{
    NSLog(@"Loading error!");
}

#pragma mark - Go back to the native page

- (void)closeNative{
    [self.navigationController popViewControllerAnimated:YES];
}

- (UIBarButtonItem *)closeItem
{
    if (!_closeItem) {
        _closeItem = [[UIBarButtonItem alloc] initWithTitle:@"关闭" style:UIBarButtonItemStylePlain target:self action:@selector(closeNative)];
        _closeItem.tintColor = [UIColor blackColor];
    }
    return _closeItem;
}

#pragma mark - clickBtn Method

- (void)backNative{
    if ([self.webView.wkWebView canGoBack]) {
        [self.webView.wkWebView goBack];
        self.navigationItem.leftBarButtonItems = @[self.backItem, self.closeItem];
    } else {
        [self closeNative];
    }
}

#pragma mark - addClockButton

- (void)addLeftButton
{
    self.navigationItem.leftBarButtonItem = self.backItem;
}

#pragma mark - lasy load

- (UIBarButtonItem *)backItem
{
    if (!_backItem) {
        _backItem = [[UIBarButtonItem alloc] init];
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        UIImage *image = [UIImage imageNamed:@"sy_back"];
        [btn setImage:image forState:UIControlStateNormal];
        [btn setTitle:@"返回" forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(backNative) forControlEvents:UIControlEventTouchUpInside];
        [btn.titleLabel setFont:[UIFont systemFontOfSize:17]];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn sizeToFit];
        btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        
        // Offset15
        btn.contentEdgeInsets = UIEdgeInsetsMake(0, -15, 0, 0);
        btn.frame = CGRectMake(0, 0, 40, 40);
        _backItem.customView = btn;
    }
    return _backItem;
}

#pragma mark - self Life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // >>>>>>> init Model >>>>>>
    LSWebObj *webObj = [LSWebObj new];
//    webObj.title = @"LSRain";
    webObj.url = @"https://www.lsrain.com";
    self.title = webObj.title;
    
    LSWebView *my = [[LSWebView alloc]initWithFrame:self.view.bounds];
    [my loadURLString:webObj.url];
    [self.view addSubview:my];
    my.delegate = self;
    
    _webView = my;
    [self addLeftButton];
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
