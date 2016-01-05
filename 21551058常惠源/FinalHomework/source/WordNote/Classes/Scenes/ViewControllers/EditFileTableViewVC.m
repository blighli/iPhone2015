//
//  EditFileTableViewVC.m
//  WordNote
//
//  Created by 常惠源 on 12/23/15.
//  Copyright © 2015 ZJU. All rights reserved.
//

#import "EditFileTableViewVC.h"

static NSString * titleKey = @"title";
static NSString * detailEssayValue = @"detailEssay";

@interface EditFileTableViewVC ()

// 标题
@property (strong, nonatomic) IBOutlet UITextField *editTitleTextField;

// 记事本具体内容
@property (strong, nonatomic)UITextView *editDetailTextField;


@property (nonatomic, assign)CGFloat height;

@property (nonatomic, assign)BOOL isTextViewFirstRespond;
@end

@implementation EditFileTableViewVC

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:NO];
    if ([self.itemsID length] > 0) {
        YTKKeyValueItem * items = [[DataBaseMananger shareManeger] getItemsByID:self.itemsID];
        self.editTitleTextField.text = items.itemObject[@"title"];
        self.editDetailTextField.text = items.itemObject[@"detailEssay"];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _isTextViewFirstRespond = YES;
    self.view.backgroundColor = [UIColor k_InterfaceColor];
    
    _editDetailTextField = [[UITextView alloc]initWithFrame:CGRectMake(10, _editTitleTextField.frame.size.height + _editTitleTextField.frame.origin.y + 10, [UIScreen mainScreen].bounds.size.width - 20, [UIScreen mainScreen].bounds.size.height - (_editTitleTextField.frame.size.height + _editTitleTextField.frame.origin.y + 10 + 10))];
    _editDetailTextField.backgroundColor = [UIColor colorWithRed:200 / 255.0 green:244 / 255.0 blue:211 / 255.0 alpha:1];
    _height = _editDetailTextField.frame.size.height;

    [self.view addSubview:_editDetailTextField];
    //注册通知,监听键盘弹出事件
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidShow:) name:UIKeyboardDidShowNotification object:nil];
    
    //注册通知,监听键盘消失事件
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidHidden) name:UIKeyboardDidHideNotification object:nil];
    
    [self addNavigationItems];
}
// 键盘弹出时
-(void)keyboardDidShow:(NSNotification *)notification{
    
    //获取键盘高度
    NSValue *keyboardObject = [[notification userInfo] objectForKey:UIKeyboardFrameEndUserInfoKey];
    
    CGRect keyboardRect;
    
    [keyboardObject getValue:&keyboardRect];
    if (_isTextViewFirstRespond == YES) {
        _isTextViewFirstRespond = NO;
        [_editDetailTextField setFrame:CGRectMake(_editDetailTextField.frame.origin.x,_editDetailTextField.frame.origin.y,_editDetailTextField.frame.size.width,_height - keyboardRect.size.height - 10)];
    }
    
    //设置动画
    [UIView beginAnimations:nil context:nil];
    
    //定义动画时间
    [UIView setAnimationDuration:0.2];
    
}
//键盘消失时
-(void)keyboardDidHidden{
    //调整放置有textView的view的位置
    _isTextViewFirstRespond = YES;
    //设置动画
    [UIView beginAnimations:nil context:nil];
    //定义动画时间
    [UIView setAnimationDuration:0.2];
    //设置view的frame，往下平移
    [_editDetailTextField setFrame:CGRectMake(_editDetailTextField.frame.origin.x,_editDetailTextField.frame.origin.y,_editDetailTextField.frame.size.width,_height)];
    [UIView commitAnimations];
}
#pragma mark - 添加导航条按钮
- (void)addNavigationItems
{
    // 添加右上角按钮
    UIBarButtonItem *collection = [[UIBarButtonItem alloc] initWithTitle:@"完成" style:UIBarButtonItemStylePlain target:self action:@selector(saveBtnAction:)];
    self.navigationItem.rightBarButtonItem = collection;
}


- (void)saveBtnAction:(UIButton *)sender {
    if ([self.editTitleTextField.text length] > 0) {
        self.titleStr = self.editTitleTextField.text;
        self.detailStr = self.editDetailTextField.text;
        NSDictionary * dic = [self putItemsIntoDicWithTitle:self.titleStr detailEssay:self.detailStr];
        [[DataBaseMananger shareManeger] saveDataWithKey:self.titleStr params:dic];
        [HUDHelper addHUDInView:self.view text:@"保存成功" hideAfterDelay:1.0];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self.navigationController popViewControllerAnimated:YES];
        });
    }else{
        [HUDHelper addHUDInView:self.view text:@"请输入标题" hideAfterDelay:1.0];
    }
}


#pragma mark - 将标题和 内容放在字典当中
-(NSDictionary *)putItemsIntoDicWithTitle:(NSString *)title detailEssay:(NSString *)detailEssay
{
    NSDictionary * dic = [NSDictionary dictionaryWithObjectsAndKeys:title,titleKey,detailEssay,detailEssayValue,nil];
    return dic;
}









@end
