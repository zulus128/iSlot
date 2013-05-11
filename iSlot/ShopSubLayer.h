//
//  ShopSubLayer.h
//  iSlot
//
//  Created by вадим on 5/9/13.
//  Copyright (c) 2013 Zul. All rights reserved.
//

#import "cocos2d.h"

#define SHOPSUB_TAG 541
#define DSLdelay 0.5f
#define IS_RETINA ([[UIScreen mainScreen] respondsToSelector:@selector(displayLinkWithTarget:selector:)] && ([UIScreen mainScreen].scale == 2.0))

@interface ShopSubLayer : CCLayerColor {
    
    float y0;
    float yl0;
    CCLabelTTF* lab1;
    CCMenuItemSprite *itemshop;
}

-(void) addContent;
-(void)show;
-(void)hide;

@end
