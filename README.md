# LSWebView
Encapsulate the WKWebView and quickly browse the web(Web container. WKWebView, UIWebView package)

## Introduction
This is a tool wrapper from `WKWebView` that you can use to quickly load Url resources

## How to use
### First initialize
```objc
// >>>>>>> init Model >>>>>>
LSWebObj *webObj = [LSWebObj new];
webObj.title = @"Test Title";
webObj.url = @"https://www.baidu.com";
self.title = webObj.title;

LSWebView *my = [[LSWebView alloc]initWithFrame:self.view.bounds];
[my loadURLString:webObj.url];
[self.view addSubview:my];
my.delegate = self;
```

### And then implement its protocol
```objc
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
```

## More
[轮子之LSWebView(WKWebView封装)](https://www.lsrain.com/2017/07/20/iOS/轮子之%60LSWebView%60(WKWebView封装)/)

## Thanks
代码参考了[ZLCWebView](https://github.com/lczhai/ZLCWebView)

