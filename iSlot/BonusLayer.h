//
//  IntroLayer.h
//  iSlot
//
//  Created by Zul on 2/6/13.
//  Copyright Zul 2013. All rights reserved.
//

#import "cocos2d.h"

#define Xbn 1024 / 2.0f
#define Ybn 768 / 2.0f + 54

#define ccpbon(__X__, __Y__, sizeX, sizeY)   CGPointMake(__X__ + sizeX / 2.0f, Ybn + 510 / 2.0f - (__Y__ + sizeY / 2.0f))

@interface BonusLayer : CCLayer  {
    
}

@end
