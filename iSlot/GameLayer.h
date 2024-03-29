//
//  GameLayer.h
//  iSlot
//
//  Created by Zul on 2/7/13.
//  Copyright (c) 2013 Zul. All rights reserved.
//

#import <GameKit/GameKit.h>
#import "cocos2d.h"
#import "Bar.h"
#import "Combination.h"

#define STAR_STARTSCALE 0.5f
#define STAR_ENDSCALE 1.5f
#define Ldelay 0.5f
#define LUCK_TAG 20000
#define LUCK_TAG1 223

#define SKEL_DELAY 1.0f
#define LEVELBAR_X -300
#define LEVELBAR_Y 650

@class GameoverLayer;

@interface GameLayer : CCLayer <GKAchievementViewControllerDelegate, GKLeaderboardViewControllerDelegate, GKGameCenterControllerDelegate> {
    
//    int fames[FAME_LEVELS];

    CCLayerColor* colorLayer;
    
    GameoverLayer* govlay;
    
    CCLabelTTF *label;
    CCLabelTTF *lastw;

    CCLabelTTF *labelCoins;
    CCLabelTTF *labelLines;
    CCLabelTTF *labelMoney;
    CCLabelTTF *labelKeys;
    CCLabelTTF *labelYourLuck;
    CCLabelTTF *labelFameLevel;
    CCLabelTTF *labelBet;
    CCLabelTTF *labelLevelMoney;
    
    Bar* bar [BARS_CNT];

    CCSprite* lineSprite[LINES_CNT];
    CCMenu *menu;
    CCMenu *menu1;
    CCSprite* level;
    CCSprite* fame;

    CCSprite* star;
    CCSprite* stars[BARS_CNT];

    NSArray* lines;
    NSArray* values;
    NSMutableDictionary* money;
    NSMutableArray* combinations;
    Combination* prevComb;
    
    int combNum;
    BOOL info;
    CCSprite *infoscene;
    
    CCSprite* slide[SLIDE_TYPES];

    CCSprite* complete;
    CCLabelTTF *ygift;
    
    CCSprite* droppedcomp;
    CCLabelTTF *dropped_lab;
    
    CCSprite* bigwin;
    
    BOOL bonus;
    
    BOOL bon;
    
    CCSprite *luck1;
    CCSprite *luck2;
    CCSprite *luck3;

    CCLabelTTF* lrand;
//    CCLabelTTF* lkoef;
//    CCLabelTTF* lkoefof;
    int randkoeff;
    int lkoeff;
    int lkoeffof;
    
//    int combcnt3;
//    int combcnt4;
//    int combcnt5;
    
    CCLabelTTF* lmax4;
    CCLabelTTF* lmax5;
    
    int tt;
    float yfrm;

    CCSprite* skel1;
    CCSprite* skel2;
//    CCSprite* spin1;
    CCSprite* spin2;
    CCSprite *spriteSpin;
}

- (void) showShop;
- (void) showSlon;

-(void) toTop;

// returns a CCScene that contains the HelloWorldLayer as the only child
+(CCScene *) scene;
- (int) preCheckLines;

- (Bar*) getBar:(int)n;
- (int) getSlideWithBar:(int)b Line:(int)l Pos:(int)p;

-(void) prolong;

@end