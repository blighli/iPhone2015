//
//  ZXMyInfoViewController.m
//  Weibo_1
//
//  Created by zhengxiang on 15/12/16.
//  Copyright © 2015年 Zheng Xiang. All rights reserved.
//

#import "ZXMyInfoViewController.h"
#import "AFNetworking.h"
#import "AppDelegate.h"
#import "ZXUploadImgNavigationViewController.h"

@interface ZXMyInfoViewController ()
@property (weak, nonatomic) IBOutlet UIButton *headImgBtm;

@property (weak, nonatomic) IBOutlet UILabel *nicknameLabel;
@property (nonatomic, strong) NSDictionary *userInfo;
@property (nonatomic, copy) NSString *filePath;

@end

@implementation ZXMyInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"基本信息";
    //上传信息按钮
    UIBarButtonItem *barBtn = [[UIBarButtonItem alloc] initWithTitle:@"保存" style:UIBarButtonItemStylePlain target:self action:@selector(upload)];
    self.navigationItem.rightBarButtonItem = barBtn;
    [self loadUser];
    //图片保存的路径
    
    NSString * DocumentsPath = [NSHomeDirectory() stringByAppendingFormat:@"/Documents/headImg%@", [AppDelegate APP].user.userID];
    
    //得到选择后沙盒中图片的完整路径
    _filePath = [[NSString alloc] initWithFormat:@"%@%@",DocumentsPath,  @"/image.png"];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    [btn setTitle:@"我发的微博" forState:UIControlStateNormal];
//    [btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];

    CGFloat margin = 10;
    CGFloat btnW = self.view.frame.size.width - 20;
    CGFloat btnH = 50;
    CGFloat btnX = margin;
    CGFloat btnY = CGRectGetMaxY(_nicknameLabel.frame) + margin;
    CGRect btnFrame = CGRectMake(btnX, btnY, btnW, btnH);
    btn.frame = btnFrame;
    [btn addTarget:self action:@selector(myWeibo) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)myWeibo
{
    
}

- (void)upload
{
    NSLog(@"上传");
    if (_filePath == nil) {
        NSLog(@"No Selected Image");
        return ;
    }
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSLog(@"%@", _userInfo);
    NSDictionary *parameters = @{@"user_id": [AppDelegate APP].user.userID};
    NSURL *filePath = [NSURL fileURLWithPath:_filePath];
    
    [manager POST:@"http://127.0.0.1:8000/report/upload/" parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        
        [formData appendPartWithFileURL:filePath name:@"image" error:nil];
        
    } success:^(AFHTTPRequestOperation *operation, id responseObject) {
            NSLog(@"Success: %@", responseObject);
        
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            NSLog(@"Error: %@", error);
        }];
}

- (IBAction)editHeader:(id)sender {
//    ZXUploadImgNavigationViewController *vc = [[ZXUploadImgNavigationViewController alloc] init];
//    [self presentViewController:vc animated:YES completion:nil];
    [self openMenu];
}

-(void)openMenu
{
    //在这里呼出下方菜单按钮项
    
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *alertAction1 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        NSLog(@"取消");
    }];
    UIAlertAction *alertAction2 = [UIAlertAction actionWithTitle:@"打开照相机" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        [self takePhoto];
    }];
    UIAlertAction *alertAction3 = [UIAlertAction actionWithTitle:@"从手机相册获取" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        [self LocalPhoto];
    }];
    [alertController addAction:alertAction3];
    [alertController addAction:alertAction2];
    [alertController addAction:alertAction1];
    [self presentViewController:alertController animated:YES completion:nil];
    
    
}


//开始拍照
-(void)takePhoto
{
    UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeCamera;
    if ([UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypeCamera])
    {
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.delegate = self;
        //设置拍照后的图片可被编辑
        picker.allowsEditing = YES;
        picker.sourceType = sourceType;
        [self presentViewController:picker animated:YES completion:nil];
    }else
    {
        NSLog(@"模拟其中无法打开照相机,请在真机中使用");
    }
}

//打开本地相册
-(void)LocalPhoto
{
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    picker.delegate = self;
    //设置选择后的图片可被编辑
    picker.allowsEditing = YES;
    [self presentViewController:picker animated:YES completion:nil];
}

//当选择一张图片后进入这里
-(void)imagePickerController:(UIImagePickerController*)picker didFinishPickingMediaWithInfo:(NSDictionary *)info

{
    
    NSString *type = [info objectForKey:UIImagePickerControllerMediaType];
    
    //当选择的类型是图片
    if ([type isEqualToString:@"public.image"])
    {
        //先把图片转成NSData
        UIImage* image = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
        
        CGSize imagesize = image.size;
        imagesize.height = 128;
        imagesize.width = 128;
        
        CGSize headImgSize = image.size;
        //对图片大小进行压缩--
        image = [self imageWithImage:image scaledToSize:imagesize];
        
//        NSData *imageData = UIImageJPEGRepresentation(image,0.00001);
        
        NSData *data;
        if (UIImagePNGRepresentation(image) == nil)
        {
            data = UIImageJPEGRepresentation(image, 1.0);
        }
        else
        {
            data = UIImagePNGRepresentation(image);
        }
        
        //图片保存的路径
        //这里将图片放在沙盒的documents文件夹中
        NSString * DocumentsPath = [NSHomeDirectory() stringByAppendingFormat:@"/Documents/headImg%@", [AppDelegate APP].user.userID];
        
        //文件管理器
        NSFileManager *fileManager = [NSFileManager defaultManager];
        
        //把刚刚图片转换的data对象拷贝至沙盒中 并保存为image.png
        [fileManager createDirectoryAtPath:DocumentsPath withIntermediateDirectories:YES attributes:nil error:nil];
        
        
        [fileManager createFileAtPath:[DocumentsPath stringByAppendingFormat: @"/image.png" ] contents:data attributes:nil];
        
        //得到选择后沙盒中图片的完整路径
        _filePath = [[NSString alloc]initWithFormat:@"%@%@",DocumentsPath,  @"/image.png"];
        
        NSLog(@"filePath: %@", _filePath);
        //关闭相册界面
        [picker dismissViewControllerAnimated:YES completion:nil];
        
        //创建一个选择后图片的小图标放在下方
        //类似微薄选择图后的效果
        
        NSLog(@"data:%@", data);
        
//        UIImage *img = [UIImage imageWithData:data];
//        
//        NSLog(@"img:%@", img);
        [_headImgBtm setTitle:@"" forState:UIControlStateNormal];
        [_headImgBtm setBackgroundImage:image forState:UIControlStateNormal];
        
    }
    
}

//对图片尺寸进行压缩--
-(UIImage*)imageWithImage:(UIImage*)image scaledToSize:(CGSize)newSize
{
    // Create a graphics image context
    UIGraphicsBeginImageContext(newSize);
    
    // Tell the old image to draw in this new context, with the desired
    // new size
    [image drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
    
    // Get the new image from the context
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // End the context
    UIGraphicsEndImageContext();
    
    // Return the new image.
    return newImage;
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    NSLog(@"您取消了选择图片");
    [picker dismissViewControllerAnimated:YES completion:nil];
}

-(void)sendInfo
{
    NSLog(@"图片的路径是：%@", _filePath);
    
}

//- (void)initInfo {
//    ZXUser *u = [AppDelegate APP].user;
//    if (u != nil) {
//        _nicknameLabel = u.
//    }
//}

- (void)loadUser
{
    //    NSString *listPath = [[NSBundle mainBundle] pathForResource:@"weibos.plist" ofType:nil];
    //    NSString *listPath = @"weibos_test.plist";
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSDictionary *parameters = @{@"user_id": [AppDelegate APP].user.userID};
    
    [manager POST:@"http://127.0.0.1:8000/report/" parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSLog(@"JSON: %@", responseObject);
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            NSLog(@"NSDictionary!");
            NSDictionary *dict = [[NSDictionary alloc] initWithDictionary:responseObject];
            NSLog(@"loadUser dict: %@", dict);
            _userInfo = [dict mutableCopy];
            _nicknameLabel.text = _userInfo[@"nickname"];
            
            NSString * DocumentsPath = [NSHomeDirectory() stringByAppendingFormat:@"/Documents/headImg%@/image.png", [AppDelegate APP].user.userID];
            UIImage *img = [UIImage imageWithContentsOfFile:DocumentsPath];
            if (img != nil) {
                [_headImgBtm setTitle:@"" forState:UIControlStateNormal];
            
            [_headImgBtm setBackgroundImage:img forState:UIControlStateNormal];
            }
            
        } else if ([responseObject isKindOfClass:[NSArray class]]) {
            
            NSLog(@"NSArray");
            NSArray *array = [[NSArray alloc] initWithArray:responseObject];
            
            //            _isChange = YES;
            
            NSLog(@"reload ok!");
            
        } else {
            NSLog(@"unknown class of jsonObject");
        }
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }
     ];
    //    sleep(1);
    //    NSLog(@"resArray: %@", _resArray);
    //    return [resArray mutableCopy];
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
