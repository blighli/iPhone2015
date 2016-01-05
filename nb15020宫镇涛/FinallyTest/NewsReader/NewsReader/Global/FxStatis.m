

#import "FxStatis.h"
#import "MobClick.h"
#import "BaiduMobStat.h"

@implementation FxStatis


#define UMengKey    @"55b5f67f67e58e7c0700355c"
#define BaiDuKey    @"ff4037a93d"

+ (void)setup
{
    NSString *chanel = ChannelEnterprise;
#ifdef APPSTORE
    chanel = ChannelAppStore;
#endif
    
    [MobClick startWithAppkey:UMengKey
                 reportPolicy:REALTIME
                    channelId:chanel];
    
    [FxStatis setupBaiDu:chanel];
}

+ (void)setupBaiDu:(NSString *)channel
{
    BaiduMobStat* statTracker = [BaiduMobStat defaultStat];
    
    // 是否允许截获并发送崩溃信息，请设置YES或者NO
    statTracker.enableExceptionLog = NO;
    statTracker.channelId = channel;
    statTracker.logStrategy = BaiduMobStatLogStrategyCustom;
    //为1时表示发送日志的时间间隔为1小时,当logStrategy设置为BaiduMobStatLogStrategyCustom时生效
    statTracker.logSendInterval = 1;
    //是否仅在WIfi情况下发送日志数据
    statTracker.logSendWifiOnly = NO;
    //设置应用进入后台再回到前台为同一次session的间隔时间[0~600s],超过600s则设为600s，默认为30s
    statTracker.sessionResumeInterval = 10;
    statTracker.shortAppVersion  = [FxGlobal clientVersion];
    //调试的时候打开，会有log打印，发布时候关闭
    //statTracker.enableDebugOn = YES;
    
    [statTracker startWithAppId:BaiDuKey];
}


+ (void)intoPage:(NSString *)pageName
{
    [MobClick beginLogPageView:pageName];
    [[BaiduMobStat defaultStat] pageviewStartWithName:pageName];
}

+ (void)outPage:(NSString *)pageName
{
    [MobClick endLogPageView:pageName];
    [[BaiduMobStat defaultStat] pageviewEndWithName:pageName];
}

+ (void)event:(NSString *)event
        value:(NSString *)value
{
    [MobClick event:event label:value];
    [[BaiduMobStat defaultStat] eventEnd:event eventLabel:value];
}

@end
