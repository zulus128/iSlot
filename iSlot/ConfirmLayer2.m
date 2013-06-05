//
//  ConfirmLayer.m
//  iSlot
//
//  Created by Zul on 6/3/13.
//  Copyright (c) 2013 Zul. All rights reserved.
//

#import "ConfirmLayer2.h"

@implementation ConfirmLayer2

-(id) initWithColor:(ccColor4B)color {
    
	if( (self=[super initWithColor:color])) {
        
        CCSprite *spno1 = [CCSprite spriteWithFile:@"No.png"];
        CCSprite *spno1_t1 = [CCSprite spriteWithFile:@"TouchNo.png"];
        itemno1 = [CCMenuItemSprite itemWithNormalSprite:spno1 selectedSprite:spno1_t1 block:^(id sender) {
            
            [self.sslayer enable];
            [self hide1];
            
        }];
        
		itemno1.position = ccp(Xsh - 90, Ysh - 70);
        itemno1.opacity = 0;
        
        CCSprite *spyes1 = [CCSprite spriteWithFile:@"Yes.png"];
        CCSprite *spyes1_t1 = [CCSprite spriteWithFile:@"TouchYes.png"];
        itemyes1 = [CCMenuItemSprite itemWithNormalSprite:spyes1 selectedSprite:spyes1_t1 block:^(id sender) {
            
            [self.sslayer onConfirmed];
            [self.sslayer enable];
            [self hide1];
            
        }];
		itemyes1.position = ccp(512 + 90, 384 - 70);
        itemyes1.opacity = 0;
        
        menuconf2 = [CCMenu menuWithItems: itemno1, itemyes1, nil];
        [self addChild: menuconf2 z:21];
        [menuconf2 setPosition:ccp(0, 0)];
        //        menuconf.opacity = 0;
        menuconf2.enabled = NO;
        
        labelConf2 = [CCLabelTTF labelWithString:@"After the purchase ensures" fontName:@"Marker Felt" fontSize:44];
		labelConf2.position =  ccp(512 , 384 + 90);
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
    
    menuconf2.enabled = YES;
    
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
    
    menuconf2.enabled = NO;
    
}

@end
