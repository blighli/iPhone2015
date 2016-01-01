//
//  LMMusicCell.m
//  音乐播放器
//
//  Created by 张焕 on 12/31/15.
//  Copyright © 2015 张焕. All rights reserved.
//

#import "LMMusicCell.h"
#import "LMMusic.h"
@implementation LMMusicCell

+(instancetype)musicCellWithTableView:(UITableView *)tableView{
    static NSString* ID = @"MusicCell";
    return [tableView dequeueReusableCellWithIdentifier:ID];

}
-(void)setMusic:(LMMusic *)music{
    _music = music;
    self.textLabel.text = music.name;
    self.detailTextLabel.text = music.singer;
}

@end
