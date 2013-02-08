//
//  GameLayer.h
//  iSlot
//
//  Created by Zul on 2/7/13.
//  Copyright (c) 2013 Zul. All rights reserved.
//

#import <GameKit/GameKit.h>

// When you import this file, you import all the cocos2d classes
#import "cocos2d.h"

#define CNT 4

// HelloWorldLayer
@interface GameLayer : CCLayer {
    
    CCSprite* slide[CNT];

    id move_ease;
//    id move_ease_rev;
    id move_forward;
    id seq_forward;
    id seq1;
//    id seq2;
    int Y;
    int X;
    BOOL stop1;
}

// returns a CCScene that contains the HelloWorldLayer as the only child
+(CCScene *) scene;

@end