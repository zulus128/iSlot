//
//  BonusLayer.m
//  iSlot
//
//  Created by Zul on 5/6/13.
//  Copyright (c) 2013 Zul. All rights reserved.
//

#import "BonusLayer.h"
#import "Common.h"

@implementation BonusLayer

-(id) init {
    
	if( (self=[super init])) {
        
		// ask director for the window size
		//CGSize size = [[CCDirector sharedDirector] winSize];

        self.touchEnabled = YES;
        
        fon = [CCSprite spriteWithFile:@"FonBonus.png"];
        [self addChild:fon z:0];
		[fon setPosition:ccpbon(177, 122, 670, 426)];
        fon.opacity = 0;

        k1 = [CCSprite spriteWithFile:@"Key.png"];
        [k1 setPosition:ccpbon(515, 281, 60, 38)];
        k1.opacity = 0;
        [self addChild: k1 z:9];
        
        k2 = [CCSprite spriteWithFile:@"Key.png"];
        [k2 setPosition:ccpbon(390, 384, 60, 38)];
        k2.opacity = 0;
        [self addChild: k2 z:9];
        
        k3 = [CCSprite spriteWithFile:@"Key.png"];
        [k3 setPosition:ccpbon(630, 384, 60, 38)];
        k3.opacity = 0;
        [self addChild: k3 z:9];
        
        k4 = [CCSprite spriteWithFile:@"Key.png"];
        [k4 setPosition:ccpbon(267, 476, 60, 38)];
        k4.opacity = 0;
        [self addChild: k4 z:9];
        
        k5 = [CCSprite spriteWithFile:@"Key.png"];
        [k5 setPosition:ccpbon(511, 476, 60, 38)];
        k5.opacity = 0;
        [self addChild: k5 z:9];
        
        k6 = [CCSprite spriteWithFile:@"Key.png"];
        [k6 setPosition:ccpbon(755, 476, 60, 38)];
        k6.opacity = 0;
        [self addChild: k6 z:9];
        
//        CCMenuItem *i1 = [CCMenuItemImage itemFromNormalImage:@"ChestClosed.png" selectedImage:@"ChestClosed.png" target:nil selector:nil];
//        CCMenuItem *ii1 = [CCMenuItemImage itemFromNormalImage:@"ChestOpen.png" selectedImage:@"ChestOpen.png" target:nil selector:nil];
        i1 = [CCMenuItemImage itemWithNormalImage:@"ChestClosed.png" selectedImage:@"ChestClosed.png"];
        ii1 = [CCMenuItemImage itemWithNormalImage:@"ChestOpen.png" selectedImage:@"ChestOpen.png"];
        it1 = [CCMenuItemToggle itemWithTarget:self selector:@selector(chest:) items:i1, ii1, nil];
        [it1 setPosition:ccpbon(453, 179, 119, 125)];
//        it1.opacity = 0;
        it1.tag = 3;
//        [it1 retain];
        l1 = [CCLabelTTF labelWithString:@"3" fontName:@"Marker Felt" fontSize:fsize];
		l1.position =  ccpbon( 515, 281, 60, 38 );
		[self addChild: l1 z:10];
        l1.opacity = 0;
        
        i2 = [CCMenuItemImage itemWithNormalImage:@"ChestClosed.png" selectedImage:@"ChestClosed.png"];
        ii2 = [CCMenuItemImage itemWithNormalImage:@"ChestOpen.png" selectedImage:@"ChestOpen.png"];
        it2 = [CCMenuItemToggle itemWithTarget:self selector:@selector(chest:) items:i2, ii2, nil];
        [it2 setPosition:ccpbon(330, 282, 119, 125)];
//        it2.opacity = 0;
        it2.tag = 2;
        l2 = [CCLabelTTF labelWithString:@"2" fontName:@"Marker Felt" fontSize:fsize];
		l2.position =  ccpbon( 390, 384, 60, 38 );
		[self addChild: l2 z:10];
        l2.opacity = 0;
        
        i3 = [CCMenuItemImage itemWithNormalImage:@"ChestClosed.png" selectedImage:@"ChestClosed.png"];
        ii3 = [CCMenuItemImage itemWithNormalImage:@"ChestOpen.png" selectedImage:@"ChestOpen.png"];
        it3 = [CCMenuItemToggle itemWithTarget:self selector:@selector(chest:) items:i3, ii3, nil];
        [it3 setPosition:ccpbon(570, 282, 119, 125)];
//        it3.opacity = 0;
        it3.tag = 2;
        l3 = [CCLabelTTF labelWithString:@"2" fontName:@"Marker Felt" fontSize:fsize];
		l3.position =  ccpbon( 630, 384, 60, 38 );
		[self addChild: l3 z:10];
        l3.opacity = 0;
        
        i4 = [CCMenuItemImage itemWithNormalImage:@"ChestClosed.png" selectedImage:@"ChestClosed.png"];
        ii4 = [CCMenuItemImage itemWithNormalImage:@"ChestOpen.png" selectedImage:@"ChestOpen.png"];
        it4 = [CCMenuItemToggle itemWithTarget:self selector:@selector(chest:) items:i4, ii4, nil];
        [it4 setPosition:ccpbon(208, 376, 119, 125)];
//        it4.opacity = 0;
        it4.tag = 1;
        l4 = [CCLabelTTF labelWithString:@"1" fontName:@"Marker Felt" fontSize:fsize];
		l4.position =  ccpbon( 267, 476, 60, 38 );
		[self addChild: l4 z:10];
        l4.opacity = 0;
        
        i5 = [CCMenuItemImage itemWithNormalImage:@"ChestClosed.png" selectedImage:@"ChestClosed.png"];
        ii5 = [CCMenuItemImage itemWithNormalImage:@"ChestOpen.png" selectedImage:@"ChestOpen.png"];
        it5 = [CCMenuItemToggle itemWithTarget:self selector:@selector(chest:) items:i5, ii5, nil];
        [it5 setPosition:ccpbon(452, 376, 119, 125)];
//        it5.opacity = 0;
        it5.tag = 1;
        l5 = [CCLabelTTF labelWithString:@"1" fontName:@"Marker Felt" fontSize:fsize];
		l5.position =  ccpbon( 511, 476, 60, 38 );
		[self addChild: l5 z:10];
        l5.opacity = 0;
        
        i6 = [CCMenuItemImage itemWithNormalImage:@"ChestClosed.png" selectedImage:@"ChestClosed.png"];
        ii6 = [CCMenuItemImage itemWithNormalImage:@"ChestOpen.png" selectedImage:@"ChestOpen.png"];
        it6 = [CCMenuItemToggle itemWithTarget:self selector:@selector(chest:) items:i6, ii6, nil];
        [it6 setPosition:ccpbon(696, 376, 119, 125)];
//        it6.opacity = 0;
        it6.tag = 1;
        l6 = [CCLabelTTF labelWithString:@"1" fontName:@"Marker Felt" fontSize:fsize];
		l6.position =  ccpbon( 755, 476, 60, 38 );
		[self addChild: l6 z:10];
        l6.opacity = 0;
        
        menukeys = [CCMenu menuWithItems: it1, it2, it3, it4, it5, it6, nil];
        [self addChild: menukeys z:8];
		[menukeys setPosition:ccp(0, 0)];
        
        CCSprite *spclo = [CCSprite spriteWithFile:@"CloseinApp.png"];
        CCSprite *spclo_t1 = [CCSprite spriteWithFile:@"TouchCloseinApp.png"];
		itemclo = [CCMenuItemSprite itemWithNormalSprite:spclo selectedSprite:spclo_t1 block:^(id sender) {
            
            [self performSelector:@selector(end) withObject:nil afterDelay:0.0f];
            
		}];
        [itemclo setPosition:ccp(842, 612)];
        itemclo.opacity = 0;
        
        CCMenu* menu = [CCMenu menuWithItems: itemclo, nil];
        [self addChild: menu z:7];
		[menu setPosition:ccp(0, 0)];

	}
	
	return self;
}

-(void) updateChests {

    int k = [Common instance].keys;
    [it1 setIsEnabled:it1.isEnabled&&(k >= 3)&&(opened < 2)];
    [it2 setIsEnabled:it2.isEnabled&&(k >= 2)&&(opened < 2)];
    [it3 setIsEnabled:it3.isEnabled&&(k >= 2)&&(opened < 2)];
    [it4 setIsEnabled:it4.isEnabled&&(k >= 1)&&(opened < 2)];
    [it5 setIsEnabled:it5.isEnabled&&(k >= 1)&&(opened < 2)];
    [it6 setIsEnabled:it6.isEnabled&&(k >= 1)&&(opened < 2)];
}

-(void)chest:(CCMenuItemToggle*)sender {
    
    [sender setIsEnabled:NO];
    
    [Common instance].keys -= sender.tag;
    [self.player refreshLabels];
    
    opened++;
    
    [self updateChests];
    
    if(opened > 1)
        [self performSelector:@selector(end) withObject:nil afterDelay:2.0f];
}

-(void)end {

    [self.player afterBonus];
}

-(void)show {
    
    opened = 0;
    menukeys.enabled = YES;
    self.touchEnabled = YES;

    showed = YES;
    
    fon.opacity = 0;
    [fon runAction:[CCFadeIn actionWithDuration:Ddelay]];
    k1.opacity = 0;
    k2.opacity = 0;
    k3.opacity = 0;
    k4.opacity = 0;
    k5.opacity = 0;
    k6.opacity = 0;
    [k1 runAction:[CCFadeIn actionWithDuration:Ddelay]];
    [k2 runAction:[CCFadeIn actionWithDuration:Ddelay]];
    [k3 runAction:[CCFadeIn actionWithDuration:Ddelay]];
    [k4 runAction:[CCFadeIn actionWithDuration:Ddelay]];
    [k5 runAction:[CCFadeIn actionWithDuration:Ddelay]];
    [k6 runAction:[CCFadeIn actionWithDuration:Ddelay]];
//    it1.opacity = 0;
//    it2.opacity = 0;
//    it3.opacity = 0;
//    it4.opacity = 0;
//    it5.opacity = 0;
//    it6.opacity = 0;
    i1.opacity = 0;
    ii1.opacity = 0;
    i2.opacity = 0;
    ii2.opacity = 0;
    i3.opacity = 0;
    ii3.opacity = 0;
    i4.opacity = 0;
    ii4.opacity = 0;
    i5.opacity = 0;
    ii4.opacity = 0;
    i6.opacity = 0;
    ii6.opacity = 0;
    it1.selectedIndex = 0;
    it2.selectedIndex = 0;
    it3.selectedIndex = 0;
    it4.selectedIndex = 0;
    it5.selectedIndex = 0;
    it6.selectedIndex = 0;
//    [it1 runAction:[CCFadeIn actionWithDuration:Ddelay]];
//    [it2 runAction:[CCFadeIn actionWithDuration:Ddelay]];
//    [it3 runAction:[CCFadeIn actionWithDuration:Ddelay]];
//    [it4 runAction:[CCFadeIn actionWithDuration:Ddelay]];
//    [it5 runAction:[CCFadeIn actionWithDuration:Ddelay]];
//    [it6 runAction:[CCFadeIn actionWithDuration:Ddelay]];
    [i1 runAction:[CCFadeIn actionWithDuration:Ddelay]];
    [ii1 runAction:[CCFadeIn actionWithDuration:Ddelay]];
    [i2 runAction:[CCFadeIn actionWithDuration:Ddelay]];
    [ii2 runAction:[CCFadeIn actionWithDuration:Ddelay]];
    [i3 runAction:[CCFadeIn actionWithDuration:Ddelay]];
    [ii3 runAction:[CCFadeIn actionWithDuration:Ddelay]];
    [i4 runAction:[CCFadeIn actionWithDuration:Ddelay]];
    [ii4 runAction:[CCFadeIn actionWithDuration:Ddelay]];
    [i5 runAction:[CCFadeIn actionWithDuration:Ddelay]];
    [ii5 runAction:[CCFadeIn actionWithDuration:Ddelay]];
    [i6 runAction:[CCFadeIn actionWithDuration:Ddelay]];
    [ii6 runAction:[CCFadeIn actionWithDuration:Ddelay]];
    
    [it1 setIsEnabled:YES];
    [it2 setIsEnabled:YES];
    [it3 setIsEnabled:YES];
    [it4 setIsEnabled:YES];
    [it5 setIsEnabled:YES];
    [it6 setIsEnabled:YES];
    l1.opacity = 0;
    l2.opacity = 0;
    l3.opacity = 0;
    l4.opacity = 0;
    l5.opacity = 0;
    l6.opacity = 0;
    [l1 runAction:[CCFadeIn actionWithDuration:Ddelay]];
    [l2 runAction:[CCFadeIn actionWithDuration:Ddelay]];
    [l3 runAction:[CCFadeIn actionWithDuration:Ddelay]];
    [l4 runAction:[CCFadeIn actionWithDuration:Ddelay]];
    [l5 runAction:[CCFadeIn actionWithDuration:Ddelay]];
    [l6 runAction:[CCFadeIn actionWithDuration:Ddelay]];

    itemclo.opacity = 0;
    [itemclo runAction:[CCFadeIn actionWithDuration:Ddelay]];

    [self updateChests];

}

-(void)hide {
    
    menukeys.enabled = NO;

    self.touchEnabled = NO;
    
    showed = NO;
    
    [fon runAction:[CCFadeOut actionWithDuration:Ddelay]];
    [k1 runAction:[CCFadeOut actionWithDuration:Ddelay]];
    [k2 runAction:[CCFadeOut actionWithDuration:Ddelay]];
    [k3 runAction:[CCFadeOut actionWithDuration:Ddelay]];
    [k4 runAction:[CCFadeOut actionWithDuration:Ddelay]];
    [k5 runAction:[CCFadeOut actionWithDuration:Ddelay]];
    [k6 runAction:[CCFadeOut actionWithDuration:Ddelay]];
//    [it1 runAction:[CCFadeOut actionWithDuration:Ddelay]];
//    [it2 runAction:[CCFadeOut actionWithDuration:Ddelay]];
//    [it3 runAction:[CCFadeOut actionWithDuration:Ddelay]];
//    [it4 runAction:[CCFadeOut actionWithDuration:Ddelay]];
//    [it5 runAction:[CCFadeOut actionWithDuration:Ddelay]];
//    [it6 runAction:[CCFadeOut actionWithDuration:Ddelay]];
    [i1 runAction:[CCFadeOut actionWithDuration:Ddelay]];
    [ii1 runAction:[CCFadeOut actionWithDuration:Ddelay]];
    [i2 runAction:[CCFadeOut actionWithDuration:Ddelay]];
    [ii2 runAction:[CCFadeOut actionWithDuration:Ddelay]];
    [i3 runAction:[CCFadeOut actionWithDuration:Ddelay]];
    [ii3 runAction:[CCFadeOut actionWithDuration:Ddelay]];
    [i4 runAction:[CCFadeOut actionWithDuration:Ddelay]];
    [ii4 runAction:[CCFadeOut actionWithDuration:Ddelay]];
    [i5 runAction:[CCFadeOut actionWithDuration:Ddelay]];
    [ii5 runAction:[CCFadeOut actionWithDuration:Ddelay]];
    [i6 runAction:[CCFadeOut actionWithDuration:Ddelay]];
    [ii6 runAction:[CCFadeOut actionWithDuration:Ddelay]];

    [l1 runAction:[CCFadeOut actionWithDuration:Ddelay]];
    [l2 runAction:[CCFadeOut actionWithDuration:Ddelay]];
    [l3 runAction:[CCFadeOut actionWithDuration:Ddelay]];
    [l4 runAction:[CCFadeOut actionWithDuration:Ddelay]];
    [l5 runAction:[CCFadeOut actionWithDuration:Ddelay]];
    [l6 runAction:[CCFadeOut actionWithDuration:Ddelay]];

    [itemclo runAction:[CCFadeOut actionWithDuration:Ddelay]];

}

- (void)ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:[touch view]];
    
    NSLog(@"y = %f, x = %f", point.y, point.x);
    
    if((point.y < 144) || (point.y > 553) || (point.x < 182) || (point.x > 846))
        if(showed)
            [self.player toTop];
}

@end
