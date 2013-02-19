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

}

- (id)initWithLayer:(CCLayer *)lay sprite:(CCSprite*)s line:(int)l count:(int)cn;
- (void) show;
- (void) hide;

@end
