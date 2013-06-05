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
#import "CCScrollLayer.h"

#define MENU_TAG 111

// HelloWorldLayer
@interface IntroLayer : CCLayer <GKAchievementViewControllerDelegate, GKLeaderboardViewControllerDelegate, GKGameCenterControllerDelegate> {
    
    CCLabelTTF *labelMoney;
    CCLabelTTF *labelKeys;
    CCLabelTTF *labelYourLuck;
    CCLabelTTF *labelFameLevel;
    CCSprite* fame;

    CCLayerColor* colorLayer;
    CCMenu* menu;
    NSMutableArray *layers;
    
    CCSprite* sett1;
    CCSprite* sett2;
    CCSprite* sett3;
    CCMenu* settmenu;

    CCScrollLayer *scroller;
}

// returns a CCScene that contains the HelloWorldLayer as the only child
+(CCScene *) scene;
- (void) toTop;
- (void) refreshLabels;

@end
