//
//  Combination.m
//  iSlot
//
//  Created by Zul on 2/18/13.
//  Copyright (c) 2013 Zul. All rights reserved.
//

#import "Combination.h"

@implementation Combination

- (id)initWithLayer:(CCLayer *)lay sprite:(CCSprite*)s line:(int)l count:(int)cn {
    
    self = [super init];
    if (self) {
        
        line = l;
        cnt = cn;
        layer = lay;
        sprite = s;
        
        for(int i = 0; i < cnt; i++) {
            
            cube[i] = [CCSprite spriteWithFile:[NSString stringWithFormat:@"slotStilistik01-%d.png", i]];
            proto[i].position = ccp(-5000, -5000);
            [layer addChild:proto[i] z:2];
        }
    }
    return self;

}
- (void) show {
    
    sprite.position = ccp(513, 418);

}

- (void) hide {

    sprite.position = ccp(-5000, -5000);

}

- (void) dealloc {
    
    [self hide];
    
	[super dealloc];
}

@end
