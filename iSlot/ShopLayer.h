//
//  ShopLayer.h
//  iSlot
//
//  Created by вадим on 5/7/13.
//  Copyright (c) 2013 Zul. All rights reserved.
//

#import "cocos2d.h"
#import "ShopSubLayer.h"

#define Xsh 1024 / 2.0f
#define Ysh 768 / 2.0f + 54

#define ccpshop(__X__, __Y__, sizeX, sizeY)   CGPointMake(__X__ + sizeX / 2.0f, Ysh + 510 / 2.0f - (__Y__ + sizeY / 2.0f))

#define DSdelay 0.5f

#define ConfDelay 0.3f

@interface ShopLayer : CCLayerColor {
    
    CCSprite *background;
    CCSprite *conffon;
    CCSprite *conffon1;
    
//    CCMenu* menukeys;
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

    ShopSubLayer* ssl;

}

-(void)show;
-(void)hide;
-(void) showConf;
-(void) showConf1;
-(void) showConf2;

@property (nonatomic, retain) CCLayer* player;

@end
