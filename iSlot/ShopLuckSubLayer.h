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

}

-(void) addContent;
-(void)show;
-(void)hide;
-(void)hide1;
-(void) onConfirmed;

@property (nonatomic, retain) CCLayer* player;
@property (nonatomic, retain) ShopLayer* shlayer;


@end
