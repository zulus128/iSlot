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
    
    int fames[FAME_LEVELS];

    CCLabelTTF *label;
    CCLabelTTF *lastw;

    CCLabelTTF *labelCoins;
    CCLabelTTF *labelLines;
    CCLabelTTF *labelMoney;
    CCLabelTTF *labelYourLuck;
    CCLabelTTF *labelFameLevel;
    
    Bar* bar [BARS_CNT];

    CCSprite* lineSprite[LINES_CNT];

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

}

// returns a CCScene that contains the HelloWorldLayer as the only child
+(CCScene *) scene;

@end