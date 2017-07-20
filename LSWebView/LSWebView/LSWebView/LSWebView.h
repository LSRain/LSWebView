//
//  LSWebView.h
//  LSWebView
//
//  Created by WangBiao on 2017/7/20.
//  Copyright © 2017年 LSRain. All rights reserved.
//

/*
 感谢作者
 以下代码参考自 https://github.com/lczhai/ZLCWebView
 get from https://github.com/lczhai/ZLCWebView
 */

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>

@class LSWebView;
@protocol LSWebViewDelegate <NSObject>
@optional

/**
 page loaded delegate

 @param webview webView
 @param URL url
 */
- (void)lswebView:(LSWebView *)webview didFinishLoadingURL:(NSURL *)URL;

/**
 Loading error delegate

 @param webview webView
 @param URL url
 @param error error Message
 */
- (void)lswebView:(LSWebView *)webview didFailToLoadURL:(NSURL *)URL error:(NSError *)error;

/**
 Intercept URL delegate

 @param webview webView
 @param URL url
 */
- (void)lswebView:(LSWebView *)webview shouldStartLoadWithURL:(NSURL *)URL;

/**
 start loading delegate

 @param webview webView
 */
- (void)lswebViewDidStartLoad:(LSWebView *)webview;

@end

@interface LSWebView : UIView<WKNavigationDelegate, WKUIDelegate, UIWebViewDelegate>

#pragma mark - Public Properties

// delegate
@property (nonatomic, weak) id <LSWebViewDelegate> delegate;

// The main and only UIProgressView
@property (nonatomic, strong) UIProgressView *progressView;
// The web views
// Depending on the version of iOS, one of these will be set
@property (nonatomic, strong) WKWebView *wkWebView;
@property (nonatomic, strong) UIWebView *uiWebView;

#pragma mark - Initializers view
- (instancetype)initWithFrame:(CGRect)frame;

#pragma mark - Static Initializers
@property (nonatomic, strong) UIBarButtonItem *actionButton;
@property (nonatomic, strong) UIColor *tintColor;
@property (nonatomic, strong) UIColor *barTintColor;
@property (nonatomic, assign) BOOL actionButtonHidden;
@property (nonatomic, assign) BOOL showsURLInNavigationBar;
@property (nonatomic, assign) BOOL showsPageTitleInNavigationBar;

// Allow for custom activities in the browser by populating this optional array
@property (nonatomic, strong) NSArray *customActivityItems;

#pragma mark - Public Interface


// Load a NSURLURLRequest to web view
// Can be called any time after initialization
- (void)loadRequest:(NSURLRequest *)request;

// Load a NSURL to web view
// Can be called any time after initialization
- (void)loadURL:(NSURL *)URL;

// Loads a URL as NSString to web view
// Can be called any time after initialization
- (void)loadURLString:(NSString *)URLString;


// Loads an string containing HTML to web view
// Can be called any time after initialization
- (void)loadHTMLString:(NSString *)HTMLString;

@end
