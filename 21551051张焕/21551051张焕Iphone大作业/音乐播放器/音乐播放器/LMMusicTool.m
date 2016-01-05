//
//  LMMusicTool.m
//  音乐播放器
//
//  Created by 张焕 on 12/31/15.
//  Copyright © 2015 张焕. All rights reserved.
//

#import "LMMusicTool.h"
#import "LMMusic.h"
#import <MediaPlayer/MediaPlayer.h>

@interface LMMusicTool()

@end

@implementation LMMusicTool
singleton_implementation(LMMusicTool)
- (void)prepareToPlayWithMusic:(LMMusic *)music{
    NSURL *musicURL = [[NSBundle mainBundle] URLForResource:music.filename withExtension:nil];
    self.player = [[AVAudioPlayer alloc] initWithContentsOfURL:musicURL error:nil];
    [self.player prepareToPlay];
    
    //设置锁屏音乐信息
    NSMutableDictionary *info = [NSMutableDictionary dictionary];
    
    info[MPMediaItemPropertyAlbumTitle] = music.album;
    info[MPMediaItemPropertyTitle] = music.name;
    info[MPMediaItemPropertyArtist] = music.singer;
    UIImage* artworkImg = [UIImage imageNamed:music.icon];
    MPMediaItemArtwork *artwork = [[MPMediaItemArtwork alloc] initWithImage:artworkImg];
    info[MPMediaItemPropertyArtwork] = artwork;
    info[MPMediaItemPropertyPlaybackDuration] = @(self.player.duration);
    
    [MPNowPlayingInfoCenter defaultCenter].nowPlayingInfo = info;
}

-(void)pause{
    [self.player pause];
}

- (void)play{
    [self.player play];
}
@end
