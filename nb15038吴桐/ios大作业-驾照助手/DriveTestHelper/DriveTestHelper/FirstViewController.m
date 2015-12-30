#import "FirstViewController.h"
#import "FirstTableViewCell.h"
#import "TestChoiceViewController.h"
#import "DataManager.h"
#import "AnswerViewController.h"
#import "MainTestViewController.h"
#import "QuestionCollectionManager.h"

@interface FirstViewController () <UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_tableView;
    NSArray *_dataArr;
}

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title=_navTitle;
    UIBarButtonItem *item=[[UIBarButtonItem alloc]init];
    item.title=@"";
    self.navigationItem.backBarButtonItem=item;
    self.edgesForExtendedLayout=UIRectEdgeNone;
    self.view.backgroundColor=[UIColor whiteColor];
    _dataArr=@[@"章节练习",@"顺序练习",@"随机练习",@"专项练习",@"仿真模拟考试"];
    [self createTableView];
    [self createView];
    
}

-(void)createTableView{
    _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 250) style:UITableViewStylePlain];
    _tableView.dataSource=self;
    _tableView.delegate=self;
    [self.view addSubview:_tableView];
}

-(void)createView{
    UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(self.view.frame.size.width/2-150, self.view.frame.size.height-204, 300, 30)];
    label.textAlignment=NSTextAlignmentCenter;
    label.text=@"---------考试分析---------";
    [self.view addSubview:label];
    NSArray *btnLabelArr=@[@"我的错题",@"我的收藏",@"我的成绩",@"清除记录"];
    for (int i=0; i<4; i++) {
        UIButton *btn=[UIButton buttonWithType:UIButtonTypeSystem];
        btn.frame=CGRectMake(self.view.frame.size.width/4*i+self.view.frame.size.width/4/2-30, self.view.frame.size.height-164, 60, 60);
        [btn setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"%d.png",i+12]] forState:UIControlStateNormal];
        [btn setTag:201+i];
        [btn addTarget:self action:@selector(tapToolsBtn:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
        
        UILabel *btnLabel=[[UILabel alloc]initWithFrame:CGRectMake(self.view.frame.size.width/4*i+self.view.frame.size.width/4/2-30, self.view.frame.size.height-89, 60, 20)];
        btnLabel.textAlignment=NSTextAlignmentCenter;
        btnLabel.font=[UIFont boldSystemFontOfSize:13];
        btnLabel.text=btnLabelArr[i];
        [self.view addSubview:btnLabel];
    }
    
}
-(void)tapToolsBtn:(UIButton *)btn{
    switch (btn.tag) {
        case 201:
        {
            AnswerViewController *avc=[[AnswerViewController alloc]init];
            avc.type=6;
            avc.viewTitle=@"我的错题";
            [self.navigationController pushViewController:avc animated:YES];
        }
            break;
        case 202:
        {
            AnswerViewController *avc=[[AnswerViewController alloc]init];
            avc.type=7;
            avc.viewTitle=@"我的收藏";
            [self.navigationController pushViewController:avc animated:YES];
        }
            break;
        case 203:
        {
            int score=[QuestionCollectionManager getMyScore];
            NSString *msg=[NSString stringWithFormat:@"%d",score];
            NSLog(@"msg:%d",score);
            if (score==-1) {
                msg=@"没有记录";
            }
            UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"上一次考试的成绩"
                                                                           message:msg
                                                                    preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"关闭"
                                                                   style:UIAlertActionStyleCancel
                                                                 handler:nil];
            [alert addAction:cancelAction];
            [self presentViewController:alert animated:YES completion:nil];
        }
            break;
        case 204:
        {
            UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"清除记录"
                                                                           message:@"确认清除错题、收藏和成绩记录？"
                                                                    preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消"
                                                                   style:UIAlertActionStyleCancel
                                                                 handler:nil];
            UIAlertAction *confirmAction = [UIAlertAction actionWithTitle:@"确认删除"
                                                                    style:UIAlertActionStyleDefault
                                                                  handler:^(UIAlertAction *action){
                                                                      [QuestionCollectionManager clear];
                                                                  }];
            [alert addAction:cancelAction];
            [alert addAction:confirmAction];
            [self presentViewController:alert animated:YES completion:nil];
        }
            break;
        default:
            break;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - TableView delegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataArr.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellId=@"FirstTableViewCell";
    FirstTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell==nil) {
        cell=[[[NSBundle mainBundle]loadNibNamed:cellId owner:self options:nil]lastObject];
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
    }
    cell.itemIconView.image=[UIImage imageNamed:[NSString stringWithFormat:@"%ld.png",indexPath.row+7]];
    cell.itemLabel.text=_dataArr[indexPath.row];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //跳转
    switch (indexPath.row) {
        case 0:
        {
            //章节
            TestChoiceViewController *tc=[[TestChoiceViewController alloc]init];
            tc.viewTitle=_dataArr[0];
            tc.type=1;
            tc.dataArr=[DataManager getData:chapter];
            [self.navigationController pushViewController:tc animated:YES];
        }
            break;
        case 1:
        {
            //顺序
            AnswerViewController *avc=[[AnswerViewController alloc]init];
            avc.type=2;
            avc.viewTitle=_dataArr[1];
            [self.navigationController pushViewController:avc animated:YES];
        }
            break;
        case 2:
        {
            //随机
            AnswerViewController *avc=[[AnswerViewController alloc]init];
            avc.type=3;
            avc.viewTitle=_dataArr[2];
            [self.navigationController pushViewController:avc animated:YES];
        }
            break;
        case 3:
        {
            //专项
            TestChoiceViewController *tc=[[TestChoiceViewController alloc]init];
            tc.viewTitle=_dataArr[3];
            tc.type=2;
            tc.dataArr=[DataManager getData:speciality];
            UIBarButtonItem *item=[[UIBarButtonItem alloc]init];
            item.title=@"";
            self.navigationItem.backBarButtonItem=item;
            [self.navigationController pushViewController:tc animated:YES];
            
        }
            break;
        case 4:
        {
            //模拟考试
            MainTestViewController *mtvc=[[MainTestViewController alloc]init];
            UIBarButtonItem *item=[[UIBarButtonItem alloc]init];
            item.title=@"";
            self.navigationItem.backBarButtonItem=item;
            [self.navigationController pushViewController:mtvc animated:YES];
        }
            break;
        default:
            break;
    }
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
