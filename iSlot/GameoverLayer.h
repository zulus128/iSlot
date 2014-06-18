//
//  GameoverLayer.h
//  Historic Slots
//
//  Created by Admin on 18.06.14.
//  Copyright (c) 2014 Zul. All rights reserved.
//

#import "cocos2d.h"

@interface GameoverLayer : CCLayerColor {
    
    CCSprite *conffon;
    
    CCMenu* menuconf;

    CCMenuItemSprite *itembuy;
    CCMenuItemSprite *itemrestart;
    
}

-(void) show1;

@property (nonatomic, retain) CCLayer* sslayer;

@end
