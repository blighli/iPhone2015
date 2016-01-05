
#import "DetailChartPage.h"
#import "FxGetChart.h"

@implementation DetailChartPage

- (void)loadHtml
{
    [self showIndicator:LoadingTip autoHide:NO afterDelay:NO];
    
    NSString *path = [[NSBundle mainBundle] bundlePath];
    path = [path stringByAppendingPathComponent:@"Chart"];
 
    NSString *file = [path stringByAppendingPathComponent:@"temp_chart.html"];
    NSURL *url = [NSURL fileURLWithPath:file];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    
    [request setMainDocumentURL:[NSURL fileURLWithPath:path]];
    [_webView loadRequest:request];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [self executeContentOp];
}

- (void)executeContentOp
{
    NSDictionary *dictInfo = @{@"url":ChartURL
                               };
    
    _operation = [[FxGetChart alloc] initWithDelegate:self opInfo:dictInfo];
    [_operation executeOp];
}

- (void)opSuccess:(NSString *)jsonString
{
    _operation = nil;
    [self hideIndicator];
    
    NSString *jsString = [self getJsString:jsonString];
    [_webView stringByEvaluatingJavaScriptFromString:jsString];
}

- (NSString *)getJsString:(NSString *)jsonData
{
    NSString *js = [NSString stringWithFormat:@"TeacherHighCharts.mychartsphone('%@',%@,'%@','%@')",
                    jsonData,
                    @"2",
                    @"2",
                    @"商业会计|陈素兰"
                    ];
    return js;
}

@end
