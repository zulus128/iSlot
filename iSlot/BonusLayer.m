//
//  BonusLayer.m
//  iSlot
//
//  Created by Zul on 5/6/13.
//  Copyright (c) 2013 Zul. All rights reserved.
//

#import "BonusLayer.h"

@implementation BonusLayer

-(id) init {
    
	if( (self=[super init])) {
        
		// ask director for the window size
		//CGSize size = [[CCDirector sharedDirector] winSize];

        //        self.touchEnabled = YES;
        
        
        CCSprite *s1 = [CCSprite spriteWithFile:@"ChestClosed.png"];
        CCSprite *s1_t1 = [CCSprite spriteWithFile:@"ChestClosed.png"];
		CCMenuItemSprite *i1 = [CCMenuItemSprite itemWithNormalSprite:s1 selectedSprite:s1_t1 block:^(id sender) {
            
		}];
        [i1 setPosition:ccpbon(453, 179, 119, 125)];
        
        CCMenu* menukeys = [CCMenu menuWithItems: i1, nil];
        [self addChild: menukeys z:8];
		[menukeys setPosition:ccp(0, 0)];

	}
	
	return self;
}

@end
