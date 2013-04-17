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

@interface GameLayer : CCLayer {
    
//    int fames[FAME_LEVELS];

    CCLayerColor* colorLayer;

    
    CCLabelTTF *label;
    CCLabelTTF *lastw;

    CCLabelTTF *labelCoins;
    CCLabelTTF *labelLines;
    CCLabelTTF *labelMoney;
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

    NSArray* lines;
    NSArray* values;
    NSMutableArray* combinations;
    Combination* prevComb;
    
    int combNum;
    BOOL info;
    CCSprite *infoscene;
    
    CCSprite* slide[SLIDE_TYPES];

    CCSprite* complete;
    CCLabelTTF *ygift;
}
-(void) toTop;

// returns a CCScene that contains the HelloWorldLayer as the only child
+(CCScene *) scene;

@end