
#import "FxBaseNavPage.h"

@interface FxBaseWebPage : FxBaseNavPage {
    IBOutlet UIWebView  *_webView;
}

@property(nonatomic, strong) NSString   *urlString;

- (void)loadHtml;

@end
