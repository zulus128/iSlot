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
    float delay;
    BOOL finished;
}

- (id)initWithLayer:(CCLayer *)lay X:(int)xx Y:(int)yy Delay:(float)del;
-(void) start;
-(int) getSlideNum: (int)pos;


@end
