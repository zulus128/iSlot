//
//  ShopSubLayer.h
//  iSlot
//
//  Created by вадим on 5/9/13.
//  Copyright (c) 2013 Zul. All rights reserved.
//

#import "cocos2d.h"

#define SHOPSUB_TAG 7
//#define CHECK_TAG 8
//#define SLOCK_TAG 9

#define DSLdelay 0.5f
#define IS_RETINA ([[UIScreen mainScreen] respondsToSelector:@selector(displayLinkWithTarget:selector:)] && ([UIScreen mainScreen].scale == 2.0))

#define XXX 160
#define YYY 1260

@class ShopLayer;

@interface ShopLuckSubLayer : CCLayerColor {
    
}

-(void) addContent;
-(void)show;
-(void)hide;
-(void) onConfirmed;

@property (nonatomic, retain) CCLayer* player;
@property (nonatomic, retain) ShopLayer* shlayer;

@end
