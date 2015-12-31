//
//  CLMainViewController.m
//  my2048
//
//  Created by LYH on 15/12/29.
//  Copyright © 2015年 LYH. All rights reserved.
//
#define kAppRedirectURL @"https://api.weibo.com/oauth2/default.html"

#import "CLMainViewController.h"
#import "CLLuckyLabel.h"

static int totalScore;

@interface CLMainViewController ()
{
    UIButton *_scoreButton;
    UIButton *_bestScoreButton;
    UIButton *_restartButton;
    UIButton *_soundButton;
    UILabel *_scoreLabel;
    UILabel *_bestScoreLabel;
    
    int bestScore;
    NSString *wbtoken;
    BOOL soundEnabled;
    BOOL isSoundButtonClick;
}
@end

@implementation CLMainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    NSString *soundPath=[[NSBundle mainBundle] pathForResource:@"swipSound" ofType:@"caf"];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)[NSURL fileURLWithPath:soundPath],&swipSoundID);
    soundEnabled=YES;
    
    [self createButtons];
    [self addGesture];
    [self addBackGround];
    
    [self initData];
    [self firstBornLabel];
}
-(void)createButtons
{
    //声音按钮
    _soundButton=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    _soundButton.layer.cornerRadius=10;
    _soundButton.frame=CGRectMake(20,25,65,20);
    [_soundButton setTitle:@"关闭音效" forState:UIControlStateNormal];
    [_soundButton addTarget:self action:@selector(swipSoundControl) forControlEvents:UIControlEventTouchUpInside];
    _soundButton.userInteractionEnabled=YES;
    [_soundButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    _soundButton.backgroundColor=[UIColor colorWithRed:245/255.0 green:227/255.0 blue:199/255.0 alpha:1.0];
    isSoundButtonClick=NO;
    [self.view addSubview:_soundButton];
    
    //分数
    _scoreButton=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    _scoreButton.frame=CGRectMake(20, [UIScreen mainScreen].bounds.size.height-80, 120, 60);
    UILabel *titleLabel=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 120, 30)];
    titleLabel.textAlignment=NSTextAlignmentCenter;
    titleLabel.text=@"当前分数";
    [_scoreButton addSubview:titleLabel];
    
    _scoreLabel=[[UILabel alloc]initWithFrame:CGRectMake(0, 30, 120, 30)];
    _scoreLabel.textAlignment=NSTextAlignmentCenter;
    _scoreLabel.text=@"0";
    _scoreButton.layer.cornerRadius=10.0;
    _scoreButton.backgroundColor=[UIColor colorWithRed:237/255.0 green:207/255.0 blue:114/255.0 alpha:1.0];
    [_scoreButton addSubview:_scoreLabel];
    
    [self.view addSubview:_scoreButton];
    
    _bestScoreButton=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    _bestScoreButton.frame=CGRectMake(180, [UIScreen mainScreen].bounds.size.height-80, 120, 60);
    _bestScoreButton.layer.cornerRadius=10.0;
    _bestScoreButton.backgroundColor=[UIColor colorWithRed:237/255.0 green:207/255.0 blue:114/255.0 alpha:1.0];

    UILabel *titleLabel2=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 120, 30)];
    titleLabel2.textAlignment=NSTextAlignmentCenter;
    titleLabel2.text=@"最高分数";
    [_bestScoreButton addSubview:titleLabel2];
    
    _bestScoreLabel=[[UILabel alloc]initWithFrame:CGRectMake(0, 30, 120, 30)];
    _bestScoreLabel.textAlignment=NSTextAlignmentCenter;
    bestScore=[[NSUserDefaults standardUserDefaults] integerForKey:@"bestScore"];
    _bestScoreLabel.text=[NSString stringWithFormat:@"%d",bestScore];
    [_bestScoreButton addSubview:_bestScoreLabel];
    
    [self.view addSubview:_bestScoreButton];
    
    //重新开始按钮
    _restartButton=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    _restartButton.layer.cornerRadius=10;
    _restartButton.frame=CGRectMake(260,25,40,20);
    [_restartButton setTitle:@"重玩" forState:UIControlStateNormal];
    [_restartButton addTarget:self action:@selector(restartTheGame) forControlEvents:UIControlEventTouchUpInside];
    _restartButton.userInteractionEnabled=YES;
    [_restartButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    _restartButton.backgroundColor=[UIColor colorWithRed:245/255.0 green:227/255.0 blue:199/255.0 alpha:1.0];
    [self.view addSubview:_restartButton];
    
    //分享按钮
    UIButton *shareButton=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    shareButton.layer.cornerRadius=10;
    shareButton.frame=CGRectMake(210,25,40,20);
    [shareButton setTitle:@"分享" forState:UIControlStateNormal];
    [shareButton addTarget:self action:@selector(shareMyGame) forControlEvents:UIControlEventTouchUpInside];
    shareButton.userInteractionEnabled=YES;
    [shareButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    shareButton.backgroundColor=[UIColor colorWithRed:245/255.0 green:227/255.0 blue:199/255.0 alpha:1.0];
    [self.view addSubview:shareButton];
    
    //截图按钮
    //UIButton *screenShotButton=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    //screenShotButton.layer.cornerRadius=10;
    //screenShotButton.frame=CGRectMake(160,25,40,20);
    //[screenShotButton setTitle:@"截图" forState:UIControlStateNormal];
    //[screenShotButton addTarget:self action:@selector(screenShotAndSave) forControlEvents:UIControlEventTouchUpInside];
    //screenShotButton.userInteractionEnabled=YES;
    //[screenShotButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    //screenShotButton.backgroundColor=[UIColor colorWithRed:245/255.0 green:227/255.0 blue:199/255.0 alpha:1.0];
    //[self.view addSubview:screenShotButton];
}
-(void)restartTheGame
{
    NSLog(@"重新开始游戏");
    for (CLLuckyLabel *label in self.currentExistArray) {
        [label removeFromSuperview];
    }
    [self.currentExistArray removeAllObjects];
    [self.emptyPlaceArray removeAllObjects];
    self.isOver=NO;
    totalScore=0;
    [self initData];
    [self firstBornLabel];
    [self updateGameScore:totalScore];
}
-(void)shareMyGame
{
    
    wbtoken=[[NSUserDefaults standardUserDefaults] stringForKey:@"acessToken"];
    if (wbtoken==NULL) {
      WBAuthorizeRequest *request = [WBAuthorizeRequest request];
    request.redirectURI = kAppRedirectURL;
    request.scope = @"all";
    request.userInfo = @{@"SSO_From": @"SendMessageToWeiboViewController",
                         @"Other_Info_1": [NSNumber numberWithInt:123],
                         @"Other_Info_2": @[@"obj1", @"obj2"],
                         @"Other_Info_3": @{@"key1": @"obj1", @"key2": @"obj2"}};
    request.shouldOpenWeiboAppInstallPageIfNotInstalled=YES;
    [WeiboSDK sendRequest:request];
    }
    else
    {
        //截屏
        UIGraphicsBeginImageContext(self.view.frame.size);
        
        //获取图像
        [self.view.layer renderInContext:UIGraphicsGetCurrentContext()];
        UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
        
        //保存图像
        NSString *path = [NSHomeDirectory() stringByAppendingFormat:@"/my2014_screenShot_%@.png",[NSDate date]];
        if ([UIImagePNGRepresentation(image) writeToFile:path atomically:YES]) {
            NSLog(@"success");
            
        }
        else {
            NSLog(@"fail");
        }

        NSMutableDictionary* parameters = [NSMutableDictionary dictionary];
        
        
        [parameters setObject:[NSData dataWithContentsOfFile:path] forKey:@"pic"];
        
        [WBHttpRequest requestWithAccessToken:wbtoken url:@"https://upload.api.weibo.com/2/statuses/upload.json" httpMethod:@"POST" params:parameters delegate:self withTag:[NSString stringWithFormat:@"1"]];
    }
}


-(void)updateGameBestScore
{
    bestScore=[[NSUserDefaults standardUserDefaults] integerForKey:@"bestScore"];
    _bestScoreLabel.text=[NSString stringWithFormat:@"%d",bestScore];
}
-(void)updateGameScore:(int)score
{
    _scoreLabel.text=[NSString stringWithFormat:@"%d",score];
}
-(void)swipSoundControl
{
    if (!isSoundButtonClick) {
        soundEnabled=NO;
        [_soundButton setTitle:@"打开音效" forState:UIControlStateNormal];
    }
    else {
        soundEnabled=YES;
        [_soundButton setTitle:@"关闭音效" forState:UIControlStateNormal];
    }
    isSoundButtonClick=!isSoundButtonClick;
}
-(void)addBackGround
{
    UIImageView *imageView=[[UIImageView alloc] initWithFrame:CGRectMake(0, 55, 320, [UIScreen mainScreen].bounds.size.height)];
    imageView.userInteractionEnabled=YES;
    [self.view addSubview:imageView];
    
    self.view.backgroundColor=[UIColor lightGrayColor];
    
    UIGraphicsBeginImageContext(imageView.frame.size);
    [imageView.image drawInRect:CGRectMake(5, 0, imageView.frame.size.width-10, 425)];
    CGContextSetLineCap(UIGraphicsGetCurrentContext(), kCGLineCapButt);
    CGContextSetLineWidth(UIGraphicsGetCurrentContext(), 10.0);
    CGContextSetAllowsAntialiasing(UIGraphicsGetCurrentContext(), YES);
    CGContextSetRGBStrokeColor(UIGraphicsGetCurrentContext(), 238/255.0, 228/255.0, 218/255.0, 1.0);
    CGContextBeginPath(UIGraphicsGetCurrentContext());
    
    // 边框
    CGContextMoveToPoint(UIGraphicsGetCurrentContext(), 0, 5);
    CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), 315, 5);
    CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), 315, 305);
    CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), 5, 305);
    CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), 5, 5);
    
    // 竖线
    CGContextMoveToPoint(UIGraphicsGetCurrentContext(), 82.5, 0);
    CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), 82.5, 300);
    
    CGContextMoveToPoint(UIGraphicsGetCurrentContext(), 160, 0);
    CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), 160, 300);
    
    CGContextMoveToPoint(UIGraphicsGetCurrentContext(), 237.5, 0);
    CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), 237.5, 300);
    
    // 横线
    CGContextMoveToPoint(UIGraphicsGetCurrentContext(), 5, 80);
    CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), 315, 80);
    
    CGContextMoveToPoint(UIGraphicsGetCurrentContext(), 5, 155);
    CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), 315, 155);
    
    CGContextMoveToPoint(UIGraphicsGetCurrentContext(), 5, 230);
    CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), 315, 230);
    
    CGContextStrokePath(UIGraphicsGetCurrentContext());
    imageView.image=UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

}
-(void)initData
{
    self.emptyPlaceArray =  [NSMutableArray arrayWithObjects:
                             [NSNumber numberWithInt:11],
                             [NSNumber numberWithInt:21],
                             [NSNumber numberWithInt:31],
                             [NSNumber numberWithInt:41],
                             [NSNumber numberWithInt:12],
                             [NSNumber numberWithInt:22],
                             [NSNumber numberWithInt:32],
                             [NSNumber numberWithInt:42],
                             [NSNumber numberWithInt:13],
                             [NSNumber numberWithInt:23],
                             [NSNumber numberWithInt:33],
                             [NSNumber numberWithInt:43],
                             [NSNumber numberWithInt:14],
                             [NSNumber numberWithInt:24],
                             [NSNumber numberWithInt:34],
                             [NSNumber numberWithInt:44],
                             
                             nil];
    
    self.currentExistArray = [NSMutableArray arrayWithCapacity:16];
    self.labelArray = [NSArray arrayWithObjects:
                       [NSNumber numberWithInt:2],
                       [NSNumber numberWithInt:4],
                       nil];
    
    [self resetGameState];

}
-(void)firstBornLabel
{
    int random;
    for (int i=0; i<2; i++) {
        random = arc4random()%(self.emptyPlaceArray.count-1);
        
        NSNumber *place = [self.emptyPlaceArray objectAtIndex:random];
        [self.emptyPlaceArray removeObject:place];
        CLLuckyLabel *label = [[CLLuckyLabel alloc]init];
        label.placeTag = [place intValue];
        
        NSDictionary *dic =  [self caculatePosition:place];
        
        int random2 = arc4random()%2;
        NSNumber *textNumber = [self.labelArray objectAtIndex:random2];
        label.numberTag = textNumber.intValue;
        label.text =[NSString stringWithFormat:@"%@",textNumber];
        
        CGRect frame =  CGRectMake([[dic objectForKey:kPlaceX] intValue], [[dic objectForKey:kPlaceY] intValue], kOneLabelwidth, kOneLabelHeight);
        
        label.frame = frame;
        [self.currentExistArray addObject:label];
        [self.view addSubview:label];
    }

}
-(void)addGesture
{
    UISwipeGestureRecognizer *swip;
    
    swip=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipFrom:)];
    swip.direction=UISwipeGestureRecognizerDirectionDown;
    [self.view addGestureRecognizer:swip];
    
    swip=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipFrom:)];
    swip.direction=UISwipeGestureRecognizerDirectionUp;
    [self.view addGestureRecognizer:swip];
    
    swip=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipFrom:)];
    swip.direction=UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:swip];
    
    swip=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipFrom:)];
    swip.direction=UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:swip];
}
-(void)swipFrom:(UISwipeGestureRecognizer *)sender
{
    [self resetGameState];
    
    //判断是否开启声音
    if (soundEnabled==YES) {
    AudioServicesPlaySystemSound(swipSoundID);
    }
    
    //update game score
    int sum=0;
    for (CLLuckyLabel *label in self.currentExistArray) {
        sum+=label.numberTag;
    }
    totalScore+=sum;
    [self updateGameScore:totalScore];
    
    self.view.userInteractionEnabled=YES;
    switch (sender.direction) {
        case UISwipeGestureRecognizerDirectionDown:
            NSLog(@"下滑");
            [self moveLabel:4];
            break;
            
        case UISwipeGestureRecognizerDirectionUp:
            NSLog(@"上滑");
            [self moveLabel:3];
            break;
            
        case UISwipeGestureRecognizerDirectionLeft:
            NSLog(@"左滑");
            [self moveLabel:2];
            break;
            
        case UISwipeGestureRecognizerDirectionRight:
            NSLog(@"右滑");
            [self moveLabel:1];
            break;
            
        default:
            break;
    }
    if (self.currentExistArray.count<16&&self.canBornNewLabel) {
        [self bornNewLabel];
    }else if (self.currentExistArray.count>=16)
    {
        [self isGameOver];
    }
    [self performSelector:@selector(setUserInteractionEnabled:) withObject:[NSNumber numberWithInt:1] afterDelay:0.5f];
}
-(void)setUserInteractionEnabled:(int)number
{
    
}
-(void)resetGameState
{
    self.canBornNewLabel = NO;
    self.isOver = NO;
    self.R_1 = YES;
    self.R_2 = YES;
    self.R_3 = YES;
    self.R_4 = YES;
    self.C_1 = YES;
    self.C_2 = YES;
    self.C_3 = YES;
    self.C_4 = YES;
}
-(int)checkFrontLabel:(CLLuckyLabel *)label andDirection:(int) direction
{
    switch (direction) {
        case 1:
            for (CLLuckyLabel *childLabel in self.currentExistArray) {
                if ((label.placeTag+10==childLabel.placeTag)&&(label.numberTag==childLabel.numberTag)) {
                    CGRect frame2=label.frame;
                    frame2.origin.x+=kOneLabelwidth+10;
                    label.placeTag+=10;
                    label.frame=frame2;
                    label.numberTag=2*label.numberTag;
                    label.text=[NSString stringWithFormat:@"%d",label.numberTag];
                    [self setStateFlagDirection:1 andPlace:label.placeTag%10];
                    [self.currentExistArray removeObject:childLabel];
                    [childLabel removeFromSuperview];
                    
                    self.canBornNewLabel=YES;
                    self.isOver=NO;
                    return kHaveSameNumberLabel;
                }
                else if ((label.placeTag + 10 == childLabel.placeTag) && (label.numberTag!=childLabel.numberTag))
                {
                    return kHaveDifferentLabel;
                }
            }
            
            if ((label.placeTag + 10)/10 == 4) {
                label.placeTag += 10;
                CGRect frame2 = label.frame;
                frame2.origin.x += kOneLabelwidth+10;
                
                label.frame = frame2;
                self.canBornNewLabel =YES;
                return kHaveNoLabel;
            }
            else
            {
                label.placeTag += 10;
                CGRect frame2 = label.frame;
                frame2.origin.x += kOneLabelwidth+10;
                label.frame = frame2;
                self.canBornNewLabel = YES;
                if ([self selfStateIsValid:label andDirection:2] || [self  isFrontLabelEmpty:label andDirection:1]) {
                    [self checkFrontLabel:label andDirection:1];
                }
            }
            break;
        case 2: // left
            for (CLLuckyLabel *childLabel in self.currentExistArray) {
                if ((label.placeTag - 10 == childLabel.placeTag) && (label.numberTag == childLabel.numberTag)) {
                    
                    CGRect frame2 = label.frame;
                    frame2.origin.x -= kOneLabelwidth+10;
                    label.placeTag -= 10;
                    label.frame = frame2;
                    label.numberTag = label.numberTag*2;
                    label.text = [NSString stringWithFormat:@"%d",label.numberTag];
                    [self setStateFlagDirection:2 andPlace:label.placeTag%10];
                    [self.currentExistArray removeObject:childLabel];
                    [childLabel removeFromSuperview];
                    self.canBornNewLabel = YES;
                    self.isOver = NO;
                    return kHaveSameNumberLabel;
                }else if ((label.placeTag - 10 == childLabel.placeTag) && (label.numberTag!=childLabel.numberTag))
                {
                    
                    return kHaveDifferentLabel;
                }
            }
            //            label.placeTag += 10;
            if ((label.placeTag - 10)/10 == 1) {
                label.placeTag -= 10;
                CGRect frame2 = label.frame;
                frame2.origin.x -= kOneLabelwidth+10;
                
                label.frame = frame2;
                self.canBornNewLabel = YES;
                return kHaveNoLabel;
            }else
            {
                label.placeTag -= 10;
                CGRect frame2 = label.frame;
                frame2.origin.x -= kOneLabelwidth+10;
                label.frame = frame2;
                self.canBornNewLabel = YES;
                if ([self selfStateIsValid:label andDirection:2]) {
                    [self checkFrontLabel:label andDirection:2];
                }
                
            }
            break;
        case 3: // up
            for (CLLuckyLabel *childLabel in self.currentExistArray) {
                if ((label.placeTag - 1 == childLabel.placeTag) && (label.numberTag == childLabel.numberTag)) {
                    
                    CGRect frame3 = label.frame;
                    frame3.origin.y -= kOneLabelHeight+10;
                    label.placeTag -= 1;
                    label.frame = frame3;
                    label.numberTag = label.numberTag*2;
                    label.text = [NSString stringWithFormat:@"%d",label.numberTag];
                    [self setStateFlagDirection:3  andPlace:label.placeTag/10];
                    [self.currentExistArray removeObject:childLabel];
                    [childLabel removeFromSuperview];
                    self.canBornNewLabel = YES;
                    self.isOver = NO;
                    return kHaveSameNumberLabel;
                    
                }else if ((label.placeTag - 1 == childLabel.placeTag) && (label.numberTag!=childLabel.numberTag))
                {
                    return kHaveDifferentLabel;
                }
            }
            if ((label.placeTag - 1)%10 == 1) {
                label.placeTag -= 1;
                CGRect frame3 = label.frame;
                frame3.origin.y -= kOneLabelHeight+10;
                
                label.frame = frame3;
                self.canBornNewLabel = YES;
                return kHaveNoLabel;
            }else
            {
                label.placeTag -= 1;
                CGRect frame3 = label.frame;
                frame3.origin.y -= kOneLabelHeight+10;
                label.frame = frame3;
                self.canBornNewLabel = YES;
                if ([self selfStateIsValid:label andDirection:3]) {
                    [self checkFrontLabel:label andDirection:3];
                }
                
            }
            
            
            break;
        case 4: // down
            for (CLLuckyLabel *childLabel in self.currentExistArray) {
                if ((label.placeTag + 1 == childLabel.placeTag) && (label.numberTag == childLabel.numberTag)) {
                    
                    CGRect frame4 = label.frame;
                    frame4.origin.y += kOneLabelHeight+10;
                    label.placeTag += 1;
                    label.frame = frame4;
                    label.numberTag = label.numberTag*2;
                    label.text = [NSString stringWithFormat:@"%d",label.numberTag];
                    [self setStateFlagDirection:3  andPlace:label.placeTag/10];
                    [self.currentExistArray removeObject:childLabel];
                    [childLabel removeFromSuperview];
                    self.canBornNewLabel = YES;
                    self.isOver = NO;
                    return kHaveSameNumberLabel;
                    
                }else if ((label.placeTag +1 == childLabel.placeTag) && (label.numberTag!=childLabel.numberTag))
                {
                    return kHaveDifferentLabel;
                }
            }
            if ((label.placeTag + 1)%10 == 4) {
                label.placeTag += 1;
                CGRect frame4 = label.frame;
                frame4.origin.y += kOneLabelHeight+10;
                
                label.frame = frame4;
                self.canBornNewLabel = YES;
                return kHaveNoLabel;
            }else
            {
                label.placeTag += 1;
                CGRect frame4 = label.frame;
                frame4.origin.y += kOneLabelHeight+10;
                label.frame = frame4;
                self.canBornNewLabel = YES;
                if ([self selfStateIsValid:label andDirection:4]) {
                    [self checkFrontLabel:label andDirection:4];
                }
                
            }
            
            break;
            
        default:
            break;
    }
    
    return 0;
    
}
-(void)moveLabel:(int) directionFlag
{
    NSMutableArray *array1 = [[NSMutableArray alloc]initWithCapacity:4];
    NSMutableArray *array2 = [[NSMutableArray alloc]initWithCapacity:4];
    NSMutableArray *array3 = [[NSMutableArray alloc]initWithCapacity:4];
    NSMutableArray *array4 = [[NSMutableArray alloc]initWithCapacity:4];
    
    switch (directionFlag)
    {
        case 1: //right
            for (CLLuckyLabel *label in self.currentExistArray) {
                switch (label.placeTag/10) {
                    case 4:
                        [array1 addObject:label];
                        break;
                    case 3:
                        [array2 addObject:label];
                        break;
                    case 2:
                        [array3 addObject:label];
                        break;
                    case 1:
                        [array4 addObject:label];
                        break;
                    default:
                        break;
                }
            }
            for (CLLuckyLabel *childLabel in array2) {
                
                [self checkFrontLabel:childLabel andDirection:1];
            }
            for (CLLuckyLabel *childLabel in array3) {
                
                [self checkFrontLabel:childLabel andDirection:1];
            }
            for (CLLuckyLabel *childLabel in array4) {
                [self checkFrontLabel:childLabel andDirection:1];
            }
            break;
        case 2: //left
            for (CLLuckyLabel *label in self.currentExistArray) {
                switch (label.placeTag/10) {
                    case 1:
                        [array1 addObject:label];
                        break;
                    case 2:
                        [array2 addObject:label];
                        break;
                    case 3:
                        [array3 addObject:label];
                        break;
                    case 4:
                        [array4 addObject:label];
                        break;
                    default:
                        break;
                }
            }
            for (CLLuckyLabel *childLabel in array2) {
                [self checkFrontLabel:childLabel andDirection:2];
                
            }
            for (CLLuckyLabel *childLabel in array3) {
                [self checkFrontLabel:childLabel andDirection:2];
                
            }
            for (CLLuckyLabel *childLabel in array4) {
                [self checkFrontLabel:childLabel andDirection:2];
                
            }
            break;
        case 3: // up
            for (CLLuckyLabel *label in self.currentExistArray) {
                switch (label.placeTag%10) {
                    case 1:
                        [array1 addObject:label];
                        break;
                    case 2:
                        [array2 addObject:label];
                        break;
                    case 3:
                        [array3 addObject:label];
                        break;
                    case 4:
                        [array4 addObject:label];
                        break;
                    default:
                        break;
                }
            }
            for (CLLuckyLabel *childLabel in array2) {
                [self checkFrontLabel:childLabel andDirection:3];
            }
            for (CLLuckyLabel *childLabel in array3) {
                [self checkFrontLabel:childLabel andDirection:3];
            }
            for (CLLuckyLabel *childLabel in array4) {
                [self checkFrontLabel:childLabel andDirection:3];
            }
            break;
        case 4: // down
            for (CLLuckyLabel *label in self.currentExistArray) {
                switch (label.placeTag%10) {
                    case 4:
                        [array1 addObject:label];
                        break;
                    case 3:
                        [array2 addObject:label];
                        break;
                    case 2:
                        [array3 addObject:label];
                        break;
                    case 1:
                        [array4 addObject:label];
                        break;
                    default:
                        break;
                }
            }
            
            for (CLLuckyLabel *childLabel in array2) {
                [self checkFrontLabel:childLabel andDirection:4];
            }
            for (CLLuckyLabel *childLabel in array3) {
                [self checkFrontLabel:childLabel andDirection:4];
            }
            for (CLLuckyLabel *childLabel in array4) {
                [self checkFrontLabel:childLabel andDirection:4];
            }
            break;
        default:
            break;
    }
}
-(void)bornNewLabel
{
    if(self.currentExistArray.count<16){
    //设置空余方格的数列
    [self.emptyPlaceArray removeAllObjects];
    [self.emptyPlaceArray addObject:[NSNumber numberWithInt:11]];
    [self.emptyPlaceArray addObject:[NSNumber numberWithInt:21]];
    [self.emptyPlaceArray addObject:[NSNumber numberWithInt:31]];
    [self.emptyPlaceArray addObject:[NSNumber numberWithInt:41]];
    [self.emptyPlaceArray addObject:[NSNumber numberWithInt:12]];
    [self.emptyPlaceArray addObject:[NSNumber numberWithInt:22]];
    [self.emptyPlaceArray addObject:[NSNumber numberWithInt:32]];
    [self.emptyPlaceArray addObject:[NSNumber numberWithInt:42]];
    [self.emptyPlaceArray addObject:[NSNumber numberWithInt:13]];
    [self.emptyPlaceArray addObject:[NSNumber numberWithInt:23]];
    [self.emptyPlaceArray addObject:[NSNumber numberWithInt:33]];
    [self.emptyPlaceArray addObject:[NSNumber numberWithInt:43]];
    [self.emptyPlaceArray addObject:[NSNumber numberWithInt:14]];
    [self.emptyPlaceArray addObject:[NSNumber numberWithInt:24]];
    [self.emptyPlaceArray addObject:[NSNumber numberWithInt:34]];
    [self.emptyPlaceArray addObject:[NSNumber numberWithInt:44]];
    for (CLLuckyLabel *label in self.currentExistArray) {
        [self.emptyPlaceArray removeObject:[NSNumber numberWithInt:label.placeTag]];
    }
    
    //随机数必须小于空余方格的个数
    int random;
    if (self.emptyPlaceArray.count>1) {
        random=arc4random()%(self.emptyPlaceArray.count-1);
    }else{
        random=0;
    }
    
    //每次移动新增一个随机数字，设置每次移动的数字随机位置
    NSNumber *place=[self.emptyPlaceArray objectAtIndex:random];
    CLLuckyLabel *label=[[CLLuckyLabel alloc]init];
    label.placeTag=[place intValue];
    NSDictionary *dic=[self caculatePosition:place];
    
    //设置每次移动的数字大小
    int random2=arc4random()%2;
    NSNumber *textNumber=[self.labelArray objectAtIndex:random2];
    label.numberTag=[textNumber intValue];
    label.text=[NSString stringWithFormat:@"%@",textNumber];
    CGRect frame=CGRectMake([[dic objectForKey:kPlaceX] intValue], [[dic objectForKey:kPlaceY] intValue] , kOneLabelwidth, kOneLabelHeight);
    label.frame=frame;
    
    [self.currentExistArray addObject:label];
    [self.view addSubview:label];
    }
    else{
        [self isGameOver];
    }
}
-(void)isGameOver
{
    self.isOver = YES;
    //    [self moveLabel:1];
    //    [self moveLabel:2];
    //    [self moveLabel:3];
    //    [self moveLabel:4];
    bestScore=[[NSUserDefaults standardUserDefaults] integerForKey:@"bestScore"];
    
    if (self.isOver == YES) {
        if (totalScore>bestScore) {
            bestScore=totalScore;
            [[NSUserDefaults standardUserDefaults] setInteger:bestScore forKey:@"bestScore"];
            [self updateGameBestScore];
            UIAlertView *alertView =  [[UIAlertView alloc]initWithTitle:@"Game Over" message:[NSString stringWithFormat:@"恭喜你，获得了新的记录：%d分，好棒哟！再来一局？",totalScore] delegate:self cancelButtonTitle:@"再来一局" otherButtonTitles:@"截图",@"分享", nil];
            alertView.tag=100;
            [alertView show];
        }
        else{
            UIAlertView *alertView =  [[UIAlertView alloc]initWithTitle:@"Game Over" message:[NSString stringWithFormat:@"你获得了%d分，继续努力！再来一局？",totalScore] delegate:self cancelButtonTitle:@"再来一局" otherButtonTitles:@"截图",@"截图并分享", nil];
            alertView.tag=101;
            [alertView show];
        }
    }
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (alertView.tag==100||alertView.tag==101) {
    if (buttonIndex==0) {
        [self restartTheGame];
    }
        else if (buttonIndex==1)
        {
            //[self screenShotAndSave];
        }
        else{
            [self shareMyGame];
        }
    }
}
-(NSDictionary *)caculatePosition:(NSNumber *)placeNumber
{
    int place=[placeNumber intValue];
    int x = 10+(kOneLabelwidth+10)*(place/10-1);
    int y = 65+(kOneLabelHeight+10)*(place%10-1);
//    x = x-kOneLabelwidth/2;
//    y = y-kOneLabelHeight/2;
    
    NSDictionary *dic = [[NSDictionary alloc]initWithObjectsAndKeys:
                         [NSNumber numberWithInt:x],kPlaceX,
                         [NSNumber numberWithInt:y],kPlaceY,
                         nil];
    
    return dic;

}
-(void)setStateFlagDirection:(int)direction andPlace:(int) rORc
{
    
    if ((direction == kRight ) || (direction == kLeft)) {
        
        switch (rORc) {
            case 1:
                self.R_1 = NO;
                break;
            case 2:
                self.R_2 = NO;
                break;
            case 3:
                self.R_3 = NO;
                break;
            case 4:
                self.R_4 = NO;
                break;
                
            default:
                break;
        }
        
        
    }else if ((direction == kUp ) || (direction == kDown))
    {
        switch (rORc) {
            case 1:
                self.C_1 = NO;
                break;
            case 2:
                self.C_2 = NO;
                break;
            case 3:
                self.C_3 = NO;
                break;
            case 4:
                self.C_4 = NO;
                break;
                
            default:
                break;
        }
        
        
    }
    
    
    
}
-(BOOL)selfStateIsValid:(CLLuckyLabel *)label andDirection:(int)direction
{
    if ((direction == kRight ) || (direction == kLeft))
    {
        switch (label.placeTag%10) {
            case 1:
                return self.R_1;
                break;
            case 2:
                return self.R_2;
                break;
            case 3:
                return self.R_3;
                break;
            case 4:
                return self.R_4;
                break;
            default:
                break;
        }
        
    }else if ((direction == kUp ) || (direction == kDown))
    {
        
        switch (label.placeTag/10) {
            case 1:
                return self.C_1;
                break;
            case 2:
                return self.C_2;
                break;
            case 3:
                return self.C_3;
                break;
            case 4:
                return self.C_4;
                break;
            default:
                break;
        }
        
    }
    
    return NO;
    
}
-(BOOL)isFrontLabelEmpty:(CLLuckyLabel *)label andDirection:(int) direction
{
    
    switch (direction) {
        case kRight:
            for (CLLuckyLabel *childLabel in self.currentExistArray) {
                
                if ((label.placeTag+10) == childLabel.placeTag) {
                    return NO;
                }
            }
            break;
        case kLeft:
            for (CLLuckyLabel *childLabel in self.currentExistArray) {
                
                if ((label.placeTag-10) == childLabel.placeTag) {
                    return NO;
                }
            }
            break;
        case kUp:
            for (CLLuckyLabel *childLabel in self.currentExistArray) {
                
                if ((label.placeTag-1) == childLabel.placeTag) {
                    return NO;
                }
            }
            break;
        case kDown:
            for (CLLuckyLabel *childLabel in self.currentExistArray) {
                
                if ((label.placeTag+1) == childLabel.placeTag) {
                    return NO;
                }
            }
            break;
            
        default:
            break;
    }
    
    
    return YES;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
