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
        
        CCSprite *spno = [CCSprite spriteWithFile:@"No.png"];
        CCSprite *spno_t1 = [CCSprite spriteWithFile:@"TouchNo.png"];
        itemno = [CCMenuItemSprite itemWithNormalSprite:spno selectedSprite:spno_t1 block:^(id sender) {
            
            [self.sslayer enable];
            [self hide1];
            
        }];
        
		itemno.position = ccp(512 - 90, 384 - 50);
        itemno.opacity = 0;
        
        CCSprite *spyes = [CCSprite spriteWithFile:@"Yes.png"];
        CCSprite *spyes_t1 = [CCSprite spriteWithFile:@"TouchYes.png"];
        itemyes = [CCMenuItemSprite itemWithNormalSprite:spyes selectedSprite:spyes_t1 block:^(id sender) {
            
            [self.sslayer onConfirmed];
            [self.sslayer enable];
            [self hide1];

        }];
		itemyes.position = ccp(512 + 90, 384 - 50);
        itemyes.opacity = 0;
        
        menuconf = [CCMenu menuWithItems: itemno, itemyes, nil];
        [self addChild: menuconf z:21];
        [menuconf setPosition:ccp(0, 0)];
        //        menuconf.opacity = 0;
        menuconf.enabled = NO;
        
        labelConf = [CCLabelTTF labelWithString:@"???" fontName:@"Marker Felt" fontSize:44];
		labelConf.position =  ccp(512 , 384 + 30);
        labelConf.opacity = 0;
		[self addChild: labelConf z:21];

    }
    
    return self;

}

-(void) setText:(NSString*)s {
    
    [labelConf setString:s];
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

    menuconf.enabled = YES;

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
    
    menuconf.enabled = NO;
    
}

@end
