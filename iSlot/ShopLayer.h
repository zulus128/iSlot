//
//  ShopLayer.h
//  iSlot
//
//  Created by вадим on 5/7/13.
//  Copyright (c) 2013 Zul. All rights reserved.
//

#import "cocos2d.h"
#import "ShopSubLayer.h"
#import "ShopLuckSubLayer.h"

#define Xsh 1024 / 2.0f
#define Ysh 768 / 2.0f + 54

#define ccpshop1(__X__, __Y__, sizeX, sizeY)   CGPointMake(__X__ + sizeX / 2.0f, 768 - (__Y__ + sizeY / 2.0f))

#define DSdelay 0.5f

#define ConfDelay 0.3f

@class  ConfirmLayer;
@class  ConfirmLayer1;
@class  ConfirmLayer2;

@interface ShopLayer : CCLayerColor {
    
    CCSprite *background;
    CCSprite *background1;

    ShopSubLayer* ssl;
    ShopLuckSubLayer* slsl;

    ConfirmLayer* cnflay;
    ConfirmLayer1* cnflay1;
    ConfirmLayer2* cnflay2;
    
    CCSprite *lck;
    CCSprite *lck1;
    CCMenuItemSprite *itemclo;
    
    BOOL showed;
    BOOL luck;
}

-(void)show;
-(void)hide;
-(void) showConf;
-(void) showConf1;
-(void) showConf2;

@property (nonatomic, retain) CCLayer* player;

@end
