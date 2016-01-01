

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface PauseLayerProtocol: CCNode

-(void)pauseLayerDidPause;

-(void)pauseLayerDidUnpause;

@end

@interface GamePause : CCLayerColor {
    
    PauseLayerProtocol * delegate;
    
    CGSize screenSize;
    
    
    CCSprite *bg;
    
    
}

@property (nonatomic,assign)PauseLayerProtocol * delegate;

//+ (id) layerWithColor:(ccColor4B)color delegate:(PauseLayerProtocol *)_delegate;

//- (id) initWithColor:(ccColor4B)c delegate:(PauseLayerProtocol *)_delegate;

+ (id) layerWithColor:(ccColor4B)color delegate:(id)_delegate;
- (id) initWithColor:(ccColor4B)c delegate:(id)_delegate;


-(void)pauseDelegate;

@end
