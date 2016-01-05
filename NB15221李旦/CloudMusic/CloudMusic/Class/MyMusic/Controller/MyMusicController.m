//
//  MyMusicController.m
//  CloudMusic
//
//  Created by LiDan on 15/12/6.
//  Copyright © 2015年 com.lidan. All rights reserved.
//

#import "MyMusicController.h"
#import "PlayViewController.h"
#import "CloudMusic.pch"
#import "MusicModel.h"
#import "MusicCell.h"


@interface MyMusicController()

@property (nonatomic,strong) CADisplayLink *link;
@property (nonatomic,assign) NSInteger count;

@end

@implementation MyMusicController

-(CADisplayLink *)link
{
    if (!_link)
    {
        _link = [CADisplayLink displayLinkWithTarget:self selector:@selector(updateImage)];
    }
    return _link;
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    [self.view setBackgroundColor:RGBColor(251, 252, 253)];
    
    self.link.frameInterval = 5;
    [self.link addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
    
    UIBarButtonItem *rightBarBtn = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"cm2_topbar_icn_playing0"] style:UIBarButtonItemStylePlain target:self action:@selector(rightBtnClick)];
    self.count = 0;
    self.navigationItem.rightBarButtonItem = rightBarBtn;
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [MusicTool sharedMusicTool].musicList.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MusicCell * cell = [MusicCell musicCellWithTableView:tableView];
    cell.music = [MusicTool sharedMusicTool].musicList[indexPath.row];
    cell.num = [NSString stringWithFormat:@"%ld",indexPath.row + 1];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    MusicModel *music = [MusicTool sharedMusicTool].musicList[indexPath.row];
    PlayViewController *playerVc = [[PlayViewController alloc]init];
    playerVc.music = music;
    [self.navigationController pushViewController:playerVc animated:YES];
    if ([MusicTool sharedMusicTool].playingIndex != indexPath.row)
    {
        [[MusicTool sharedMusicTool] prepareToPlayWithMusic:music];
        [[MusicTool sharedMusicTool] playMusic];
    }
    [MusicTool sharedMusicTool].playingIndex = indexPath.row;
    
}

-(void)rightBtnClick
{
    if ([MusicTool sharedMusicTool].playingIndex != -1)
    {
        MusicModel *music = [MusicTool sharedMusicTool].musicList[[MusicTool sharedMusicTool].playingIndex];
        PlayViewController *playerVc = [[PlayViewController alloc]init];
        playerVc.music = music;
        [self.navigationController pushViewController:playerVc animated:YES];
    }
    else
    {
        MusicModel *music = [MusicTool sharedMusicTool].musicList[0];
        PlayViewController *playerVc = [[PlayViewController alloc]init];
        playerVc.music = music;
        [[MusicTool sharedMusicTool] prepareToPlayWithMusic:music];
        [[MusicTool sharedMusicTool] playMusic];
        [MusicTool sharedMusicTool].playingIndex = 0;
        [self.navigationController pushViewController:playerVc animated:YES];
    }
}

-(void)updateImage
{
    if([MusicTool sharedMusicTool].isPlaying)
    {
        self.count = (self.count + 1);
        NSInteger count = self.count;
        if (count == 6)
        {
            count = 4;
        }
        else if (count == 7)
        {
            count = 3;
        }
        else if (count == 8)
        {
            count = 2;
        }
        
        else if (count == 9)
        {
            count = 1;
        }
        else if (count == 10)
        {
            count = 0;
        }
        
        if (self.count == 10)
        {
            self.count = 0;
        }
        NSString *imageName = [NSString stringWithFormat:@"cm2_topbar_icn_playing%zd",count];
        [self.navigationItem.rightBarButtonItem setImage:[UIImage imageNamed:imageName]];
    }
}

@end
