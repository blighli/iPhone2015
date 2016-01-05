//
//  LMPlayerToolBar.m
//  音乐播放器
//
//  Created by 张焕 on 12/31/15.
//  Copyright © 2015 张焕. All rights reserved.
//

#import "LMPlayerToolBar.h"
#import "LMMusic.h"
#import "UIButton+LM.h"
#import "UIImage+LM.h"
#import "LMMusicTool.h"
#import "NSString+LM.h"
@interface LMPlayerToolBar()

@property (weak, nonatomic) IBOutlet UILabel *musicNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *singerNameLabel;
@property (weak, nonatomic) IBOutlet UISlider *timeSlider;
@property (weak, nonatomic) IBOutlet UILabel *currentTimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalTimeLabel;
@property (weak, nonatomic) IBOutlet UIImageView *singerImgView;

@property (strong, nonatomic) CADisplayLink *link;//定时器
@property (assign, nonatomic, getter=isDragging) BOOL dragging;
@end
@implementation LMPlayerToolBar

+(instancetype)playerToolBar{
    return [[[NSBundle mainBundle] loadNibNamed:@"LMPlayerToolBar" owner:nil options:nil] lastObject];
}

- (CADisplayLink*) link{
    if(!_link){
        _link = [CADisplayLink displayLinkWithTarget:self selector:@selector(update)];
    }
    return _link;
}

- (IBAction)playBtnClick:(UIButton*)btn {
    self.playing = !self.playing;
    if(self.playing){
        NSLog(@"play");
        [btn setNBg:@"playbar_pausebtn_nomal" hBg:@"playbar_pausebtn_click"];
        [self notifyDelegateWithBtnType:BtnTypePlay];
    }else{
        NSLog(@"pause");
        [btn setNBg:@"playbar_playbtn_nomal" hBg:@"playbar_playbtn_click"];
        [self notifyDelegateWithBtnType:BtnTypePause];
    }
}
- (IBAction)previousBtnClick:(id)sender {
    [self notifyDelegateWithBtnType:BtnTypePrev];
    self.singerImgView.transform = CGAffineTransformIdentity;
}
- (IBAction)nextBtnClick:(id)sender {
    [self notifyDelegateWithBtnType:BtnTypeNext];
    self.singerImgView.transform = CGAffineTransformIdentity;
}

-(void)notifyDelegateWithBtnType:(BtnType)btnType{
    if([self.delegate respondsToSelector:@selector(playerToolBar:btnClickWithType:)]){
        [self.delegate playerToolBar:self btnClickWithType:btnType];
    }
}

#pragma mark 设置当前的音乐并显示数据
- (void)setPlayingMusic:(LMMusic *)playingMusic{
    _playingMusic = playingMusic;
    UIImage *circleImg = [UIImage circleImageWithName:playingMusic.singerIcon borderWidth:0.0f borderColor:[UIColor clearColor]];
    self.singerImgView.image = circleImg;
    self.musicNameLabel.text = playingMusic.name;
    self.singerNameLabel.text = playingMusic.singer;
    double duration = [LMMusicTool sharedLMMusicTool].player.duration;
    self.totalTimeLabel.text = [NSString getMinuteSecondWithSecond:duration];
    self.timeSlider.maximumValue = duration;
    double currentTime = [LMMusicTool sharedLMMusicTool].player.currentTime;
    self.timeSlider.value = currentTime;
    self.currentTimeLabel.text = [NSString getMinuteSecondWithSecond:currentTime];
    self.singerImgView.transform = CGAffineTransformIdentity;
}

- (void)dealloc{
    [self.link removeFromRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
}

- (void)awakeFromNib{
    [self.timeSlider setThumbImage:[UIImage imageNamed:@"playbar_slider_thumb"] forState:UIControlStateNormal];
    [self.link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
}

#pragma mark 更新进度条
- (void) update{
    if(self.isPlaying && self.isDragging==NO){
        double currentTime = [LMMusicTool sharedLMMusicTool].player.currentTime;
        self.timeSlider.value = currentTime;
        self.currentTimeLabel.text = [NSString getMinuteSecondWithSecond:currentTime];
        CGFloat angle = M_PI_4 / 60;
        self.singerImgView.transform = CGAffineTransformRotate(self.singerImgView.transform, angle);
    }
    
}

#pragma mark slider点击事件 按下
- (IBAction)sliderTouchDown:(UISlider *)sender {
    self.dragging = YES;
    if(self.isPlaying){
        [[LMMusicTool sharedLMMusicTool] pause];
    }
    
}

#pragma mark slider拖动事件 数值变化
- (IBAction)sliderChange:(UISlider *)sender {
    [LMMusicTool sharedLMMusicTool].player.currentTime = sender.value;
    self.currentTimeLabel.text = [NSString getMinuteSecondWithSecond:sender.value];
}


#pragma mark slider点击事件 抬起
- (IBAction)sliderTouchUp:(UISlider *)sender {
    self.dragging = NO;
    if(self.isPlaying){
        [[LMMusicTool sharedLMMusicTool] play];
    }
    
}



@end
