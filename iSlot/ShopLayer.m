//
//  InfoLayer.m
//  iSlot
//
//  Created by вадим on 2/24/13.
//  Copyright (c) 2013 Zul. All rights reserved.
//

#import "ShopLayer.h"
#import "Common.h"
#import "ConfirmLayer.h"
#import "ConfirmLayer1.h"
#import "ConfirmLayer2.h"

//static ConfirmLayer* cnflay;

@implementation ShopLayer

-(id) init {
    
	if( (self=[super init])) {
        
//        CGSize size = [[CCDirector sharedDirector] winSize];
        self.touchEnabled = YES;

		background = [CCSprite spriteWithFile:@"FonShopLine.png"];
		background.position = ccp(Xsh, Ysh);
        background.opacity = 0;
		[self addChild: background];
        
		background1 = [CCSprite spriteWithFile:@"luckShopButton.png"];
		background1.position = ccpshop1(162, 147, 480, 65);
//        background1.opacity = 0;
        background1.visible = NO;
		[self addChild: background1];
        
//        lck1 = [CCSprite spriteWithFile:@"LockLevel.png"];
//        lck1.position = ccp(380, 405);
//        lck1.scale = 0.5f;
//        lck1.opacity = 0;
//        [background addChild:lck1];
        
        
        lck = [CCSprite spriteWithFile:@"LockLevel.png"];
        lck.position = ccp(610, 405);
        lck.scale = 0.5f;
        lck.opacity = 0;
        [background addChild:lck];
        
        ssl = [ShopSubLayer layerWithColor:ccc4(100, 20, 200, 0) width:775 height:1340];
        [ssl retain];
        ssl.position = ccp(10125, -765);
        [ssl addContent];
        [self addChild:ssl];
        
        slsl = [ShopLuckSubLayer layerWithColor:ccc4(100, 20, 200, 0) width:775 height:1340];
        [slsl retain];
        slsl.position = ccp(0, 0);
        [slsl addContent];
        [self addChild:slsl];
        
        cnflay = [ConfirmLayer layerWithColor:ccc4(0, 0, 0, 0)];
        cnflay.sslayer = ssl;
        [self addChild:cnflay];
        
        cnflay1 = [ConfirmLayer1 layerWithColor:ccc4(0, 0, 0, 0)];
        cnflay1.sslayer = ssl;
        [self addChild:cnflay1];
        
        cnflay2 = [ConfirmLayer2 layerWithColor:ccc4(0, 0, 0, 0)];
        cnflay2.sslayer = ssl;
        [self addChild:cnflay2];
        
        CCSprite *spclo = [CCSprite spriteWithFile:@"CloseinApp.png"];
        CCSprite *spclo_t1 = [CCSprite spriteWithFile:@"TouchCloseinApp.png"];
		itemclo = [CCMenuItemSprite itemWithNormalSprite:spclo selectedSprite:spclo_t1 block:^(id sender) {
            
            [self.player afterShop];
            [self hide];
            
		}];
        [itemclo setPosition:ccp(942, 658)];
        itemclo.opacity = 0;

        CCMenu* menu = [CCMenu menuWithItems: itemclo, nil];
        [self addChild: menu z:7];
		[menu setPosition:ccp(0, 0)];

	}
	
	return self;
}

-(void)show {
    
//    menukeys.enabled = YES;
    [Common instance].shopVisible = YES;

    background.opacity = 0;
    [background runAction:[CCFadeIn actionWithDuration:DSdelay]];
    
    lck.opacity = 0;
    [lck runAction:[CCFadeIn actionWithDuration:DSdelay]];
    lck1.opacity = 0;
    [lck1 runAction:[CCFadeIn actionWithDuration:DSdelay]];

    itemclo.opacity = 0;
    [itemclo runAction:[CCFadeIn actionWithDuration:DSdelay]];
    
    [ssl show];
    
    ssl.player = self.player;
    ssl.shlayer = self;
    slsl.player = self.player;
    slsl.shlayer = self;
    
    luck = NO;
    background1.visible = NO;
    background1.opacity = 255;
//    [self addChild:slsl];
//    [self addChild:ssl];

//    [slsl hide];

}

-(void)hide {
    
    
    if(![Common instance].shopVisible)
        return;
    
    [Common instance].shopVisible = NO;
//    menukeys.enabled = NO;
    
    [background runAction:[CCFadeOut actionWithDuration:DSdelay]];

    if(luck) {

        [background1 runAction:[CCFadeOut actionWithDuration:DSdelay]];
        [slsl hide];
    }

    [lck runAction:[CCFadeOut actionWithDuration:DSdelay]];
    [lck1 runAction:[CCFadeOut actionWithDuration:DSdelay]];

    [itemclo runAction:[CCFadeOut actionWithDuration:DSdelay]];

    [ssl hide];
}

- (void)ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:[touch view]];
    
//        NSLog(@"x = %f y = %f",point.x, point.y);

    if((point.y < 194) && (point.y > 155) && (point.x < 626) && (point.x > 401))
        if([Common instance].shopVisible) {

            background1.visible = YES;
            luck = YES;
//            NSLog(@"luck = YES");

            [ssl hide];
            [slsl show];

//            [self removeChild:ssl];
//            [self addChild:slsl];
        }
    
    if((point.y < 194) && (point.y > 155) && (point.x < 398) && (point.x > 170))
        if([Common instance].shopVisible) {
            
            background1.visible = NO;
            luck = NO;
//            NSLog(@"luck = NO");

            [slsl hide];
            [ssl show];

//            [self removeChild:slsl];
//            [self addChild:ssl];

        }

    if((point.y < 111) || (point.y > 584) || (point.x < 79) || (point.x > 949))
        if([Common instance].shopVisible)
        {
            
            [self.player afterShop];
            [self hide];
            
        }

}

-(void) showConf {
    
    [ssl disable];
    
    [cnflay setText:@"You want to buy Line?"];
    [cnflay show1];

}

-(void) showConf1 {
    
    [ssl disable];
    
    [cnflay1 show1];
    
}

-(void) showConf2 {
    
    [ssl disable];
    
    [cnflay2 show1];
    
}

-(void) showConfLuck {
    
    [cnflay setText:@"You want to buy Luck?"];
    [cnflay show1];
    
}

-(void) dealloc {
    
	[super dealloc];
    
    [ssl release];
    [slsl release];
    
}


@end
