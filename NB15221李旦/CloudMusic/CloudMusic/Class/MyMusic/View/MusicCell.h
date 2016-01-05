//
//  MusicCell.h
//  CloudMusic
//
//  Created by LiDan on 15/12/13.
//  Copyright © 2015年 com.lidan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MusicModel.h"

@interface MusicCell : UITableViewCell

@property (nonatomic,strong) MusicModel* music;
@property (nonatomic,copy) NSString *num;

+(instancetype)musicCellWithTableView:(UITableView *)tableView;

@end
