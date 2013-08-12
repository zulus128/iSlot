//
//  ConfirmLayer.h
//  iSlot
//
//  Created by Zul on 6/3/13.
//  Copyright (c) 2013 Zul. All rights reserved.
//

#import "cocos2d.h"
#import "ShopSubLayer.h"
#import "Common.h"


@interface ConfirmLayer1 : CCLayerColor {
    
    CCSprite *conffon;
    
    CCMenu* menuconf1;
    CCMenuItemSprite *itemok;
    CCMenuItemSprite *itembuy;
    CCLabelTTF *labelConf1;
    CCLabelTTF *labelConf1_1;
    
}

-(void) show1;

@property (nonatomic, retain) ShopSubLayer* sslayer;

@end
