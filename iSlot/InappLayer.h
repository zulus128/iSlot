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

@interface InappLayer : CCLayer {
    
    CCSprite *background;
    CCSprite *background1;
}

//@property (nonatomic,readwrite) BOOL isKeys;

-(void) setTab:(int) t;

@end
