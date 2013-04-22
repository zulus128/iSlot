//
//  IntroLayer.h
//  iSlot
//
//  Created by Zul on 2/6/13.
//  Copyright Zul 2013. All rights reserved.
//

#import <GameKit/GameKit.h>

// When you import this file, you import all the cocos2d classes
#import "cocos2d.h"
#define     ccplevel(__X__, __Y__)   CGPointMake(__X__ + 115/2.f, 768 - (__Y__ + 111/2.f))
#define     ccpstar(__X__, __Y__)   CGPointMake(__X__ + 139/2.f, 768 - (__Y__ + 64/2.f) - 74)
#define     ccplock(__X__, __Y__)   CGPointMake(__X__ + 115/2.f, 768 - (__Y__ + 111/2.f) - 74)

#define MENU_TAG 111

static CCLabelTTF *labelMoney = nil;
static CCLabelTTF *labelYourLuck = nil;
static CCLabelTTF *labelKeys = nil;

@interface MapLayer : CCLayer  <GKAchievementViewControllerDelegate, GKLeaderboardViewControllerDelegate, GKGameCenterControllerDelegate> {
    
    float x0;
    float xl0;

    CCMenu* menu;
    
//    CCLabelTTF *labelMoney;
//    CCLabelTTF *labelYourLuck;

}
-(void) toTop;

// returns a CCScene that contains the HelloWorldLayer as the only child
+(CCScene *) scene;

@end
