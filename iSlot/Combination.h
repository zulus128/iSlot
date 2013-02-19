//
//  Combination.h
//  iSlot
//
//  Created by Zul on 2/18/13.
//  Copyright (c) 2013 Zul. All rights reserved.
//

#import "cocos2d.h"
#import "Common.h"

@interface Combination : NSObject {
    
    CCLayer * layer;
    CCSprite* sprite;
    int line;
    int cnt;
    CCSprite* cube[BARS_CNT];
    NSArray* linepos;
    NSArray* sprites;
}

- (id)initWithLayer:(CCLayer *)lay sprite:(CCSprite*)s line:(int)l count:(int)cn linePos:(NSArray*)lpos sprites:(NSArray*)sprs;
- (void) show;
- (void) hide;

@end
