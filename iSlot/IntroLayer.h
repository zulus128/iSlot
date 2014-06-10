//
//  IntroLayer.h
//  iSlot
//
//  Created by Zul on 2/6/13.
//  Copyright Zul 2013. All rights reserved.
//

#import <GameKit/GameKit.h>
#import "GameCenterManager.h"

// When you import this file, you import all the cocos2d classes
#import "cocos2d.h"
#import "CCScrollLayer.h"

#define MENU_TAG 111
#define LUCK_TAG 20000
#define LUCK_TAG1 223
#define Ldelay 0.5f

// HelloWorldLayer
@interface IntroLayer : CCLayer <GKAchievementViewControllerDelegate, GKLeaderboardViewControllerDelegate, GKGameCenterControllerDelegate, GameCenterManagerDelegate> {
    
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
    
    CCSprite *luck1;
    CCSprite *luck2;
    CCSprite *luck3;

    int tt;
    int tim;
    float yfrm;
}

// returns a CCScene that contains the HelloWorldLayer as the only child
+(CCScene *) scene;
- (void) toTop;
- (void) refreshLabels;

@property (nonatomic, retain) GameCenterManager *gameCenterManager;
@property (nonatomic, assign) int64_t currentScore;
@property (nonatomic, retain) NSString* cachedHighestScore;
@property (nonatomic, retain) UIView* resetAchievementsView;
@property (nonatomic, retain) UIView* gameButtonView;
@property (nonatomic, retain) NSString* personalBestScoreDescription;
@property (nonatomic, retain) NSString* personalBestScoreString;
@property (nonatomic, retain) NSString* leaderboardHighScoreDescription;
@property (nonatomic, retain) NSString* leaderboardHighScoreString;
@property (nonatomic, retain) NSString* currentLeaderBoard;

@end
