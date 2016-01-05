//
//  STAwardCell.h
//  ItcastLottery01
//
//  Created by 123 on 15/12/24.
//  Copyright © 2015年 HST. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface STAwardCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *desc;
@property (weak, nonatomic) IBOutlet UIImageView *ballView;
+(instancetype)initWithAwardCell;
@end
