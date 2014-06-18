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


@interface ConfirmLayer : CCLayerColor {
    
    CCSprite *conffon;
//    CCSprite *conffon1;
    
    CCMenu* menuconf;
    CCMenu* menuconf1;
    CCMenu* menuconf2;
    CCMenuItemSprite *itemyes;
    CCMenuItemSprite *itemno;
    CCMenuItemSprite *itemyes1;
    CCMenuItemSprite *itemno1;
    CCMenuItemSprite *itemok;
    CCLabelTTF *labelConf;
    CCLabelTTF *labelConf1;
    CCLabelTTF *labelConf1_1;
    CCLabelTTF *labelConf2;
    CCLabelTTF *labelConf2_1;
    CCLabelTTF *labelConf2_2;

}

-(void) show1;

-(void) setText:(NSString*)s;

//@property (nonatomic, retain) ShopSubLayer* sslayer;
@property (nonatomic, retain) CCLayerColor * sslayer;
@end
