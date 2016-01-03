//
//  NoteViewController.m
//  postCard
//
//  Created by 毛毛 on 15/12/15.
//  Copyright (c) 2015年 毛毛. All rights reserved.
//

#import "NoteViewController.h"
#import "SecondViewController.h"
#import "DB.h"
#import "PostDataBase.h"
#import "PostModel.h"
#import <CoreLocation/CoreLocation.h>
#import <MessageUI/MessageUI.h>



@interface NoteViewController ()<UITextFieldDelegate,UIActionSheetDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate,CLLocationManagerDelegate,MFMailComposeViewControllerDelegate>

@end

@implementation NoteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 背景图片
    UIImageView *back = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight)];
    [back setImage:[UIImage imageNamed:@"back3.jpg"]];
    [self.view addSubview:back];
    
    
    [self creatScroll];
    [self creatTextField];
    // 如果是从第2，3个页面点进来 是有值的，要赋值
    if ([self.HasValue isEqualToString:@"HasValue"]) {
        [self.picimage setImage:[UIImage imageNamed:_model.stamp]];
        [self.text setText:_model.content];
        NSString *path = [[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"] stringByAppendingPathComponent:[NSString stringWithFormat:@"%ld.png", (long)_model.infoId]];
        UIImage *ima = [[UIImage alloc] initWithContentsOfFile:path];
        
        self.bigimage.contentMode = UIViewContentModeScaleAspectFill;   ////////////////////////
        [self.bigimage setImage:ima];
        if ([_model.locate isEqualToString:@"(null)"]) {
            [self.loclabel setText:@""];
        }else{
           [self.loclabel setText:_model.locate];
        }
        
    }
    
    [self creatDoneButton];
    [self creatCameraButton];
    [self creatLocateButton];
    [self creatEmailButton];
    
    // 测试位置使用
//    CLLocationCoordinate2D coo = CLLocationCoordinate2DMake(99, 900);
//    CLLocationDistance r = 100;
//    CLCircularRegion *re = [[CLCircularRegion alloc] initWithCenter:coo radius:r identifier:@"addres"];
//    [self.locateManager startMonitoringForRegion:re];
    
    
}


#pragma mark ScrollView
- (void)creatScroll
{
    self.scroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, VIEW_WIDTH(self.view), VIEW_HEIGHT(self.view))];
    [_scroll setBackgroundColor:[UIColor clearColor]];
    [_scroll setContentSize:CGSizeMake(0, 100)];
    
    self.borderimage = [[UIImageView alloc] initWithFrame:CGRectMake(20, 20, ScreenWidth/3.5, ScreenHeight/5.9)];
    self.picimage = [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, VIEW_WIDTH(_borderimage)-10, VIEW_HEIGHT(_borderimage)-10)];
    
    [self.borderimage setImage:[UIImage imageNamed:@"bian.jpg"]];
    [self.picimage setImage:[UIImage imageNamed:self.pic]];
    
    // 结束编辑
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
    [self.scroll addGestureRecognizer:tap];
    
    [self.borderimage addSubview:_picimage];
    [self.scroll addSubview:_borderimage];
    [self.view addSubview:_scroll];
    
}

// 结束编辑
- (void)tapAction:(id)sender
{
    [self.view endEditing:YES];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}


#pragma mark TextField
- (void)creatTextField
{
    self.bigimage = [[UIImageView alloc] initWithFrame:CGRectMake(15, VIEW_HEIGHT(_borderimage)+ VIEW_ORIGIN_Y(_borderimage)+5, ScreenWidth/1.1, ScreenHeight/2.5)];
    self.bigimage.layer.cornerRadius = 7;
    self.bigimage.layer.masksToBounds = YES;
    [self.bigimage setBackgroundColor:[UIColor whiteColor]];
    
    self.text = [[UITextField alloc] initWithFrame:CGRectMake(15, VIEW_ORIGIN_Y(_bigimage), VIEW_WIDTH(_bigimage), ScreenHeight/5)];
    [_text setPlaceholder:@"  write words.."];
    [_text setBackgroundColor:[UIColor clearColor]];
    [_text setBorderStyle:UITextBorderStyleRoundedRect];
    [_text setFont:[UIFont boldSystemFontOfSize:17]];
    
    
    _text.delegate = self;
    
    self.loclabel = [[UILabel alloc] initWithFrame:CGRectMake(0, VIEW_HEIGHT(_text)+0.16*ScreenHeight, VIEW_WIDTH(_bigimage), 25)];
    [self.loclabel setFont:[UIFont systemFontOfSize:12]];
    [self.loclabel setBackgroundColor:[UIColor whiteColor]];
    
    [self.bigimage addSubview:_loclabel];
    [self.scroll addSubview:_bigimage];
    [self.scroll addSubview:_text];
}
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    [_scroll setContentOffset:CGPointMake(0, 100)];
}
- (void)textFieldDidEndEditing:(UITextField *)textField
{
    [_scroll setContentOffset:CGPointMake(0, 0)];
}

#pragma mark 相机
- (void)creatCameraButton
{
    UIButton *came = [[UIButton alloc] initWithFrame:CGRectMake(ScreenWidth/2-ScreenWidth/6.8/2, ScreenHeight/1.5, ScreenWidth/6.8, ScreenHeight/12)];
    [came setBackgroundImage:[UIImage imageNamed:@"camera.png"] forState:UIControlStateNormal];
    [came addTarget:self action:@selector(cameraAction) forControlEvents:UIControlEventTouchUpInside];
    [self.scroll addSubview:came];
}

- (void)cameraAction
{
    UIActionSheet *sheet;
    
    // 判断是否支持相机
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        
        sheet = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:nil destructiveButtonTitle:@"取消" otherButtonTitles:@"拍照",@"从相册选择", nil];
    } else {
        
        sheet = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:nil destructiveButtonTitle:@"取消" otherButtonTitles:@"从相册选择", nil];
    }
    
    [sheet showInView:_scroll];
}

// 弹出框
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSUInteger sourceType = 0;
    // 判断是否支持相机
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        switch (buttonIndex) {
            case 0:
                return;
            case 1:
                sourceType = UIImagePickerControllerSourceTypeCamera;
                break;
            case 2:
                sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
                break;
        }
    } else {
        switch (buttonIndex) {
            case 0:
                return;
            case 1:
                sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
                break;
        }
    }
    UIImagePickerController *pcController = [[UIImagePickerController alloc] init];
    pcController.sourceType = sourceType;
    pcController.delegate = self;
    pcController.allowsEditing = YES;
    //[self presentViewController:pcController animated:YES completion:nil];
    
    if([[[UIDevice currentDevice] systemVersion] floatValue]>=8.0)
    {
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            
            [self presentViewController:pcController animated:YES completion:nil];
        }];
        
    }
    else{
        
        [self presentViewController:pcController animated:YES completion:nil];
    }
    
}

// ImagePickerControllerDelegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    self.bigimage.contentMode = UIViewContentModeScaleAspectFill;      //////////////////////////
    self.bigimage.image = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
    
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:YES completion:nil];
}

// 保存图片至沙盒
- (NSString *)saveImage:(UIImage *)current withname:(NSString *)name
{
    NSData *imadata = UIImageJPEGRepresentation(current, 0.5);
    NSString *path = [[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"] stringByAppendingPathComponent:name];
    [imadata writeToFile:path atomically:NO];
    return path;
    
}

#pragma mark 定位

- (void)creatLocateButton
{
    UIButton *loc = [[UIButton alloc] initWithFrame:CGRectMake(ScreenWidth/2+ScreenWidth/7, ScreenHeight/1.46, ScreenWidth/12, ScreenHeight/20)];
    [loc setBackgroundImage:[UIImage imageNamed:@"locate.png"] forState:UIControlStateNormal];
    [loc addTarget:self action:@selector(locateAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.scroll addSubview:loc];
}

- (void)locateAction:(id)sender
{
    
    self.locateManager = [[CLLocationManager alloc] init];
    _locateManager.delegate = self;

    if ([[UIDevice currentDevice].systemVersion floatValue] >= 8.0) {
#ifdef __IPHONE_8_0
        
        [_locateManager requestAlwaysAuthorization];
#endif

    }
    
    [_locateManager setDistanceFilter:kCLDistanceFilterNone];
    [_locateManager setDesiredAccuracy:kCLLocationAccuracyBest];
    
    
    [self.locateManager startUpdatingLocation];

}


// CLLocationManager 代理方法
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    CLLocation *currentlocate = [locations lastObject];
    CLLocationCoordinate2D coor = currentlocate.coordinate;
    
    NSLog(@"jingdu：%f,weidu:%f", coor.longitude,coor.latitude);
    self.JW = [NSString stringWithFormat:@"经度:%f,纬度:%f", coor.longitude, coor.latitude];
    //[self.loclabel setText:_JW];
    
    // 测试使用
//    //获取当前缓存的位置
//    CLLocation *currLocation = [locations lastObject];
//    //获取上次取的位置与现在的时间间隔
//    NSTimeInterval interval = [[currLocation timestamp] timeIntervalSinceNow];
//    //如果在30秒内 则直接输入你的位置
//    if(interval >-30&&interval<0)
//    {
//        //输出经纬度
//        NSLog(@"%.4f,%.4f",currLocation.coordinate.latitude,currLocation.coordinate.longitude);
//        [self.locateManager stopUpdatingLocation];
//    }
    
    CLGeocoder *geo = [[CLGeocoder alloc] init];
    [geo reverseGeocodeLocation:currentlocate completionHandler:^(NSArray *placemarks, NSError *error) {
//        if (placemarks.count > 0) {
//            CLPlacemark *place = [placemarks objectAtIndex:0];
//            NSLog(@"%@", place.name);
//
//            NSString *city = place.locality;
//            if (!city) {
//                city = place.administrativeArea;
//            }
//            NSLog(@"%@", city);
//            [self.loclabel setText:place.name];
//            
//        }
//        else if (error == nil && [placemarks count] == 0){
//            NSLog(@"No results were returned");
//        }
//        else if (error != nil){
//            NSLog(@"An error occurred = %@", error);
//        }
        if (!error)
        {
            for (CLPlacemark * placemark in placemarks) {
                
                NSDictionary *addressDic=placemark.addressDictionary;
                
                NSString *state=[addressDic objectForKey:@"State"];
                NSString *city=[addressDic objectForKey:@"City"];
                NSString *subLocality=[addressDic objectForKey:@"SubLocality"];
                NSString *street=[addressDic objectForKey:@"Street"];
                
                NSLog(@"%@,%@,%@,%@", state, city, subLocality, street);
                NSString *di = [NSString stringWithFormat:@"%@,%@,%@,%@", state, city, subLocality, street];
                [self.loclabel setText:di];
                
            }
        }
    }];
    
    [manager stopUpdatingLocation];
}


- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    [manager stopUpdatingLocation];
    NSLog(@"%@", error);
}


#pragma mark 邮件

- (void)creatEmailButton
{
    UIButton *em = [[UIButton alloc] initWithFrame:CGRectMake(ScreenWidth/4, ScreenHeight/1.47, ScreenWidth/9, ScreenHeight/16)];
    [em setBackgroundImage:[UIImage imageNamed:@"youjian.png"] forState:UIControlStateNormal];
    [em addTarget:self action:@selector(showPicher:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.scroll addSubview:em];
}

//激活邮件功能
- (void)showPicher:(UIButton *)button
{
//    NSString *judge = [PostDataBase selectByModel:_model];
//    if (judge.length == 0) {
//        self.savealert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"请先保存噢" delegate:self cancelButtonTitle:nil otherButtonTitles:nil, nil];
//        [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(performDismiss:) userInfo:nil repeats:NO];
//        [_savealert show];
//    }else{
        //初始化MFMailComposeViewController，构造邮件体
        Class mailClass = NSClassFromString(@"MFMailComposeViewController");
        if (mailClass != nil) {
            //+ (BOOL)canSendMail方法检查用户是否设置了邮件账户
            if ([mailClass canSendMail]) {
                [self saveModel];                  ///////////////////////////////////
                
                [self displayComposerSheet];//调出邮件发送窗口
                
            }else{
                UIAlertView *alet = [[UIAlertView alloc] initWithTitle:@"提示" message:@"您没有绑定账户" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
                [alet show];
            }
        }
   // }
    
}
-(void) performDismiss:(NSTimer *)timer
{
    [_savealert dismissWithClickedButtonIndex:0 animated:NO];
}

//MFMailComposeViewControllerDelegate 处理邮件发送事件
-(void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    //关闭邮件发送窗口
    if (result == MFMailComposeResultFailed) {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Message Failed!" message:@"Your email has failed to send" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles: nil];
        [alert show];
    }
    switch (result)
    {
        case MFMailComposeResultCancelled:
            NSLog(@"Mail send canceled...");
            break;
        case MFMailComposeResultSaved:
            NSLog(@"Mail saved...");
            break;
        case MFMailComposeResultSent:
            NSLog(@"Mail sent...");
            break;
        case MFMailComposeResultFailed:
            NSLog(@"Mail send errored: %@...", [error localizedDescription]);
            break;
        default:
            break;
    }
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

//调出邮件发送窗口,可以发送邮件的话
-(void)displayComposerSheet
{
    MFMailComposeViewController *mc = [[MFMailComposeViewController alloc] init];
    mc.mailComposeDelegate = self;
    
    
    //设置主题
    [mc setSubject:@"Hi,i send u a postcard"];
    
    // 添加图片
//    UIImage *addPic = [UIImage imageNamed: @"10.png"];
//    NSData *imageData = UIImagePNGRepresentation(addPic);            // png
//    NSData *imageData = UIImageJPEGRepresentation(addPic, 1);    // jpeg
//    [mc addAttachmentData: imageData mimeType: @"" fileName: @"10.png"];
//    
//    NSString *emailBody = self.textView.text;//正文
//    [mc setMessageBody:emailBody isHTML:NO];
    
    
    NSString *emailBody = self.loclabel.text;//正文  /////////////////////
    [mc setMessageBody:emailBody isHTML:NO];
    
    NSString *path = [[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"] stringByAppendingPathComponent:[NSString stringWithFormat:@"%ldDone.png", (long)_model.infoId]];
    UIImage *fullimage = [[UIImage alloc] initWithContentsOfFile:path];
    NSData *imagedata = UIImagePNGRepresentation(fullimage);
    [mc addAttachmentData:imagedata mimeType:@"" fileName:path];
    
    [self presentViewController:mc animated:YES completion:nil];
    
}



#pragma mark Done

- (void)creatDoneButton
{
    UIButton *done = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 32, 32)];
    [done setBackgroundImage:[UIImage imageNamed:@"done.png"] forState:UIControlStateNormal];
    [self.navigationItem setRightBarButtonItem:[[UIBarButtonItem alloc] initWithCustomView:done]];
    [done addTarget:self action:@selector(DoneAction) forControlEvents:UIControlEventTouchUpInside];
    
    
}
- (void)saveModel
{
    [DB shareDataBase];
    // 主键
    NSDateFormatter *date = [[NSDateFormatter alloc] init];
    [date setDateFormat:@"MddHHmmss"];
    NSString *datestr = [date stringFromDate:[NSDate date]];
    // 保存照片
    NSString *path = [self saveImage:_bigimage.image withname:[NSString stringWithFormat:@"%@.png",datestr]];
    // 插入model
    PostModel *model = [PostModel postModelWithId:[datestr integerValue] photo:path locate:self.loclabel.text content:self.text.text stamp:self.pic];
    [PostDataBase insertWithModel:model];
    // 合成图片
    UIImage *DoneImage = [self addImage:_picimage field1:self.text toImage:_bigimage];
    // 保存图片
    [self saveImage:DoneImage withname:[NSString stringWithFormat:@"%@Done.png",datestr]];
    if (_model!= nil) {
         // 完成之后先删除原有model和图片
    [PostDataBase deleteWithModel:_model];
    NSString *path2 = [[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"] stringByAppendingPathComponent:[NSString stringWithFormat:@"%ld.png",(long)_model.infoId]];
    [[NSFileManager defaultManager] removeItemAtPath:path2 error:nil];
    
    NSString *path4 = [[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"] stringByAppendingPathComponent:[NSString stringWithFormat:@"%ldDone.png",(long)_model.infoId]];
    [[NSFileManager defaultManager] removeItemAtPath:path4 error:nil];
    }
    
    _model = model; /////重大失误

}
- (void)DoneAction
{
    [self.view endEditing:YES];
    
    [self saveModel];
    
    // 跳到card页面
    [self.tabBarController setSelectedIndex:1];
    [self.navigationController popViewControllerAnimated:YES];
}


// 将view转化成image
- (UIImage*)addImage:(UIImageView*)image1 field1:(UITextField *)field1 toImage:(UIImageView*)image2 {
    
    CGSize size=CGSizeMake(image2.frame.size.width,image2.frame.size.height);
    
    UIGraphicsBeginImageContext(size);
    // Draw image1
    
    [image2.image drawInRect:CGRectMake(0,0, image2.frame.size.width, image2.frame.size.height)];
    // Draw image2
    
    [image1.image drawInRect:CGRectMake(0,0, image1.frame.size.width, image1.frame.size.height)];
    
    [field1 drawTextInRect:CGRectMake(60, 80, 200, 100)];
    
    UIImage*resultingImage =UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return resultingImage;
    
}

//将view转化成image
//+ (UIImage *)getImageFromView:(UIView *)theView
//{
//    
//    UIGraphicsBeginImageContextWithOptions(theView.bounds.size, NO, theView.layer.contentsScale);
//    [theView.layer renderInContext:UIGraphicsGetCurrentContext()];
//    UIImage *image=UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();
//    return image;
//}



// 方法传值
- (void)getPic :(NSString *)str
{
    self.pic = str;
    
}

- (void)getModel:(PostModel *)model
{
    self.model = model;
    
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
