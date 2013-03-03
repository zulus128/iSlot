//
//  IntroLayer.h
//  iSlot
//
//  Created by Zul on 2/6/13.
//  Copyright Zul 2013. All rights reserved.
//


// When you import this file, you import all the cocos2d classes
#import "cocos2d.h"

// HelloWorldLayer
@interface IntroLayer : CCLayer {
    
//    CCSprite* polosa;
    CCLabelTTF *labelMoney;
    CCLabelTTF *labelYourLuck;
    CCLabelTTF *labelFameLevel;
    CCSprite* fame;

}

// returns a CCScene that contains the HelloWorldLayer as the only child
+(CCScene *) scene;

@end
