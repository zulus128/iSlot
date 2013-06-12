//
//  InappLayer.h
//  iSlot
//
//  Created by Zul on 4/15/13.
//  Copyright (c) 2013 Zul. All rights reserved.
//

#import "cocos2d.h"

#define Xin 1024 / 2.0f
#define Yin 768 / 2.0f + 54

#define ccpina(__X__, __Y__, sizeX, sizeY)   CGPointMake(__X__ + sizeX / 2.0f, Yin + 510 / 2.0f - (__Y__ + sizeY / 2.0f))
#define ccpina1(__X__, __Y__, sizeX, sizeY)   CGPointMake(__X__ + sizeX / 2.0f, Yin + 67 + 510 / 2.0f - (__Y__ + sizeY / 2.0f))

@interface InappLayer : CCLayer {
    
    CCSprite *background;
    CCSprite *background1;
    CCMenu* menucoins;
    CCMenu* menukeys;

    CCSprite *ccheck1;
    CCSprite *ccheck2;
    CCSprite *ccheck3;
    CCSprite *ccheck4;
    CCSprite *ccheck5;
    CCSprite *ccheck6;
    
    CCSprite *kcheck1;
    CCSprite *kcheck2;
    CCSprite *kcheck3;
    CCSprite *kcheck4;
    CCSprite *kcheck5;
    CCSprite *kcheck6;
    CCSprite *kcheck7;
    
    int inapp;
    
    BOOL showed;
}

//@property (nonatomic,readwrite) BOOL isKeys;

-(void)show;
-(void)hide;


@property (nonatomic, retain) CCLayer* player;

-(void) setTab:(int) t;

@end
