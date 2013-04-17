//
//  InfoLayer.m
//  iSlot
//
//  Created by вадим on 2/24/13.
//  Copyright (c) 2013 Zul. All rights reserved.
//

#import "InappLayer.h"

@interface InappLayer ()

@end

@implementation InappLayer

-(id) init {
    
	if( (self=[super init])) {
        
		// ask director for the window size
		//CGSize size = [[CCDirector sharedDirector] winSize];
        
		background = [[CCSprite spriteWithFile:@"CoinsFon.png"] retain];
		background.position = ccp(Xin, Yin);
        background.visible = NO;
		[self addChild: background];
        
		background1 = [[CCSprite spriteWithFile:@"KeysFon.png"] retain];
		background1.position = ccp(Xin, Yin);
        background1.visible = NO;
		[self addChild: background1];
        
        CCSprite *spclo = [CCSprite spriteWithFile:@"CloseinApp.png"];
        CCSprite *spclo_t1 = [CCSprite spriteWithFile:@"TouchCloseinApp.png"];
		CCMenuItemSprite *itemclo = [CCMenuItemSprite itemWithNormalSprite:spclo selectedSprite:spclo_t1 block:^(id sender) {
            
            [self runAction:[CCMoveBy actionWithDuration:0.3f position:ccp(1024,0)]];
            
		}];
        [itemclo setPosition:ccpina(932, 50, 40, 40)];
        
        CCSprite *spbuy = [CCSprite spriteWithFile:@"BuyNow.png"];
        CCSprite *spbuy_t1 = [CCSprite spriteWithFile:@"TouchBuyNow.png"];
		CCMenuItemSprite *itembuy = [CCMenuItemSprite itemWithNormalSprite:spbuy selectedSprite:spbuy_t1 block:^(id sender) {
            
            [self runAction:[CCMoveBy actionWithDuration:0.3f position:ccp(1024,0)]];
            
		}];
        [itembuy setPosition:ccpina(430, 425, 162, 54)];
        
        CCMenu* menu = [CCMenu menuWithItems: itemclo, itembuy, nil];
        [self addChild: menu z:7];
		[menu setPosition:ccp(0, 0)];

        [self setTab:0];
	}
	
	return self;
}

-(void) setTab:(int) t {
    
    background.visible = (t == 0);
    background1.visible = (t == 1);

}

- (void) dealloc {

    [background release];
    [background1 release];
    
	[super dealloc];
}


@end
