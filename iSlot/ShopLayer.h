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

@interface ShopLayer : CCLayerColor {
    
    CCSprite *background;
    
    CCMenu* menukeys;
    ShopSubLayer* ssl;
}

-(void)show;
-(void)hide;

@property (nonatomic, retain) CCLayer* player;

@end
