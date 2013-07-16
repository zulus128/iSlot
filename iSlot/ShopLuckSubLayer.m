//
//  ShopSubLayer.m
//  iSlot
//
//  Created by вадим on 5/9/13.
//  Copyright (c) 2013 Zul. All rights reserved.
//

#import "ShopLuckSubLayer.h"

@implementation ShopLuckSubLayer

-(void) onConfirmed {
    
    
}

-(void) addContent {
    
    CCSprite *spluck5 = [CCSprite spriteWithFile:@"itemLuck01.png"];
    CCSprite *spluck5_t1 = [CCSprite spriteWithFile:@"itemLuck01.png"];
    CCMenuItemSprite* item5 = [CCMenuItemSprite itemWithNormalSprite:spluck5 selectedSprite:spluck5_t1 block:^(id sender) {
        
        NSLog(@"luck5 selected");
        
    }];
    
    CCSprite *spluck10 = [CCSprite spriteWithFile:@"itemLuck02.png"];
    CCSprite *spluck10_t1 = [CCSprite spriteWithFile:@"itemLuck02.png"];
    CCMenuItemSprite* item10 = [CCMenuItemSprite itemWithNormalSprite:spluck10 selectedSprite:spluck10_t1 block:^(id sender) {
        
        NSLog(@"luck10 selected");
        
    }];
    
    CCSprite *spluck20 = [CCSprite spriteWithFile:@"itemLuck03.png"];
    CCSprite *spluck20_t1 = [CCSprite spriteWithFile:@"itemLuck03.png"];
    CCMenuItemSprite* item20 = [CCMenuItemSprite itemWithNormalSprite:spluck20 selectedSprite:spluck20_t1 block:^(id sender) {
        
        NSLog(@"luck20 selected");
        
    }];
    
    CCSprite *spluck25 = [CCSprite spriteWithFile:@"itemLuck04.png"];
    CCSprite *spluck25_t1 = [CCSprite spriteWithFile:@"itemLuck04.png"];
    CCMenuItemSprite* item25 = [CCMenuItemSprite itemWithNormalSprite:spluck25 selectedSprite:spluck25_t1 block:^(id sender) {
        
        NSLog(@"luck25 selected");
        
    }];
    
    CCSprite *spluck35 = [CCSprite spriteWithFile:@"itemLuck05.png"];
    CCSprite *spluck35_t1 = [CCSprite spriteWithFile:@"itemLuck05.png"];
    CCMenuItemSprite* item35 = [CCMenuItemSprite itemWithNormalSprite:spluck35 selectedSprite:spluck35_t1 block:^(id sender) {
        
        NSLog(@"luck35 selected");
        
    }];
    
    CCSprite *spluck50 = [CCSprite spriteWithFile:@"itemLuck06.png"];
    CCSprite *spluck50_t1 = [CCSprite spriteWithFile:@"itemLuck06.png"];
    CCMenuItemSprite* item50 = [CCMenuItemSprite itemWithNormalSprite:spluck50 selectedSprite:spluck50_t1 block:^(id sender) {
        
        NSLog(@"luck50 selected");
        
    }];
    
    item5.position = ccpluck(144, 232, 238, 112);
    item10.position = ccpluck(397, 232, 238, 112);
    item20.position = ccpluck(650, 232, 238, 112);
    item25.position = ccpluck(144, 387, 238, 112);
    item35.position = ccpluck(397, 387, 238, 112);
    item50.position = ccpluck(650, 387, 238, 112);
    
    item5.tag = SHOPLUCK_TAG;
    item10.tag = SHOPLUCK_TAG;
    item20.tag = SHOPLUCK_TAG;
    item25.tag = SHOPLUCK_TAG;
    item35.tag = SHOPLUCK_TAG;
    item50.tag = SHOPLUCK_TAG;


    item5.opacity = 0;
    item10.opacity = 0;
    item20.opacity = 0;
    item25.opacity = 0;
    item35.opacity = 0;
    item50.opacity = 0;

    menukeys = [CCMenu menuWithItems: item5, item10, item20, item25, item35, item50, nil];
    [self addChild: menukeys z:8];
    
    menukeys.tag = SHOPLUCK_TAG;
    
    [menukeys setPosition:ccp(0, 0)];

//    [self hide1];

}


- (void) show {
    
    for(CCNode *aChildNode in self.children)
        if((aChildNode.tag & 0xF) == SHOPLUCK_TAG) {
            
            for(CCNode *aChild in aChildNode.children)
                if((aChild.tag & 0xF) == SHOPLUCK_TAG) {
                    
                    [aChild runAction:[CCFadeIn actionWithDuration:0.000f]];
                }
            
            //            [aChildNode runAction:[CCFadeOut actionWithDuration:DSLLdelay]];
            
        }
    
//    [menukeys setEnabled:YES];
    
}

- (void) hide {
    
    for(CCNode *aChildNode in self.children)
        if((aChildNode.tag & 0xF) == SHOPLUCK_TAG) {
            
            for(CCNode *aChild in aChildNode.children)
                if((aChild.tag & 0xF) == SHOPLUCK_TAG) {
                    
                    [aChild runAction:[CCFadeOut actionWithDuration:DSLLdelay]];
                    
                }
            
            //            [aChildNode runAction:[CCFadeOut actionWithDuration:DSLLdelay]];
            
        }
}

- (void) hide1 {
    
    for(CCNode *aChildNode in self.children)
        if((aChildNode.tag & 0xF) == SHOPLUCK_TAG) {
            
            for(CCNode *aChild in aChildNode.children)
                if((aChild.tag & 0xF) == SHOPLUCK_TAG) {
                    
                    [aChild runAction:[CCFadeOut actionWithDuration:0]];
                    
                }
            
            //            [aChildNode runAction:[CCFadeOut actionWithDuration:DSLLdelay]];
            
        }
}


@end
