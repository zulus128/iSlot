//
//  GameoverLayer.m
//  Historic Slots
//
//  Created by Admin on 18.06.14.
//  Copyright (c) 2014 Zul. All rights reserved.
//

#import "GameoverLayer.h"
#import "Common.h"

@implementation GameoverLayer

-(id) initWithColor:(ccColor4B)color {
    
	if( (self=[super initWithColor:color])) {
        
        conffon = [CCSprite spriteWithFile:@"gameover.png"];
		conffon.position = ccp(512, 384);
        conffon.opacity = 0;
		[self addChild: conffon z:20];
        
        CCSprite *buy = [CCSprite spriteWithFile:@"buycoins.png"];
        CCSprite *buy_t1 = [CCSprite spriteWithFile:@"touchbuycoins.png"];
        itembuy = [CCMenuItemSprite itemWithNormalSprite:buy selectedSprite:buy_t1 block:^(id sender) {
            
            [self.sslayer showSlon];
            [self hide1];
        }];
		itembuy.position = ccp(412, 384 - 50);
        itembuy.opacity = 0;
       
        CCSprite *restart = [CCSprite spriteWithFile:@"restart.png"];
        CCSprite *restart_t1 = [CCSprite spriteWithFile:@"touchrestart.png"];
        itemrestart = [CCMenuItemSprite itemWithNormalSprite:restart selectedSprite:restart_t1 block:^(id sender) {
            
            [[Common instance] resetGame];
            [self.sslayer refreshLabels];
            [self hide1];
        }];
		itemrestart.position = ccp(612, 384 - 50);
        itemrestart.opacity = 0;
      
        menuconf = [CCMenu menuWithItems: itembuy, itemrestart, nil];
        [self addChild: menuconf z:21];
        menuconf.enabled = NO;
        [menuconf setPosition:ccp(0, 0)];
        
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
