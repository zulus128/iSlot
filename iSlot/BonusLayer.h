//
//  IntroLayer.h
//  iSlot
//
//  Created by Zul on 2/6/13.
//  Copyright Zul 2013. All rights reserved.
//

#import "cocos2d.h"

#define Xbn 1024 / 2.0f
#define Ybn 768

#define ccpbon(__X__, __Y__, sizeX, sizeY)   CGPointMake(__X__ + sizeX / 2.0f, Ybn - (__Y__ + sizeY / 2.0f))

#define Ddelay 0.5f
#define fsize 50

@interface BonusLayer : CCLayerColor  {
    
    CCSprite *fon;
    
    CCSprite *k1;
    CCSprite *k2;
    CCSprite *k3;
    CCSprite *k4;
    CCSprite *k5;
    CCSprite *k6;
    CCMenuItemToggle* it1;
    CCMenuItemToggle* it2;
    CCMenuItemToggle* it3;
    CCMenuItemToggle* it4;
    CCMenuItemToggle* it5;
    CCMenuItemToggle* it6;
    CCLabelTTF* l1;
    CCLabelTTF* l2;
    CCLabelTTF* l3;
    CCLabelTTF* l4;
    CCLabelTTF* l5;
    CCLabelTTF* l6;
    
    CCMenuItem *i1;
    CCMenuItem *ii1;
    CCMenuItem *i2;
    CCMenuItem *ii2;
    CCMenuItem *i3;
    CCMenuItem *ii3;
    CCMenuItem *i4;
    CCMenuItem *ii4;
    CCMenuItem *i5;
    CCMenuItem *ii5;
    CCMenuItem *i6;
    CCMenuItem *ii6;
    
    int opened;
    
    CCMenu* menukeys;
}

-(void)show;
-(void)hide;

@property (nonatomic, retain) CCLayer* player;

@end
