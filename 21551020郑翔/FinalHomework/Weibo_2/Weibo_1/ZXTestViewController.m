//
//  ZXTestViewController.m
//  Weibo_1
//
//  Created by zhengxiang on 15/12/16.
//  Copyright © 2015年 Zheng Xiang. All rights reserved.
//

#import "ZXTestViewController.h"

@interface ZXTestViewController () 

@end

@implementation ZXTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"TEST";
    
    //
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]
                                               initWithTitle: @"发送"
                                               style: UIBarButtonItemStyleDone
                                               target: self
                                               action: @selector(sendInfo)];
    //输入框显示区域
    _textEditor = [[UITextView alloc] initWithFrame:CGRectMake(0, 0, 375, 200)];
    
    //设置它的代理
    _textEditor.delegate = self;
    _textEditor.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    _textEditor.keyboardType = UIKeyboardTypeDefault;
    _textEditor.font = [UIFont systemFontOfSize:20];
    
    //默认软键盘是在触摸区域后才会打开
    //这里表示进入当前ViewController直接打开软键盘
    [_textEditor becomeFirstResponder];
    
    //把输入框加在视图中
    [self.view addSubview:_textEditor];
    
    //下方的图片按钮 点击后呼出菜单 打开摄像机 查找本地相册
    UIImage *image = [UIImage imageNamed:@"camera"];
    
    NSLog(@"image: %@", image);
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    
    button.frame = CGRectMake(0, 300, image.size.width, image.size.height);
    
    [button setImage:image forState:UIControlStateNormal];
    
    [button addTarget:self action:@selector(openMenu) forControlEvents:UIControlEventTouchUpInside];
    
    //把它也加在视图当中
    [self.view addSubview:button];
}

-(void)openMenu
{
    //在这里呼出下方菜单按钮项
    alertController = [UIAlertController alertControllerWithTitle:@"TEST" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
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
    
//    alertController = [[UIActionSheet alloc]
//                     initWithTitle:nil
//                     delegate:self
//                     cancelButtonTitle:@"取消"
//                     destructiveButtonTitle:nil
//                     otherButtonTitles: @"打开照相机", @"从手机相册获取",nil];
//    
//    [myActionSheet showInView:self.view];
    
}

//- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
//{
//    
//    //呼出的菜单按钮点击后的响应
//    if (buttonIndex == myActionSheet.cancelButtonIndex)
//    {
//        NSLog(@"取消");
//    }
//    
//    switch (buttonIndex)
//    {
//        case 0:  //打开照相机拍照
//            [self takePhoto];
//            break;
//            
//        case 1:  //打开本地相册
//            [self LocalPhoto];
//            break;
//    }
//}

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
        NSLog(@"Image---------> %@", image);
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
        NSString * DocumentsPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
        
        //文件管理器
        NSFileManager *fileManager = [NSFileManager defaultManager];
        
        //把刚刚图片转换的data对象拷贝至沙盒中 并保存为image.png
        [fileManager createDirectoryAtPath:DocumentsPath withIntermediateDirectories:YES attributes:nil error:nil];
        
        [fileManager createFileAtPath:[DocumentsPath stringByAppendingString:@"/image.png"] contents:data attributes:nil];
        
        //得到选择后沙盒中图片的完整路径
        filePath = [[NSString alloc]initWithFormat:@"%@%@",DocumentsPath,  @"/image.png"];
        
        NSLog(@"filePath: %@", filePath);
        
        //关闭相册界面
        [picker dismissViewControllerAnimated:YES completion:nil];
        
        //创建一个选择后图片的小图标放在下方
        //类似微薄选择图后的效果
        
        UIImageView *smallimage = [[UIImageView alloc] initWithFrame:
                                    CGRectMake(40, 300, 50, 50)];
        
        smallimage.image = image;
        //加在视图中
        [self.view addSubview:smallimage];
        
    }
    
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    NSLog(@"您取消了选择图片");
    [picker dismissViewControllerAnimated:YES completion:nil];
}

-(void)sendInfo
{
    NSLog(@"图片的路径是：%@", filePath);
    
    NSLog(@"您输入框中的内容是：%@", _textEditor.text);
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
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
