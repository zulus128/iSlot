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


@interface ConfirmLayer2 : CCLayerColor {
    
    CCSprite *conffon1;
    
    CCMenu* menuconf2;
    CCMenuItemSprite *itemyes1;
    CCMenuItemSprite *itemno1;
    CCLabelTTF *labelConf2;
    CCLabelTTF *labelConf2_1;
    CCLabelTTF *labelConf2_2;
    
}

-(void) show1;

@property (nonatomic, retain) ShopSubLayer* sslayer;

@end
