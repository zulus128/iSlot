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
        
        lck1 = [CCSprite spriteWithFile:@"LockLevel.png"];
        lck1.position = ccp(380, 405);
        lck1.scale = 0.5f;
        lck1.opacity = 0;
        [background addChild:lck1];
        
        lck = [CCSprite spriteWithFile:@"LockLevel.png"];
        lck.position = ccp(610, 405);
        lck.scale = 0.5f;
        lck.opacity = 0;
        [background addChild:lck];
        
        ssl = [ShopSubLayer layerWithColor:ccc4(100, 20, 200, 0) width:775 height:1340];
        ssl.position = ccp(10125, -765);
        [ssl addContent];
        [self addChild:ssl];
        
        cnflay = [ConfirmLayer layerWithColor:ccc4(0, 0, 0, 0)];
        cnflay.sslayer = ssl;
        [self addChild:cnflay];
        
        cnflay1 = [ConfirmLayer1 layerWithColor:ccc4(0, 0, 0, 0)];
        cnflay1.sslayer = ssl;
        [self addChild:cnflay1];
        
        cnflay2 = [ConfirmLayer2 layerWithColor:ccc4(0, 0, 0, 0)];
        cnflay2.sslayer = ssl;
        [self addChild:cnflay2];
        
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
    
    [ssl show];
    
    ssl.player = self.player;
    ssl.shlayer = self;
}

-(void)hide {
    
    if(![Common instance].shopVisible)
        return;
    
    [Common instance].shopVisible = NO;
//    menukeys.enabled = NO;
    
    [background runAction:[CCFadeOut actionWithDuration:DSdelay]];

    [lck runAction:[CCFadeOut actionWithDuration:DSdelay]];
    [lck1 runAction:[CCFadeOut actionWithDuration:DSdelay]];

    [ssl hide];
}

- (void)ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:[touch view]];
    //    NSLog(@"y = %f", point.y);

    if((point.y < 111) || (point.y > 584) || (point.x < 79) || (point.x > 949)) {
        
        [self.player afterShop];
        [self hide];

    }

}

-(void) showConf {
    
    [ssl disable];
    
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

-(void) dealloc {
    
	[super dealloc];
}


@end
