//
//  Combination.m
//  iSlot
//
//  Created by Zul on 2/18/13.
//  Copyright (c) 2013 Zul. All rights reserved.
//

#import "Combination.h"

@implementation Combination

- (id)initWithLayer:(CCLayer *)lay sprite:(CCSprite*)s line:(int)l count:(int)cn  linePos:(NSArray*)lpos {
    
    self = [super init];
    if (self) {
        
        line = l;
        cnt = cn;
        layer = lay;
        sprite = s;
        linepos = lpos;
        
//        CGSize size = [[CCDirector sharedDirector] winSize];
//        int y = size.height / 2 - 107;
//        int x = size.width / 2 - 299;

        for(int i = 0; i < cnt; i++) {
            
            cube[i] = [CCSprite spriteWithFile:[NSString stringWithFormat:@"CubeLine%02d.png", (line + 1)]];
            int p = [[linepos objectAtIndex:i] intValue];
//            cube[i].position = ccp(x + (i * 150), y + ((p + 1) * 144));
            cube[i].position = ccp(-5000, -5000);
            [layer addChild:cube[i] z:8];
        }
    }
    return self;

}
- (void) show {
    
    sprite.position = ccp(513, 418);

    CGSize size = [[CCDirector sharedDirector] winSize];
    int y = size.height / 2 - 107;
    int x = size.width / 2 - 299;

    for(int i = 0; i < cnt; i++) {
        
        int p = [[linepos objectAtIndex:i] intValue];
        cube[i].position = ccp(x + (i * 150), y + ((p + 1) * 144));
    }

}

- (void) hide {


    for(int i = 0; i < cnt; i++) {
        
        cube[i].position = ccp(-5000, -5000);
    }

    sprite.position = ccp(-5000, -5000);

}

- (void) dealloc {
    
    [self hide];
    
    for(int i = 0; i < cnt; i++) {
        
        [cube[i] removeFromParent];
    }
    
	[super dealloc];
}

@end
