//
//  ConfirmLayer.m
//  iSlot
//
//  Created by Zul on 6/3/13.
//  Copyright (c) 2013 Zul. All rights reserved.
//

#import "ConfirmLayer.h"

@implementation ConfirmLayer

-(id) initWithColor:(ccColor4B)color {
    
	if( (self=[super initWithColor:color])) {
        
        conffon = [CCSprite spriteWithFile:@"FonAlert01.png"];
		conffon.position = ccp(512, 384);
        conffon.opacity = 0;
		[self addChild: conffon z:20];
        
        CCSprite *spok = [CCSprite spriteWithFile:@"OK.png"];
        CCSprite *spok_t1 = [CCSprite spriteWithFile:@"TouchOK.png"];
        itemok = [CCMenuItemSprite itemWithNormalSprite:spok selectedSprite:spok_t1 block:^(id sender) {
            
            menuconf1.enabled = NO;
            
        }];
		itemok.position = ccp(512, 384 - 50);
        itemok.opacity = 0;
        
        menuconf1 = [CCMenu menuWithItems: itemok, nil];
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

//        self.opacity = 0;
//        self.visible = NO;
    }
    
    return self;

}

- (void) show1 {

//    conffon.scale = 0.1f;
//    [conffon runAction:[CCFadeIn actionWithDuration:ConfDelay]];
//    [conffon runAction:[CCScaleTo actionWithDuration:ConfDelay scale:1.0f]];
//
//    itemok.scale = 0.1f;
//    [itemok runAction:[CCFadeIn actionWithDuration:ConfDelay]];
//    [itemok runAction:[CCScaleTo actionWithDuration:ConfDelay scale:1.0f]];
//
//    labelConf1.scale = 0.1f;
//    [labelConf1 runAction:[CCFadeIn actionWithDuration:ConfDelay]];
//    [labelConf1 runAction:[CCScaleTo actionWithDuration:ConfDelay scale:1.0f]];
//
//    labelConf1_1.scale = 0.1f;
//    [labelConf1_1 runAction:[CCFadeIn actionWithDuration:ConfDelay]];
//    [labelConf1_1 runAction:[CCScaleTo actionWithDuration:ConfDelay scale:1.0f]];
    
//    [self runAction:[CCFadeIn actionWithDuration:ConfDelay]];

//    self.opacity = 255;
    self.visible = YES;
    menuconf1.enabled = YES;

}

@end
