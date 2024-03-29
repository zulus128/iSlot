//
//  Bar.h
//  iSlot
//
//  Created by Zul on 2/8/13.
//  Copyright (c) 2013 Zul. All rights reserved.
//

#import "cocos2d.h"
#import "Common.h"

@interface Bar : CCNode {
    
    CCLayer * layer;
    
    CCSprite* slide[SLIDE_CNT];
    int slide_num[SLIDE_CNT];
    CCSprite* proto[SLIDE_TYPES];
    CCSprite* blur[SLIDE_TYPES];
    id move_ease;
    id move_forward;
    id seq_forward;
    id seq1;
    int Y;
    int X;
    BOOL stop1;
//    BOOL stop2;
    float delay;
    float bondelay1;
    float bondelay2;
    float bondelay4;
    BOOL finished;
    
    float dell;
    BOOL preset;
    int presetcnt;
    int posline;
    
    int prearr[3];
}

- (id)initWithLayer:(CCLayer *)lay X:(int)xx Y:(int)yy Delay:(float)del BonDelay1:(float)del1 BonDelay2:(float)del2 BonDelay4:(float)del4;
-(void) startWithPosInRandLine:(int)posinline;
-(int) getSlideNum: (int)pos;
-(int) getPreSlideNum: (int)pos;
-(CCSprite*) getSprite: (int)pos;
-(void) prolong;


@end
