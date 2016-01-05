//
//  popview.m
//  美团
//
//  Created by 陈受恩 on 15/12/9.
//  Copyright © 2015年 chenshouen. All rights reserved.
//

#import "popview.h"

@interface popview()<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *leftTV;
@property (weak, nonatomic) IBOutlet UITableView *rightTV;
@property (nonatomic,assign) NSInteger selectRow;
@end

@implementation popview
+(popview*)makePopView{
    return [[[NSBundle mainBundle]loadNibNamed:@"popview" owner:self options:nil]firstObject];
}

#pragma mark tableView Delegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView==_leftTV) {
        return [self.dataSource numberOfRowsInLeftTable:self];
        //return _categoryArr.count;
    } else {
        return [self.dataSource popview:self subDataForRow:_selectRow].count;
    }
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView==_leftTV) {
        static NSString *str=@"Mycell";
        UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:str];
        if(cell==nil){
            cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
        }
       // CategoryModel *md=[_categoryArr objectAtIndex:indexPath.row];
       
        cell.textLabel.text=[self.dataSource popview:self titleForRow:indexPath.row];
        if ([self.delegate respondsToSelector:@selector(popview:imageForRow:)]) {
             cell.imageView.image=[UIImage imageNamed:[self.dataSource popview:self imageForRow:indexPath.row]];
        }
        NSArray *subDataArray=[self.dataSource popview:self subDataForRow:indexPath.row];
        
        if (subDataArray.count) {
            cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
        }else{
            cell.accessoryType=UITableViewCellAccessoryNone;
        }
        
        return cell;
    }
    else {
        static NSString *str=@"Mycell";
        UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:str];
        if(cell==nil){
            cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
        }
        cell.textLabel.text=[self.dataSource popview:self subDataForRow:_selectRow][indexPath.row];
        return cell;
    }
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView==_leftTV) {
        self.selectRow=indexPath.row;
        [_rightTV reloadData];
        
        //判断代理是否实现了左侧方法
        if ([self.delegate respondsToSelector:@selector(popview:didSelectRowAtLeftTable:)]) {
            //进一步实现 左侧：无字数据＋有子数据
            [self.delegate popview:self didSelectRowAtLeftTable:indexPath.row];
        }
//        if ([self.delegate respondsToSelector:@selector(homeDropdown:didSelectedRowInMainTable:)]) {
//            [self.delegate homeDropdown:self didSelectedRowInMainTable:(int)indexPath.row];
//        }
        
    }else{
        if ([self.delegate respondsToSelector:@selector(popview:didSelectRowAtRightTable:)]) {
            //进一步实现
             [self.delegate popview:self didSelectRowAtRightTable:indexPath.row];
        }
        else if ([self.delegate respondsToSelector:@selector(popview:didSelectRowAtRightTable:mainRow:)]) {
            [self.delegate popview:self didSelectRowAtRightTable:indexPath.row mainRow:self.selectRow];
        }
        
    }
}
@end