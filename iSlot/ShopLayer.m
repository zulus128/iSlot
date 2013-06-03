//
//  InfoLayer.m
//  iSlot
//
//  Created by вадим on 2/24/13.
//  Copyright (c) 2013 Zul. All rights reserved.
//

#import "ShopLayer.h"
#import "Common.h"

@implementation ShopLayer

-(id) init {
    
	if( (self=[super init])) {
        
//        CGSize size = [[CCDirector sharedDirector] winSize];
        self.touchEnabled = YES;

		background = [CCSprite spriteWithFile:@"FonShopLine.png"];
		background.position = ccp(Xsh, Ysh);
        background.opacity = 0;
		[self addChild: background];
        
		conffon = [CCSprite spriteWithFile:@"FonAlert01.png"];
		conffon.position = ccp(Xsh, Ysh);
        conffon.opacity = 0;
		[self addChild: conffon z:20];
        
		conffon1 = [CCSprite spriteWithFile:@"FonAlert02.png"];
		conffon1.position = ccp(Xsh, Ysh);
        conffon1.opacity = 0;
		[self addChild: conffon1 z:20];
        
        ssl = [ShopSubLayer layerWithColor:ccc4(100, 20, 200, 0) width:775 height:1340];
        ssl.position = ccp(125, -765);
        [ssl addContent];
        [self addChild:ssl];
        
        CCSprite *spno = [CCSprite spriteWithFile:@"No.png"];
        CCSprite *spno_t1 = [CCSprite spriteWithFile:@"TouchNo.png"];
        itemno = [CCMenuItemSprite itemWithNormalSprite:spno selectedSprite:spno_t1 block:^(id sender) {

            [ssl enable];
            [conffon runAction:[CCFadeOut actionWithDuration:ConfDelay]];
            [conffon runAction:[CCScaleTo actionWithDuration:ConfDelay scale:0.1f]];
            
            [itemyes runAction:[CCFadeOut actionWithDuration:ConfDelay]];
            [itemyes runAction:[CCScaleTo actionWithDuration:ConfDelay scale:0.1f]];
            
            [itemno runAction:[CCFadeOut actionWithDuration:ConfDelay]];
            [itemno runAction:[CCScaleTo actionWithDuration:ConfDelay scale:0.1f]];
            
            [labelConf runAction:[CCFadeOut actionWithDuration:ConfDelay]];
            [labelConf runAction:[CCScaleTo actionWithDuration:ConfDelay scale:0.1f]];
            
            menuconf.enabled = NO;

        }];
        
		itemno.position = ccp(Xsh - 90, Ysh - 50);
        itemno.opacity = 0;
        
        CCSprite *spyes = [CCSprite spriteWithFile:@"Yes.png"];
        CCSprite *spyes_t1 = [CCSprite spriteWithFile:@"TouchYes.png"];
        itemyes = [CCMenuItemSprite itemWithNormalSprite:spyes selectedSprite:spyes_t1 block:^(id sender) {
        
            [ssl onConfirmed];
            [ssl enable];
            [conffon runAction:[CCFadeOut actionWithDuration:ConfDelay]];
            [conffon runAction:[CCScaleTo actionWithDuration:ConfDelay scale:0.1f]];
            
            [itemyes runAction:[CCFadeOut actionWithDuration:ConfDelay]];
            [itemyes runAction:[CCScaleTo actionWithDuration:ConfDelay scale:0.1f]];
            
            [itemno runAction:[CCFadeOut actionWithDuration:ConfDelay]];
            [itemno runAction:[CCScaleTo actionWithDuration:ConfDelay scale:0.1f]];
            
            [labelConf runAction:[CCFadeOut actionWithDuration:ConfDelay]];
            [labelConf runAction:[CCScaleTo actionWithDuration:ConfDelay scale:0.1f]];
            
            menuconf.enabled = NO;

        }];
		itemyes.position = ccp(Xsh + 90, Ysh - 50);
        itemyes.opacity = 0;

        menuconf = [CCMenu menuWithItems: itemno, itemyes, nil];
        [self addChild: menuconf z:21];
        [menuconf setPosition:ccp(0, 0)];
//        menuconf.opacity = 0;
        menuconf.enabled = NO;

        labelConf = [CCLabelTTF labelWithString:@"You want to buy Line?" fontName:@"Marker Felt" fontSize:44];
		labelConf.position =  ccp(Xsh , Ysh + 30);
        labelConf.opacity = 0;
		[self addChild: labelConf z:21];
        
        CCSprite *spok = [CCSprite spriteWithFile:@"OK.png"];
        CCSprite *spok_t1 = [CCSprite spriteWithFile:@"TouchOK.png"];
        itemok = [CCMenuItemSprite itemWithNormalSprite:spok selectedSprite:spok_t1 block:^(id sender) {
            
            [ssl enable];
            [conffon runAction:[CCFadeOut actionWithDuration:ConfDelay]];
            [conffon runAction:[CCScaleTo actionWithDuration:ConfDelay scale:0.1f]];
            
            [itemok runAction:[CCFadeOut actionWithDuration:ConfDelay]];
            [itemok runAction:[CCScaleTo actionWithDuration:ConfDelay scale:0.1f]];

            [labelConf1 runAction:[CCFadeOut actionWithDuration:ConfDelay]];
            [labelConf1 runAction:[CCScaleTo actionWithDuration:ConfDelay scale:0.1f]];
            
            [labelConf1_1 runAction:[CCFadeOut actionWithDuration:ConfDelay]];
            [labelConf1_1 runAction:[CCScaleTo actionWithDuration:ConfDelay scale:0.1f]];
            
            menuconf1.enabled = NO;
            
        }];
		itemok.position = ccp(Xsh, Ysh - 50);
        itemok.opacity = 0;
        
        menuconf1 = [CCMenu menuWithItems: itemok, nil];
        [self addChild: menuconf1 z:21];
        [menuconf1 setPosition:ccp(0, 0)];
        //        menuconf.opacity = 0;
        menuconf1.enabled = NO;
        
        labelConf1 = [CCLabelTTF labelWithString:@"You do not have" fontName:@"Marker Felt" fontSize:44];
		labelConf1.position =  ccp(Xsh , Ysh + 60);
        labelConf1.opacity = 0;
		[self addChild: labelConf1 z:21];
        labelConf1_1 = [CCLabelTTF labelWithString:@"enough coins." fontName:@"Marker Felt" fontSize:44];
		labelConf1_1.position =  ccp(Xsh , Ysh + 10);
        labelConf1_1.opacity = 0;
		[self addChild: labelConf1_1 z:21];

        CCSprite *spno1 = [CCSprite spriteWithFile:@"No.png"];
        CCSprite *spno1_t1 = [CCSprite spriteWithFile:@"TouchNo.png"];
        itemno1 = [CCMenuItemSprite itemWithNormalSprite:spno1 selectedSprite:spno1_t1 block:^(id sender) {
            
            [ssl enable];
            [conffon1 runAction:[CCFadeOut actionWithDuration:ConfDelay]];
            [conffon1 runAction:[CCScaleTo actionWithDuration:ConfDelay scale:0.1f]];
            
            [itemyes1 runAction:[CCFadeOut actionWithDuration:ConfDelay]];
            [itemyes1 runAction:[CCScaleTo actionWithDuration:ConfDelay scale:0.1f]];
            
            [itemno1 runAction:[CCFadeOut actionWithDuration:ConfDelay]];
            [itemno1 runAction:[CCScaleTo actionWithDuration:ConfDelay scale:0.1f]];
            
            [labelConf2 runAction:[CCFadeOut actionWithDuration:ConfDelay]];
            [labelConf2 runAction:[CCScaleTo actionWithDuration:ConfDelay scale:0.1f]];
            [labelConf2_1 runAction:[CCFadeOut actionWithDuration:ConfDelay]];
            [labelConf2_1 runAction:[CCScaleTo actionWithDuration:ConfDelay scale:0.1f]];
            [labelConf2_2 runAction:[CCFadeOut actionWithDuration:ConfDelay]];
            [labelConf2_2 runAction:[CCScaleTo actionWithDuration:ConfDelay scale:0.1f]];
            
            menuconf2.enabled = NO;
            
        }];
        
		itemno1.position = ccp(Xsh - 90, Ysh - 70);
        itemno1.opacity = 0;
        
        CCSprite *spyes1 = [CCSprite spriteWithFile:@"Yes.png"];
        CCSprite *spyes1_t1 = [CCSprite spriteWithFile:@"TouchYes.png"];
        itemyes1 = [CCMenuItemSprite itemWithNormalSprite:spyes1 selectedSprite:spyes1_t1 block:^(id sender) {
            
            [ssl onConfirmed];
            [ssl enable];
            [conffon1 runAction:[CCFadeOut actionWithDuration:ConfDelay]];
            [conffon1 runAction:[CCScaleTo actionWithDuration:ConfDelay scale:0.1f]];
            
            [itemyes1 runAction:[CCFadeOut actionWithDuration:ConfDelay]];
            [itemyes1 runAction:[CCScaleTo actionWithDuration:ConfDelay scale:0.1f]];
            
            [itemno1 runAction:[CCFadeOut actionWithDuration:ConfDelay]];
            [itemno1 runAction:[CCScaleTo actionWithDuration:ConfDelay scale:0.1f]];
            
            [labelConf2 runAction:[CCFadeOut actionWithDuration:ConfDelay]];
            [labelConf2 runAction:[CCScaleTo actionWithDuration:ConfDelay scale:0.1f]];
            [labelConf2_1 runAction:[CCFadeOut actionWithDuration:ConfDelay]];
            [labelConf2_1 runAction:[CCScaleTo actionWithDuration:ConfDelay scale:0.1f]];
            [labelConf2_2 runAction:[CCFadeOut actionWithDuration:ConfDelay]];
            [labelConf2_2 runAction:[CCScaleTo actionWithDuration:ConfDelay scale:0.1f]];
            
            menuconf2.enabled = NO;
            
        }];
		itemyes1.position = ccp(Xsh + 90, Ysh - 70);
        itemyes1.opacity = 0;
        
        menuconf2 = [CCMenu menuWithItems: itemno1, itemyes1, nil];
        [self addChild: menuconf2 z:21];
        [menuconf2 setPosition:ccp(0, 0)];
        //        menuconf.opacity = 0;
        menuconf2.enabled = NO;
        
        labelConf2 = [CCLabelTTF labelWithString:@"After the purchase ensures" fontName:@"Marker Felt" fontSize:44];
		labelConf2.position =  ccp(Xsh , Ysh + 90);
        labelConf2.opacity = 0;
		[self addChild: labelConf2 z:21];
        labelConf2_1 = [CCLabelTTF labelWithString:@"you have least 250 coins." fontName:@"Marker Felt" fontSize:44];
		labelConf2_1.position =  ccp(Xsh , Ysh + 45);
        labelConf2_1.opacity = 0;
		[self addChild: labelConf2_1 z:21];
        labelConf2_2 = [CCLabelTTF labelWithString:@"Continue shopping?" fontName:@"Marker Felt" fontSize:44];
		labelConf2_2.position =  ccp(Xsh , Ysh + 0);
        labelConf2_2.opacity = 0;
		[self addChild: labelConf2_2 z:21];

	}
	
	return self;
}

-(void)show {
    
//    menukeys.enabled = YES;
    [Common instance].shopVisible = YES;

    background.opacity = 0;
    [background runAction:[CCFadeIn actionWithDuration:DSdelay]];

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
    conffon.scale = 0.1f;
    [conffon runAction:[CCFadeIn actionWithDuration:ConfDelay]];
    [conffon runAction:[CCScaleTo actionWithDuration:ConfDelay scale:1.0f]];
    
    itemyes.scale = 0.1f;
    [itemyes runAction:[CCFadeIn actionWithDuration:ConfDelay]];
    [itemyes runAction:[CCScaleTo actionWithDuration:ConfDelay scale:1.0f]];
    
    itemno.scale = 0.1f;
    [itemno runAction:[CCFadeIn actionWithDuration:ConfDelay]];
    [itemno runAction:[CCScaleTo actionWithDuration:ConfDelay scale:1.0f]];
    
    labelConf.scale = 0.1f;
    [labelConf runAction:[CCFadeIn actionWithDuration:ConfDelay]];
    [labelConf runAction:[CCScaleTo actionWithDuration:ConfDelay scale:1.0f]];
    
    menuconf.enabled = YES;
}

-(void) showConf1 {
    
    [ssl disable];
    conffon.scale = 0.1f;
    [conffon runAction:[CCFadeIn actionWithDuration:ConfDelay]];
    [conffon runAction:[CCScaleTo actionWithDuration:ConfDelay scale:1.0f]];
    
    itemok.scale = 0.1f;
    [itemok runAction:[CCFadeIn actionWithDuration:ConfDelay]];
    [itemok runAction:[CCScaleTo actionWithDuration:ConfDelay scale:1.0f]];
    
    labelConf1.scale = 0.1f;
    [labelConf1 runAction:[CCFadeIn actionWithDuration:ConfDelay]];
    [labelConf1 runAction:[CCScaleTo actionWithDuration:ConfDelay scale:1.0f]];
    
    labelConf1_1.scale = 0.1f;
    [labelConf1_1 runAction:[CCFadeIn actionWithDuration:ConfDelay]];
    [labelConf1_1 runAction:[CCScaleTo actionWithDuration:ConfDelay scale:1.0f]];
    
    menuconf1.enabled = YES;
}

-(void) showConf2 {

    [ssl disable];
    conffon1.scale = 0.1f;
    [conffon1 runAction:[CCFadeIn actionWithDuration:ConfDelay]];
    [conffon1 runAction:[CCScaleTo actionWithDuration:ConfDelay scale:1.0f]];
    
    itemyes1.scale = 0.1f;
    [itemyes1 runAction:[CCFadeIn actionWithDuration:ConfDelay]];
    [itemyes1 runAction:[CCScaleTo actionWithDuration:ConfDelay scale:1.0f]];
    
    itemno1.scale = 0.1f;
    [itemno1 runAction:[CCFadeIn actionWithDuration:ConfDelay]];
    [itemno1 runAction:[CCScaleTo actionWithDuration:ConfDelay scale:1.0f]];
    
    labelConf2.scale = 0.1f;
    [labelConf2 runAction:[CCFadeIn actionWithDuration:ConfDelay]];
    [labelConf2 runAction:[CCScaleTo actionWithDuration:ConfDelay scale:1.0f]];
    labelConf2_1.scale = 0.1f;
    [labelConf2_1 runAction:[CCFadeIn actionWithDuration:ConfDelay]];
    [labelConf2_1 runAction:[CCScaleTo actionWithDuration:ConfDelay scale:1.0f]];
    labelConf2_2.scale = 0.1f;
    [labelConf2_2 runAction:[CCFadeIn actionWithDuration:ConfDelay]];
    [labelConf2_2 runAction:[CCScaleTo actionWithDuration:ConfDelay scale:1.0f]];
    
    menuconf2.enabled = YES;

}

-(void) dealloc {
    
	[super dealloc];
}


@end
