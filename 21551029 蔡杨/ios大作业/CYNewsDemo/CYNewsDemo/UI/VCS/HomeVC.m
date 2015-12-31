

#import "HomeVC.h"
#import "HomeView.h"
#import "Macros.h"
#import "AppDelegate.h"
#import "LoginViewController.h"

@interface HomeVC ()
{
    HomeView *mHomeView;
}
@end

@implementation HomeVC

//-----------------------------标准方法------------------
- (id) initWithNibName:(NSString *)aNibName bundle:(NSBundle *)aBuddle {
    self = [super initWithNibName:aNibName bundle:aBuddle];
    if (self != nil) {
        [self initCommonData];
        [self initTopNavBar];
    }
    return self;
}

//主要用来方向改变后重新改变布局
- (void) setLayout: (BOOL) aPortait {

    [self setViewFrame];
}

//重载导航条
-(void)initTopNavBar{
    self.title = @"新闻头条";
    self.navigationItem.leftBarButtonItem =   [[UIBarButtonItem alloc] initWithTitle:@"注销" style:UIBarButtonItemStyleDone target:self action:@selector(cancel)];
    
   
}


- (void)cancel
{
    
    UIAlertController* callServices = [UIAlertController alertControllerWithTitle:@"提示"
                                                                          message:@"确定要退出吗"
                                                                   preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *CancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault
                                                         handler:nil];
    UIAlertAction *OKAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        UIAlertView *callServices = [[UIAlertView alloc] initWithTitle:@"警告" message:@"不允许注销"    delegate:self cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
        [callServices  show];


    }];
    [callServices addAction:CancelAction];
    [callServices addAction:OKAction];
    
    [self presentViewController:callServices animated:YES completion:nil];
    

    
   }
-(void)viewDidLoad{
    [self initView];
    self.view.backgroundColor =[UIColor whiteColor];
}

//初始化数据
-(void)initCommonData{
    
}

#if __has_feature(objc_arc)
#else
// dealloc函数
- (void) dealloc {
    [mHomeView release];
    [super dealloc];
}
#endif

// 初始View
- (void) initView {
    
    if (IS_IOS7) {
        self.edgesForExtendedLayout =UIRectEdgeNone ;
    }
    //contentView大小设置
    int vWidth = (int)([UIScreen mainScreen].bounds.size.width);
    int vHeight = (int)([UIScreen mainScreen].bounds.size.height);
    //contentView大小设置
    
    CGRect vViewRect = CGRectMake(0, 0, vWidth, vHeight -44 -20);
    UIView *vContentView = [[UIView alloc] initWithFrame:vViewRect];
    if (mHomeView == nil) {
        mHomeView = [[HomeView alloc] initWithFrame:vContentView.frame];
    }
    [vContentView addSubview:mHomeView];
    
    self.view = vContentView;
    
    [self setViewFrame];
}

//设置View方向
-(void) setViewFrame{
 
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}

//------------------------------------------------


@end
