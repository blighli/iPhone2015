//
//  AnswerScrollView.m
//  DriveTestHelper
//
//  Created by wp on 15/12/17.
//  Copyright © 2015年 wt. All rights reserved.
//

#import "AnswerScrollView.h"
#import "AnswerTableViewCell.h"
#import "AnswerModel.h"
#import "Tools.h"
#import "AnswerViewController.h"
#import "QuestionCollectionManager.h"
#import "QuestionSheetsView.h"

#define SIZE self.frame.size
@interface AnswerScrollView()<UIScrollViewDelegate,UITableViewDataSource,UITableViewDelegate>

@end
@implementation AnswerScrollView
{
    UITableView *_leftAnswerTableView;
    UITableView *_mainAnswerTableView;
    UITableView *_rightAnswerTableView;
    NSArray *_tfarr;
    int _quesType;
}

-(instancetype)initWithFrame:(CGRect)frame withDataArray:(NSArray *)arr{
    self = [super initWithFrame:frame];
    if (self) {
        _currentPage=0;
        _dataArr=[[NSArray alloc]initWithArray:arr];
        _answeredArr=[[NSMutableArray alloc]init];
        for (int i=0; i<[arr count]; i++) {
            [_answeredArr addObject:@"0"];
        }
        _tfarr=@[@"对",@"错"];
        _scrollView=[[UIScrollView alloc]initWithFrame:frame];
        _scrollView.delegate=self;
        if ([arr count]>1) {
            _leftAnswerTableView=[[UITableView alloc]initWithFrame:frame style:UITableViewStyleGrouped];
            _mainAnswerTableView=[[UITableView alloc]initWithFrame:frame style:UITableViewStyleGrouped];
            _rightAnswerTableView=[[UITableView alloc]initWithFrame:frame style:UITableViewStyleGrouped];
            _leftAnswerTableView.delegate=self;
            _mainAnswerTableView.delegate=self;
            _rightAnswerTableView.delegate=self;
            _leftAnswerTableView.dataSource=self;
            _mainAnswerTableView.dataSource=self;
            _rightAnswerTableView.dataSource=self;
        } else {
            _leftAnswerTableView=[[UITableView alloc]initWithFrame:frame style:UITableViewStyleGrouped];
            _leftAnswerTableView.delegate=self;
            _leftAnswerTableView.dataSource=self;
        }
        
        [self createView];
        
    }
    return self;
}
-(void)createView{
    _leftAnswerTableView.frame=CGRectMake(0, 0, SIZE.width, SIZE.height);
    _mainAnswerTableView.frame=CGRectMake(SIZE.width, 0, SIZE.width, SIZE.height);
    _rightAnswerTableView.frame=CGRectMake(SIZE.width*2, 0, SIZE.width, SIZE.height);
    [_scrollView addSubview:_leftAnswerTableView];
    [_scrollView addSubview:_mainAnswerTableView];
    [_scrollView addSubview:_rightAnswerTableView];
    [_scrollView setPagingEnabled:YES];//翻页
    [_scrollView setBounces:NO];
    [_scrollView setShowsHorizontalScrollIndicator:NO];
    [_scrollView setShowsVerticalScrollIndicator:NO];
    if ([_dataArr count] > 1) {
        [_scrollView setContentSize:CGSizeMake(SIZE.width*2, 0)];
    }
    [self addSubview:_scrollView];
}

#pragma mark - TableView Delegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    //选项数
    AnswerModel *model=[self getTheFitModel:tableView];
    if ([model.mtype intValue]==2) {
        _quesType=2;
        return 2;
    }
    _quesType=1;
    return 4;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    AnswerModel *model=[self getTheFitModel:tableView];
    NSString *str=[NSString stringWithFormat:@"答案解析：%@",model.mDesc];
    
    UIFont *font=[UIFont systemFontOfSize:16];
    return [Tools getSizeWithString:str with:font withSize:CGSizeMake(tableView.frame.size.width-20, 400)].height+20;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    //table的头部高度
    CGFloat height;
    AnswerModel *model=[self getTheFitModel:tableView];
    if ([model.mtype intValue]==1) {
        NSString *str=[[Tools getAnswerWithString:model.mQuestion] objectAtIndex:0];
        UIFont *font=[UIFont systemFontOfSize:16];
        height=[Tools getSizeWithString:str with:font withSize:CGSizeMake(tableView.frame.size.width-20, 400)].height+20;
        
    } else {
        NSString *str=model.mQuestion;
        UIFont *font=[UIFont systemFontOfSize:16];
        height=[Tools getSizeWithString:str with:font withSize:CGSizeMake(tableView.frame.size.width-20, 400)].height+20;
    }
    if (height<=130) {
        return 130;
    } else {
        return height;
    }
    
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    //答案解析
    CGFloat height;
    NSString *str=@"";
    AnswerModel *model=[self getTheFitModel:tableView];
    str=[NSString stringWithFormat:@"答案解析：%@",model.mDesc];
    UIFont *font=[UIFont systemFontOfSize:16];
    height=[Tools getSizeWithString:str with:font withSize:CGSizeMake(tableView.frame.size.width-20, 400)].height+20;
    

    UIView *view=[[UIView alloc]initWithFrame:CGRectMake(0,0, SIZE.width,height)];
    UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(10, 10, tableView.frame.size.width-20,height-20)];
    label.text=str;
    label.font=[UIFont systemFontOfSize:16];
    [label setNumberOfLines:0];
    [label setTextColor:[UIColor greenColor]];
    [view addSubview:label];
    int page=[self getQuestionNumber:tableView andCurrentPage:_currentPage];
    if (![_answeredArr[page-1] isEqualToString:@"0"]) {
        return view;//已答题显示答案解析
    }
    return nil;//未答题不显示
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    int page=[self getQuestionNumber:tableView andCurrentPage:_currentPage];
    if ([_answeredArr[page-1] integerValue]!=0) {
        return;//已答
    } else {
        if (_quesType==1) {
            [_answeredArr replaceObjectAtIndex:page-1 withObject:[NSString stringWithFormat:@"%d",(int)indexPath.row+1]];
        } else if (_quesType==2) {
            [_answeredArr replaceObjectAtIndex:page-1 withObject:_tfarr[indexPath.row]];
        }
        
    }
    //添加错题记录
    AnswerModel *model=[self getTheFitModel:tableView];
    if ([model.mtype intValue]==2) {
        if (![model.mAnswer isEqualToString:_tfarr[indexPath.row]]) {//错题
            [QuestionCollectionManager addWrongQuestionId:model.mid];
        }
    } else if ([model.mtype intValue]==1) {
        if (![model.mAnswer isEqualToString:[NSString stringWithFormat:@"%c",'A'+(int)indexPath.row]]) {//错题
            [QuestionCollectionManager addWrongQuestionId:model.mid];
        }
    }

    [self reloadData];
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    //table的头部视图,题干
    CGFloat height;
    NSString *str=@"";
    AnswerModel *model=[self getTheFitModel:tableView];
    if ([model.mtype intValue]==1) {
        str=[[Tools getAnswerWithString:model.mQuestion] objectAtIndex:0];
        UIFont *font=[UIFont systemFontOfSize:16];
        height=[Tools getSizeWithString:str with:font withSize:CGSizeMake(tableView.frame.size.width-20, 400)].height+20;
        
    } else {
        str=model.mQuestion;
        UIFont *font=[UIFont systemFontOfSize:16];
        height=[Tools getSizeWithString:str with:font withSize:CGSizeMake(tableView.frame.size.width-20, 400)].height+20;
    }
    UIView *view=[[UIView alloc]initWithFrame:CGRectMake(0,0, SIZE.width,height)];
    UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(10, 10, tableView.frame.size.width-20,height-20)];
    label.text=[NSString stringWithFormat:@"%d.%@",[self getQuestionNumber:tableView andCurrentPage:_currentPage],str];
    label.font=[UIFont systemFontOfSize:16];
    [label setNumberOfLines:0];
    [view addSubview:label];
    if (![model.mImage isEqualToString:@""]) {
        UIImage *queImg=[UIImage imageNamed:[NSString stringWithFormat:@"%@.png",[model.mImage substringToIndex:3]]];
        UIImageView *queImgView=[[UIImageView alloc]initWithFrame:CGRectMake(10, label.frame.size.height+10, 100, 100)];
        queImgView.image=queImg;
        [view addSubview:queImgView];
    }
    return view;
}
-(int)getQuestionNumber:(UITableView *)tableView andCurrentPage:(int)page{
    if (tableView==_leftAnswerTableView && page==0) {
        return 1;//第一题
    } else if (tableView==_leftAnswerTableView && page>0) {
        return page;//上一题
    } else if (tableView==_mainAnswerTableView && page>0 && page<[_dataArr count]-1){
        return page+1;//当前题
    } else if (tableView==_mainAnswerTableView && page==0){
        return 2;//第2题
    } else if (tableView==_mainAnswerTableView && page==[_dataArr count]-1){
        return page;//当前题为最后一题
    } else if (tableView==_rightAnswerTableView && page<[_dataArr count]-1){
        return page+2;//下一题
    } else if (tableView==_rightAnswerTableView && page==[_dataArr count]-1){
        return page+1;//下一题为最后一题
    }
    return 0;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellId=@"AnswerTableViewCell";
    AnswerTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell==nil) {
        cell=[[[NSBundle mainBundle]loadNibNamed:@"AnswerTableViewCell" owner:self options:nil]lastObject];
        cell.numberLabel.layer.masksToBounds=YES;
        cell.numberLabel.layer.cornerRadius=10;
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
    }
    cell.numberLabel.text=[NSString stringWithFormat:@"%c",(char)('A'+indexPath.row)];
    //取模型
    AnswerModel *model=[self getTheFitModel:tableView];
    //填充数据
    if ([model.mtype intValue]==1) {
        //选择题
        cell.answerLabel.text=[[Tools getAnswerWithString:model.mQuestion] objectAtIndex:indexPath.row+1];
    } else if ([model.mtype intValue]==2) {//判断题
        cell.answerLabel.text=_tfarr[indexPath.row];
    }
    
    int page=[self getQuestionNumber:tableView andCurrentPage:_currentPage];
    if ([model.mtype intValue]==2) {
        if (![_answeredArr[page-1] isEqualToString:@"0"]) {
            if ([model.mAnswer isEqualToString:_tfarr[indexPath.row]]) {//已选正确
                cell.resultImage.image=nil;
                cell.resultImage.hidden=NO;
                cell.resultImage.image=[UIImage imageNamed:@"19.png"];
            } else if (![model.mAnswer isEqualToString:_answeredArr[page-1]] && indexPath.row==[_tfarr indexOfObject:_answeredArr[page-1]]) {
                NSLog(@"index:%d",[_tfarr indexOfObject:_answeredArr[page-1]]);
                cell.resultImage.image=nil;
                cell.resultImage.hidden=NO;
                cell.resultImage.image=[UIImage imageNamed:@"20.png"];
            }
        } else {
            cell.resultImage.hidden=YES;
        }
    } else if ([model.mtype intValue]==1) {
        if ([_answeredArr[page-1] intValue]!=0) {
            if ([model.mAnswer isEqualToString:[NSString stringWithFormat:@"%c",'A'+(int)indexPath.row]]) {//已选正确
                cell.resultImage.image=nil;
                cell.resultImage.hidden=NO;
                cell.resultImage.image=[UIImage imageNamed:@"19.png"];
            } else if (![model.mAnswer isEqualToString:[NSString stringWithFormat:@"%c",'A'+[_answeredArr[page-1] intValue]-1]] && indexPath.row==[_answeredArr[page-1] intValue]-1) {
                //已选选择错误
                cell.resultImage.image=nil;
                cell.resultImage.hidden=NO;
                cell.resultImage.image=[UIImage imageNamed:@"20.png"];
            }
        } else {//未选择
            cell.resultImage.hidden=YES;
        }
    }
    return cell;
}
-(AnswerModel *)getTheFitModel:(UITableView *)tableView{
    AnswerModel *model;
    if (tableView==_leftAnswerTableView && _currentPage==0) {
        model=_dataArr[_currentPage];//第一页对应第一题
    } else if (tableView==_leftAnswerTableView && _currentPage>0) {
        model=_dataArr[_currentPage-1];//第二页以后，左边是前一题
    } else if (tableView==_mainAnswerTableView && _currentPage==0) {
        model=_dataArr[_currentPage+1];//第一页的右边
    } else if (tableView==_mainAnswerTableView && _currentPage>0 && _currentPage<[_dataArr count]-1) {
        model=_dataArr[_currentPage];//当前页
    } else if (tableView==_mainAnswerTableView && _currentPage==[_dataArr count]-1) {
        model=_dataArr[_currentPage-1];//最后一页:main在左边
    } else if (tableView==_rightAnswerTableView && _currentPage==[_dataArr count]-1) {
        model=_dataArr[_currentPage];//最后一页:right在屏幕上
    } else if (tableView==_rightAnswerTableView && _currentPage<[_dataArr count]-1) {
        model=_dataArr[_currentPage+1];//右边页面是下一题
    }
    return model;
}
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    CGPoint currentOffset=scrollView.contentOffset;//根据偏移量判断位置
    int page = currentOffset.x/SIZE.width;
    if (page<[_dataArr count]-1 && page>0) {
        //后面还有题
        _scrollView.contentSize=CGSizeMake(currentOffset.x+SIZE.width*2, 0);
        _mainAnswerTableView.frame=CGRectMake(currentOffset.x, 0, SIZE.width, SIZE.height);
        _leftAnswerTableView.frame=CGRectMake(currentOffset.x-SIZE.width, 0, SIZE.width, SIZE.height);
        _rightAnswerTableView.frame=CGRectMake(currentOffset.x+SIZE.width, 0, SIZE.width, SIZE.height);
    }
    _currentPage=page;
    [self reloadData];
    [[NSNotificationCenter defaultCenter]postNotification:[NSNotification notificationWithName:@"NewQuesNum" object:[NSString stringWithFormat:@"%d",_currentPage]]];
    
}
-(void)reloadData{
    NSLog(@"reloadData");
    [_leftAnswerTableView reloadData];
    [_mainAnswerTableView reloadData];
    [_rightAnswerTableView reloadData];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
