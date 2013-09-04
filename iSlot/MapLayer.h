//
//  IntroLayer.h
//  iSlot
//
//  Created by Zul on 2/6/13.
//  Copyright Zul 2013. All rights reserved.
//

#import <GameKit/GameKit.h>
#import "CCScrollLayer.h"

// When you import this file, you import all the cocos2d classes
#import "cocos2d.h"
#define     ccplevel(__X__, __Y__)   CGPointMake(__X__ + 115/2.f, 768 - (__Y__ + 111/2.f))
#define     ccpstar(__X__, __Y__)   CGPointMake(__X__ + 139/2.f, 768 - (__Y__ + 64/2.f) - 74)
#define     ccplock(__X__, __Y__)   CGPointMake(__X__ + 115/2.f, 768 - (__Y__ + 111/2.f) - 74)
#define     ccpchech(__X__, __Y__)   CGPointMake(__X__ + 115/2.f + 16, 768 - (__Y__ + 111/2.f) - 111/2.f - 14)
//#define     ccpchech(__X__, __Y__)   CGPointMake(__X__ + 115/2.f + 16, 768 - (__Y__ + 111/2.f) - 74 - 14)

#define MENU_TAG1 5111
#define LOCKS_TAG 6000
#define STARS_TAG 16000
#define CHECH_TAG 100000

#define Ldelay 0.5f
#define LUCK_TAG2 200000
#define LUCK_TAG1 223

static CCLabelTTF *labelMoney = nil;
static CCLabelTTF *labelYourLuck = nil;
static CCLabelTTF *labelKeys = nil;
static float yfrm = 0;

@interface MapLayer : CCLayer  <GKAchievementViewControllerDelegate, GKLeaderboardViewControllerDelegate, GKGameCenterControllerDelegate> {
    
    float x0;
    float xl0;
    double cTime;

    CCMenu* menu;
    
    CCSprite *arealock1;
    CCSprite *arealock2;
    CCSprite *arealock3;

    CCSprite *oreol;
    float oreol_rot;
//    float aaa;
    
    NSMutableArray *layers;
    CCScrollLayer *scroller;



}
-(void) toTop;

+(CCScene *) scene;

@end
