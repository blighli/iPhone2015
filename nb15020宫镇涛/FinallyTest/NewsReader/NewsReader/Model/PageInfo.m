

#import "PageInfo.h"

@implementation PageInfo

+ (PageInfo *)infoFromDict:(NSDictionary *)dict
{
    PageInfo *info = [[PageInfo alloc] init];
    
    info.ID = [dict objectForKey:@"ClassName"];
    info.name = [dict objectForKey:@"Title"];
    info.image = [dict objectForKey:@"Image"];
    info.selectImage = [dict objectForKey:@"SelectImage"];
    info.unLoad = [[dict objectForKey:@"UnLoad"] boolValue];
    
    return info;
}

+ (NSArray *)pages
{
    NSString *configFile = [[NSBundle mainBundle] pathForResource:@"TabBarPages" ofType:@"plist"];
    NSArray *pageConfigs = [NSArray arrayWithContentsOfFile:configFile];
    NSMutableArray *pages = [[NSMutableArray alloc] init];
    
    if (pageConfigs.count <= 0) {
        BASE_ERROR_FUN(@"没有配置TabBarPages.plist");
    }
    
    for (NSDictionary *dict in pageConfigs) {
        [pages addObject:[PageInfo infoFromDict:dict]];
    }
    
    return pages;
}

+ (NSArray *)pageControllers
{
    NSMutableArray *controllers = [NSMutableArray array];
    NSArray *pages = [PageInfo pages];
    UIViewController *pageController = nil;
    UINavigationController *navPage = nil;
    
    for (PageInfo *pageInfo in pages) {
        if (pageInfo.unLoad) {
            if (pageInfo.unLoad) {
                continue;
            }
        }
        
        pageController = [[NSClassFromString(pageInfo.ID) alloc] init];
        navPage = [[UINavigationController alloc] initWithRootViewController:pageController];
        
        pageController.title = pageInfo.name;
        pageController.tabBarItem.image = [UIImage imageNamed:pageInfo.image];
        
        [controllers addObject:navPage];
    }
    
    return controllers;
}

@end
