//
//  IntroLayer.h
//  iSlot
//
//  Created by Zul on 2/6/13.
//  Copyright Zul 2013. All rights reserved.
//


// When you import this file, you import all the cocos2d classes
#import "cocos2d.h"
#define     ccplevel(__X__, __Y__)   CGPointMake(__X__ + 115/2.f, 768 - (__Y__ + 111/2.f))

@interface MapLayer : CCLayer {
    
    float x0;
    float xl0;
}

// returns a CCScene that contains the HelloWorldLayer as the only child
+(CCScene *) scene;

@end
