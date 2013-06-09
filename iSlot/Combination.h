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
    int atindex;
    CCSprite* cube[BARS_CNT];
    NSArray* linepos;
    NSArray* sprites;
    BOOL sent;
}

- (id)initWithLayer:(CCLayer *)lay sprite:(CCSprite*)s line:(int)l count:(int)cn linePos:(NSArray*)lpos sprites:(NSArray*)sprs atIndex:(int)ind;
- (void) show;
- (void) hide;
- (NSArray*) getComb;
@end
