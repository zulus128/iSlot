//
//  InfoLayer.m
//  iSlot
//
//  Created by вадим on 2/24/13.
//  Copyright (c) 2013 Zul. All rights reserved.
//

#import "InappLayer.h"

@interface CCLayer (toTop)
-(void) toTop;
@end

@implementation InappLayer

-(id) init {
    
	if( (self=[super init])) {
        
		// ask director for the window size
		//CGSize size = [[CCDirector sharedDirector] winSize];
        self.touchEnabled = YES;

		background = [[CCSprite spriteWithFile:@"CoinsFon.png"] retain];
		background.position = ccp(Xin, Yin);
        background.visible = NO;
		[self addChild: background];
        
		background1 = [[CCSprite spriteWithFile:@"KeysFon.png"] retain];
		background1.position = ccp(Xin, Yin);
        background1.visible = NO;
		[self addChild: background1];
        
        ccheck1 = [[CCSprite spriteWithFile:@"Check.png"] retain];
		ccheck1.position = ccpina1(116, 138, 60, 60);
        ccheck1.visible = NO;
		[self addChild: ccheck1];
        ccheck2 = [[CCSprite spriteWithFile:@"Check.png"] retain];
		ccheck2.position = ccpina1(116, 190, 60, 60);
        ccheck2.visible = NO;
		[self addChild: ccheck2];
        ccheck3 = [[CCSprite spriteWithFile:@"Check.png"] retain];
		ccheck3.position = ccpina1(116, 242, 60, 60);
        ccheck3.visible = NO;
		[self addChild: ccheck3];
        ccheck4 = [[CCSprite spriteWithFile:@"Check.png"] retain];
		ccheck4.position = ccpina1(116, 294, 60, 60);
        ccheck4.visible = NO;
		[self addChild: ccheck4];
        ccheck5 = [[CCSprite spriteWithFile:@"Check.png"] retain];
		ccheck5.position = ccpina1(116, 346, 60, 60);
        ccheck5.visible = NO;
		[self addChild: ccheck5];
        ccheck6 = [[CCSprite spriteWithFile:@"Check.png"] retain];
		ccheck6.position = ccpina1(116, 398, 60, 60);
        ccheck6.visible = NO;
		[self addChild: ccheck6];
        
        kcheck1 = [[CCSprite spriteWithFile:@"Check.png"] retain];
		kcheck1.position = ccpina1(226, 223, 60, 60);
        kcheck1.visible = NO;
		[self addChild: kcheck1];
        kcheck2 = [[CCSprite spriteWithFile:@"Check.png"] retain];
		kcheck2.position = ccpina1(432, 223, 60, 60);
        kcheck2.visible = NO;
		[self addChild: kcheck2];
        kcheck3 = [[CCSprite spriteWithFile:@"Check.png"] retain];
		kcheck3.position = ccpina1(640, 223, 60, 60);
        kcheck3.visible = NO;
		[self addChild: kcheck3];
        kcheck4 = [[CCSprite spriteWithFile:@"Check.png"] retain];
		kcheck4.position = ccpina1(847, 223, 60, 60);
        kcheck4.visible = NO;
		[self addChild: kcheck4];
        kcheck5 = [[CCSprite spriteWithFile:@"Check.png"] retain];
		kcheck5.position = ccpina1(330, 384, 60, 60);
        kcheck5.visible = NO;
		[self addChild: kcheck5];
        kcheck6 = [[CCSprite spriteWithFile:@"Check.png"] retain];
		kcheck6.position = ccpina1(536, 384, 60, 60);
        kcheck6.visible = NO;
		[self addChild: kcheck6];
        kcheck7 = [[CCSprite spriteWithFile:@"Check.png"] retain];
		kcheck7.position = ccpina1(745, 384, 60, 60);
        kcheck7.visible = NO;
		[self addChild: kcheck7];
        
        CCSprite *spclo = [CCSprite spriteWithFile:@"CloseinApp.png"];
        CCSprite *spclo_t1 = [CCSprite spriteWithFile:@"TouchCloseinApp.png"];
		CCMenuItemSprite *itemclo = [CCMenuItemSprite itemWithNormalSprite:spclo selectedSprite:spclo_t1 block:^(id sender) {
            
            [self.player toTop];
            
		}];
        [itemclo setPosition:ccpina(932, 50, 40, 40)];
        
        CCSprite *spbuy = [CCSprite spriteWithFile:@"BuyNow.png"];
        CCSprite *spbuy_t1 = [CCSprite spriteWithFile:@"TouchBuyNow.png"];
		CCMenuItemSprite *itembuy = [CCMenuItemSprite itemWithNormalSprite:spbuy selectedSprite:spbuy_t1 block:^(id sender) {
            
            
		}];
        [itembuy setPosition:ccpina(430, 425, 162, 54)];

        CCSprite *spcoins = [CCSprite spriteWithFile:@"BuyNow.png"];
        CCSprite *spcoins_t1 = [CCSprite spriteWithFile:@"TouchBuyNow.png"];
		CCMenuItemSprite *itemcoins = [CCMenuItemSprite itemWithNormalSprite:spcoins selectedSprite:spcoins_t1 block:^(id sender) {
            
            [self setTab:0];
            
		}];
        [itemcoins setPosition:ccpina(150, 20, 162, 54)];
        itemcoins.scaleX = 1.4f;
        itemcoins.opacity = 0;
        
        CCSprite *spkeys = [CCSprite spriteWithFile:@"BuyNow.png"];
        CCSprite *spkeys_t1 = [CCSprite spriteWithFile:@"TouchBuyNow.png"];
		CCMenuItemSprite *itemkeys = [CCMenuItemSprite itemWithNormalSprite:spkeys selectedSprite:spkeys_t1 block:^(id sender) {
            
            [self setTab:1];
            
		}];
        [itemkeys setPosition:ccpina(385, 20, 162, 54)];
        itemkeys.scaleX = 1.4f;
        itemkeys.opacity = 0;
        
        CCMenu* menu = [CCMenu menuWithItems: itemclo, itembuy, itemcoins, itemkeys, nil];
        [self addChild: menu z:7];
		[menu setPosition:ccp(0, 0)];

        int h = 52;
        
        CCSprite *spcin1 = [CCSprite spriteWithFile:@"BuyNow.png"];
        CCSprite *spcin1_t1 = [CCSprite spriteWithFile:@"TouchBuyNow.png"];
		CCMenuItemSprite *icin1 = [CCMenuItemSprite itemWithNormalSprite:spcin1 selectedSprite:spcin1_t1 block:^(id sender) {
            
            ccheck1.visible = YES;
            ccheck2.visible = NO;
            ccheck3.visible = NO;
            ccheck4.visible = NO;
            ccheck5.visible = NO;
            ccheck6.visible = NO;

		}];
        [icin1 setPosition:ccpina(430, 80 + 0*h, 162, 54)];
        icin1.scaleX = 5.4f;
        icin1.opacity = 0;
        
        CCSprite *spcin2 = [CCSprite spriteWithFile:@"BuyNow.png"];
        CCSprite *spcin2_t1 = [CCSprite spriteWithFile:@"TouchBuyNow.png"];
		CCMenuItemSprite *icin2 = [CCMenuItemSprite itemWithNormalSprite:spcin2 selectedSprite:spcin2_t1 block:^(id sender) {

            ccheck1.visible = NO;
            ccheck2.visible = YES;
            ccheck3.visible = NO;
            ccheck4.visible = NO;
            ccheck5.visible = NO;
            ccheck6.visible = NO;
            
		}];
        [icin2 setPosition:ccpina(430, 80 + 1*h, 162, 54)];
        icin2.scaleX = 5.4f;
        icin2.opacity = 0;

        CCSprite *spcin3 = [CCSprite spriteWithFile:@"BuyNow.png"];
        CCSprite *spcin3_t1 = [CCSprite spriteWithFile:@"TouchBuyNow.png"];
		CCMenuItemSprite *icin3 = [CCMenuItemSprite itemWithNormalSprite:spcin3 selectedSprite:spcin3_t1 block:^(id sender) {
            
            ccheck1.visible = NO;
            ccheck2.visible = NO;
            ccheck3.visible = YES;
            ccheck4.visible = NO;
            ccheck5.visible = NO;
            ccheck6.visible = NO;

		}];
        [icin3 setPosition:ccpina(430, 80 + 2*h, 162, 54)];
        icin3.scaleX = 5.4f;
        icin3.opacity = 0;
        
        CCSprite *spcin4 = [CCSprite spriteWithFile:@"BuyNow.png"];
        CCSprite *spcin4_t1 = [CCSprite spriteWithFile:@"TouchBuyNow.png"];
		CCMenuItemSprite *icin4 = [CCMenuItemSprite itemWithNormalSprite:spcin4 selectedSprite:spcin4_t1 block:^(id sender) {
            
            ccheck1.visible = NO;
            ccheck2.visible = NO;
            ccheck3.visible = NO;
            ccheck4.visible = YES;
            ccheck5.visible = NO;
            ccheck6.visible = NO;

		}];
        [icin4 setPosition:ccpina(430, 80 + 3*h, 162, 54)];
        icin4.scaleX = 5.4f;
        icin4.opacity = 0;
        
        CCSprite *spcin5 = [CCSprite spriteWithFile:@"BuyNow.png"];
        CCSprite *spcin5_t1 = [CCSprite spriteWithFile:@"TouchBuyNow.png"];
		CCMenuItemSprite *icin5 = [CCMenuItemSprite itemWithNormalSprite:spcin5 selectedSprite:spcin5_t1 block:^(id sender) {
            
            ccheck1.visible = NO;
            ccheck2.visible = NO;
            ccheck3.visible = NO;
            ccheck4.visible = NO;
            ccheck5.visible = YES;
            ccheck6.visible = NO;

		}];
        [icin5 setPosition:ccpina(430, 80 + 4*h, 162, 54)];
        icin5.scaleX = 5.4f;
        icin5.opacity = 0;
        
        CCSprite *spcin6 = [CCSprite spriteWithFile:@"BuyNow.png"];
        CCSprite *spcin6_t1 = [CCSprite spriteWithFile:@"TouchBuyNow.png"];
		CCMenuItemSprite *icin6 = [CCMenuItemSprite itemWithNormalSprite:spcin6 selectedSprite:spcin6_t1 block:^(id sender) {
            
            ccheck1.visible = NO;
            ccheck2.visible = NO;
            ccheck3.visible = NO;
            ccheck4.visible = NO;
            ccheck5.visible = NO;
            ccheck6.visible = YES;
            
		}];
        [icin6 setPosition:ccpina(430, 80 + 5*h, 162, 54)];
        icin6.scaleX = 5.4f;
        icin6.opacity = 0;
        
        menucoins = [CCMenu menuWithItems: icin1, icin2, icin3, icin4, icin5, icin6, nil];
        [self addChild: menucoins z:8];
		[menucoins setPosition:ccp(0, 0)];
        
        CCSprite *spkin1 = [CCSprite spriteWithFile:@"BuyNow.png"];
        CCSprite *spkin1_t1 = [CCSprite spriteWithFile:@"TouchBuyNow.png"];
		CCMenuItemSprite *ikin1 = [CCMenuItemSprite itemWithNormalSprite:spkin1 selectedSprite:spkin1_t1 block:^(id sender) {
            
            kcheck1.visible = YES;
            kcheck2.visible = NO;
            kcheck3.visible = NO;
            kcheck4.visible = NO;
            kcheck5.visible = NO;
            kcheck6.visible = NO;
            kcheck7.visible = NO;
            
		}];
        [ikin1 setPosition:ccpina(120, 134, 162, 54)];
        ikin1.scaleY = 2.5f;
        ikin1.opacity = 60;
        
        menukeys = [CCMenu menuWithItems: ikin1, /*ikin2, ikin3, ikin4, ikin5, ikin6, ikin7,*/ nil];
        [self addChild: menukeys z:8];
		[menukeys setPosition:ccp(0, 0)];
        
        
        [self setTab:0];
	}
	
	return self;
}

-(void) setTab:(int) t {
    
    background.visible = (t == 0);
    background1.visible = (t == 1);
    
    if(t == 0) {
        menucoins.enabled = YES;
        menukeys.enabled = NO;
        
        kcheck1.visible = NO;
        kcheck2.visible = NO;
        kcheck3.visible = NO;
        kcheck4.visible = NO;
        kcheck5.visible = NO;
        kcheck6.visible = NO;
        kcheck7.visible = NO;

    }
    else {
        menucoins.enabled = NO;
        menukeys.enabled = YES;

        ccheck1.visible = NO;
        ccheck2.visible = NO;
        ccheck3.visible = NO;
        ccheck4.visible = NO;
        ccheck5.visible = NO;
        ccheck6.visible = NO;

    }

}

- (void)ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:[touch view]];
    NSLog(@"y = %f", point.y);
    if((point.y < (Yin - 255 - 108)) || (point.y > (Yin + 255 - 108)))
        [self.player toTop];
}

- (void) dealloc {

    [background release];
    [background1 release];
    
	[super dealloc];
}


@end
