//
//  ConfirmLayer.m
//  iSlot
//
//  Created by Zul on 6/3/13.
//  Copyright (c) 2013 Zul. All rights reserved.
//

#import "ConfirmLayer1.h"

@implementation ConfirmLayer1

-(id) initWithColor:(ccColor4B)color {
    
	if( (self=[super initWithColor:color])) {
        
        conffon = [CCSprite spriteWithFile:@"FonAlert01.png"];
		conffon.position = ccp(512, 384);
        conffon.opacity = 0;
		[self addChild: conffon z:20];
        
//        CCSprite *spok = [CCSprite spriteWithFile:@"OK.png"];
//        CCSprite *spok_t1 = [CCSprite spriteWithFile:@"TouchOK.png"];
//        itemok = [CCMenuItemSprite itemWithNormalSprite:spok selectedSprite:spok_t1 block:^(id sender) {
//            
//            [self.sslayer enable];
//            [self hide1];
//            
//        }];
//		itemok.position = ccp(512, 384 - 50);
//        itemok.opacity = 0;
        
        CCSprite *spok = [CCSprite spriteWithFile:@"buttonCancel.png"];
        CCSprite *spok_t1 = [CCSprite spriteWithFile:@"buttonCancelTouch.png"];
        itemok = [CCMenuItemSprite itemWithNormalSprite:spok selectedSprite:spok_t1 block:^(id sender) {
            
            [self.sslayer enable];
            [self hide1];
            
        }];
		itemok.position = ccp(412, 384 - 50);
        itemok.opacity = 0;
        
        CCSprite *spbuy = [CCSprite spriteWithFile:@"buttonBayCoins.png"];
        CCSprite *spbuy_t1 = [CCSprite spriteWithFile:@"buttonBayCoinsTouch.png"];
        itembuy = [CCMenuItemSprite itemWithNormalSprite:spbuy selectedSprite:spbuy_t1 block:^(id sender) {
            
            [self.sslayer onBuyCoins];
            [self.sslayer enable];
            [self hide1];
            
        }];
		itembuy.position = ccp(612, 384 - 50);
        itembuy.opacity = 0;
        
        menuconf1 = [CCMenu menuWithItems: itemok, itembuy, nil];
        [self addChild: menuconf1 z:21];
        [menuconf1 setPosition:ccp(0, 0)];
        //        menuconf.opacity = 0;
        menuconf1.enabled = NO;
        
        labelConf1 = [CCLabelTTF labelWithString:@"You do not have" fontName:@"Marker Felt" fontSize:44];
		labelConf1.position =  ccp(512 , 384 + 60);
        labelConf1.opacity = 0;
		[self addChild: labelConf1 z:21];
        labelConf1_1 = [CCLabelTTF labelWithString:@"enough coins." fontName:@"Marker Felt" fontSize:44];
		labelConf1_1.position =  ccp(512 , 384 + 10);
        labelConf1_1.opacity = 0;
		[self addChild: labelConf1_1 z:21];
        
    }
    
    return self;
    
}

- (void) show1 {
    
    self.scale = 0.1f;
    [self runAction:[CCScaleTo actionWithDuration:ConfDelay scale:1.0f]];
    
    for ( CCNode* node in self.children ) {
        
        if([node isKindOfClass:[CCMenu class]]) {
            for ( CCMenuItemSprite* node1 in node.children )
                [ node1 runAction:[CCFadeIn actionWithDuration:ConfDelay] ];
        }
        else
            [ node runAction:[CCFadeIn actionWithDuration:ConfDelay] ];
        
        
    }
    
    menuconf1.enabled = YES;
    
}

- (void) hide1 {
    
    [self runAction:[CCScaleTo actionWithDuration:ConfDelay scale:0.1f]];
    
    for ( CCNode* node in self.children ) {
        
        if([node isKindOfClass:[CCMenu class]]) {
            for ( CCMenuItemSprite* node1 in node.children )
                [ node1 runAction:[CCFadeOut actionWithDuration:ConfDelay] ];
        }
        else
            [ node runAction:[CCFadeOut actionWithDuration:ConfDelay] ];
        
        
    }
    
    menuconf1.enabled = NO;
    
}

@end
