//
//  ShopSubLayer.h
//  iSlot
//
//  Created by вадим on 5/9/13.
//  Copyright (c) 2013 Zul. All rights reserved.
//

#import "cocos2d.h"

#define ccpluck(__X__, __Y__, sizeX, sizeY)   CGPointMake(__X__ + sizeX / 2.0f, 768 - (__Y__ + sizeY / 2.0f))

#define SHOPLUCK_TAG 3

#define DSLLdelay 0.5f

@class ShopLayer;

@interface ShopLuckSubLayer : CCLayerColor {
   
    CCMenu* menukeys;
    
    CCLabelTTF* label5;
    CCLabelTTF* label51;
    CCLabelTTF* label52;
    
    CCLabelTTF* label10;
    CCLabelTTF* label101;
    CCLabelTTF* label102;
    
    CCLabelTTF* label20;
    CCLabelTTF* label201;
    CCLabelTTF* label202;
    
    CCLabelTTF* label25;
    CCLabelTTF* label251;
    CCLabelTTF* label252;
    
    CCLabelTTF* label35;
    CCLabelTTF* label351;
    CCLabelTTF* label352;
    
    CCLabelTTF* label50;
    CCLabelTTF* label501;
    CCLabelTTF* label502;
    
    CCSprite* fp5;
    CCSprite* fp10;
    CCSprite* fp20;
    CCSprite* fp25;
    CCSprite* fp35;
    CCSprite* fp50;
    
    CCSprite* frame5;
    CCSprite* frame10;
    CCSprite* frame20;
    CCSprite* frame25;
    CCSprite* frame35;
    CCSprite* frame50;

    CCLabelTTF* price5;
    CCLabelTTF* price10;
    CCLabelTTF* price20;
    CCLabelTTF* price25;
    CCLabelTTF* price35;
    CCLabelTTF* price50;

    int type;
    

    CCMenuItemSprite* item5;
    CCMenuItemSprite* item10;
    CCMenuItemSprite* item20;
    CCMenuItemSprite* item25;
    CCMenuItemSprite* item35;
    CCMenuItemSprite* item50;
}

-(void) addContent;
-(void)show;
-(void)hide;
//-(void)hide1;
-(void) onConfirmed;
-(void)enable;
-(void)disable;
-(void) refresh;

@property (nonatomic, retain) CCLayer* player;
@property (nonatomic, retain) ShopLayer* shlayer;


@end
