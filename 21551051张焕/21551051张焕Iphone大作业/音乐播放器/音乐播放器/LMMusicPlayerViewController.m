//
//  LMMusicPlayerViewController.m
//  音乐播放器
//
//  Created by 张焕 on 12/31/15.
//  Copyright © 2015 张焕. All rights reserved.
//

#import "LMMusicPlayerViewController.h"
#import "LMPlayerToolBar.h"
#import "MJExtension.h"
#import "LMMusic.h"
#import "LMMusicCell.h"
#import "LMMusicTool.h"
#import "AppDelegate.h"

@interface LMMusicPlayerViewController ()<UITableViewDataSource, UITableViewDelegate, LMPlayerToolBarDelegate, AVAudioPlayerDelegate>
@property (weak, nonatomic) IBOutlet UIView *bottomView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (assign, nonatomic) NSInteger musicIndex;

@property (strong, nonatomic) NSArray *musics;
@property (weak, nonatomic) LMPlayerToolBar *toolBar;
@end

@implementation LMMusicPlayerViewController

#pragma mark 懒加载音乐数据
-(NSArray *) musics{
    if(!_musics){
        _musics = [LMMusic objectArrayWithFilename:@"songs.plist"];
    }
    return _musics;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //添加播放工具条，底部
    self.toolBar = [LMPlayerToolBar playerToolBar];
    self.toolBar.bounds = self.bottomView.bounds;
    [self.bottomView addSubview:self.toolBar];
    //设置代理
    self.toolBar.delegate = self;
    //设置表格的透明度
    self.tableView.backgroundColor = [UIColor clearColor];
    
    [self playMusic];
    
    //设置appdelegate的block
    AppDelegate* appDelegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
    appDelegate.remoteEventBlock = ^(UIEvent *event){
        switch (event.subtype) {
            case UIEventSubtypeRemoteControlPlay:
                [[LMMusicTool sharedLMMusicTool] play];
                break;
            case UIEventSubtypeRemoteControlPause:
                [[LMMusicTool sharedLMMusicTool] pause];
                break;
            case UIEventSubtypeRemoteControlNextTrack:
                [self next];
                break;
            case UIEventSubtypeRemoteControlPreviousTrack:
                [self previous];
                break;
            default:
                break;
        }
    };
    
}

- (void) deSelectCell:(id) sender{
    [self.tableView deselectRowAtIndexPath:[self.tableView indexPathForSelectedRow]  animated:YES];
}

#pragma mark 表格数据源
-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.musics.count;
}

-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    LMMusicCell* cell = [LMMusicCell musicCellWithTableView:tableView];
    //设置数据
    LMMusic *music = self.musics[indexPath.row];
    cell.music = music;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self performSelector:@selector(deSelectCell:) withObject:nil afterDelay:0.1];
    self.musicIndex = indexPath.row;
    [self playMusic];
    
}

#pragma mark 设置点击代理
- (void)playerToolBar:(LMPlayerToolBar *)toolbar btnClickWithType:(BtnType)btnType{
    switch (btnType) {
        case BtnTypePlay:
            NSLog(@"BtnTypePlay");
            [[LMMusicTool sharedLMMusicTool] play];
            break;
        case BtnTypePause:
            NSLog(@"BtnTypePause");
            [[LMMusicTool sharedLMMusicTool] pause];
            break;
        case BtnTypeNext:
            NSLog(@"BtnTypeNext");
            [self next];
            break;
        case BtnTypePrev:
            NSLog(@"BtnTypePrev");
            [self previous];
            break;
        default:
            break;
    }
}
-(void) playMusic{
    [[LMMusicTool sharedLMMusicTool] prepareToPlayWithMusic:self.musics[self.musicIndex]];
    [LMMusicTool sharedLMMusicTool].player.delegate = self;
    self.toolBar.playingMusic = self.musics[self.musicIndex];
    if(self.toolBar.isPlaying){
        [[LMMusicTool sharedLMMusicTool] play];
    }
}
-(void) previous{
    if (self.musicIndex == 0) {
        self.musicIndex = self.musics.count - 1;
    }else {
        self.musicIndex--;
    }
    [self playMusic];

}
- (void) next{
    if (self.musicIndex == self.musics.count - 1) {
        self.musicIndex = 0;
    }else {
        self.musicIndex++;
    }
    [self playMusic];
    
}

- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag{
    [self next];
}
@end
