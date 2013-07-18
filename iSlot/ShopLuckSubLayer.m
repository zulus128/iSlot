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
    label5 = [CCLabelTTF labelWithString:@"Luck: +5" fontName:@"Marker Felt" fontSize:20];
    label5.position =  ccp(140, 80);
    label5.color = ccc3(0, 0, 0);
    label5.tag = SHOPLUCK_TAG;
    [item5 addChild: label5];
    label51 = [CCLabelTTF labelWithString:@"Duration:" fontName:@"Marker Felt" fontSize:20];
    label51.position =  ccp(140, 50);
    label51.color = ccc3(0, 0, 0);
    label51.tag = SHOPLUCK_TAG;
    [item5 addChild: label51];
    label52 = [CCLabelTTF labelWithString:@"30 minutes" fontName:@"Marker Felt" fontSize:20];
    label52.position =  ccp(140, 32);
    label52.color = ccc3(0, 0, 0);
    label52.tag = SHOPLUCK_TAG;
    [item5 addChild: label52];
    
    CCSprite *spluck10 = [CCSprite spriteWithFile:@"itemLuck02.png"];
    CCSprite *spluck10_t1 = [CCSprite spriteWithFile:@"itemLuck02.png"];
    CCMenuItemSprite* item10 = [CCMenuItemSprite itemWithNormalSprite:spluck10 selectedSprite:spluck10_t1 block:^(id sender) {
        
        NSLog(@"luck10 selected");
        
    }];
    label10 = [CCLabelTTF labelWithString:@"Luck: +10" fontName:@"Marker Felt" fontSize:20];
    label10.position =  ccp(140, 80);
    label10.color = ccc3(0, 0, 0);
    label10.tag = SHOPLUCK_TAG;
    [item10 addChild: label10];
    label101 = [CCLabelTTF labelWithString:@"Duration:" fontName:@"Marker Felt" fontSize:20];
    label101.position =  ccp(140, 50);
    label101.color = ccc3(0, 0, 0);
    label101.tag = SHOPLUCK_TAG;
    [item10 addChild: label101];
    label102 = [CCLabelTTF labelWithString:@"1 hour" fontName:@"Marker Felt" fontSize:20];
    label102.position =  ccp(140, 32);
    label102.color = ccc3(0, 0, 0);
    label102.tag = SHOPLUCK_TAG;
    [item10 addChild: label102];
    
    
    CCSprite *spluck20 = [CCSprite spriteWithFile:@"itemLuck03.png"];
    CCSprite *spluck20_t1 = [CCSprite spriteWithFile:@"itemLuck03.png"];
    CCMenuItemSprite* item20 = [CCMenuItemSprite itemWithNormalSprite:spluck20 selectedSprite:spluck20_t1 block:^(id sender) {
        
        NSLog(@"luck20 selected");
        
    }];
    label20 = [CCLabelTTF labelWithString:@"Luck: +20" fontName:@"Marker Felt" fontSize:20];
    label20.position =  ccp(140, 80);
    label20.color = ccc3(0, 0, 0);
    label20.tag = SHOPLUCK_TAG;
    [item20 addChild: label20];
    label201 = [CCLabelTTF labelWithString:@"Duration:" fontName:@"Marker Felt" fontSize:20];
    label201.position =  ccp(140, 50);
    label201.color = ccc3(0, 0, 0);
    label201.tag = SHOPLUCK_TAG;
    [item20 addChild: label201];
    label202 = [CCLabelTTF labelWithString:@"3 hour" fontName:@"Marker Felt" fontSize:20];
    label202.position =  ccp(140, 32);
    label202.color = ccc3(0, 0, 0);
    label202.tag = SHOPLUCK_TAG;
    [item20 addChild: label202];
    
    CCSprite *spluck25 = [CCSprite spriteWithFile:@"itemLuck04.png"];
    CCSprite *spluck25_t1 = [CCSprite spriteWithFile:@"itemLuck04.png"];
    CCMenuItemSprite* item25 = [CCMenuItemSprite itemWithNormalSprite:spluck25 selectedSprite:spluck25_t1 block:^(id sender) {
        
        NSLog(@"luck25 selected");
        
    }];
    label25 = [CCLabelTTF labelWithString:@"Luck: +25" fontName:@"Marker Felt" fontSize:20];
    label25.position =  ccp(140, 80);
    label25.color = ccc3(0, 0, 0);
    label25.tag = SHOPLUCK_TAG;
    [item25 addChild: label25];
    label251 = [CCLabelTTF labelWithString:@"Duration:" fontName:@"Marker Felt" fontSize:20];
    label251.position =  ccp(140, 50);
    label251.color = ccc3(0, 0, 0);
    label251.tag = SHOPLUCK_TAG;
    [item25 addChild: label251];
    label252 = [CCLabelTTF labelWithString:@"6 hour" fontName:@"Marker Felt" fontSize:20];
    label252.position =  ccp(140, 32);
    label252.color = ccc3(0, 0, 0);
    label252.tag = SHOPLUCK_TAG;
    [item25 addChild: label252];
    
    CCSprite *spluck35 = [CCSprite spriteWithFile:@"itemLuck05.png"];
    CCSprite *spluck35_t1 = [CCSprite spriteWithFile:@"itemLuck05.png"];
    CCMenuItemSprite* item35 = [CCMenuItemSprite itemWithNormalSprite:spluck35 selectedSprite:spluck35_t1 block:^(id sender) {
        
        NSLog(@"luck35 selected");
        
    }];
    label35 = [CCLabelTTF labelWithString:@"Luck: +35" fontName:@"Marker Felt" fontSize:20];
    label35.position =  ccp(140, 80);
    label35.color = ccc3(0, 0, 0);
    label35.tag = SHOPLUCK_TAG;
    [item35 addChild: label35];
    label351 = [CCLabelTTF labelWithString:@"Duration:" fontName:@"Marker Felt" fontSize:20];
    label351.position =  ccp(140, 50);
    label351.color = ccc3(0, 0, 0);
    label351.tag = SHOPLUCK_TAG;
    [item35 addChild: label351];
    label352 = [CCLabelTTF labelWithString:@"12 hour" fontName:@"Marker Felt" fontSize:20];
    label352.position =  ccp(140, 32);
    label352.color = ccc3(0, 0, 0);
    label352.tag = SHOPLUCK_TAG;
    [item35 addChild: label352];
   
    CCSprite *spluck50 = [CCSprite spriteWithFile:@"itemLuck06.png"];
    CCSprite *spluck50_t1 = [CCSprite spriteWithFile:@"itemLuck06.png"];
    CCMenuItemSprite* item50 = [CCMenuItemSprite itemWithNormalSprite:spluck50 selectedSprite:spluck50_t1 block:^(id sender) {
        
        NSLog(@"luck50 selected");
        
    }];
    label50 = [CCLabelTTF labelWithString:@"Luck: +50" fontName:@"Marker Felt" fontSize:20];
    label50.position =  ccp(140, 80);
    label50.color = ccc3(0, 0, 0);
    label50.tag = SHOPLUCK_TAG;
    [item50 addChild: label50];
    label501 = [CCLabelTTF labelWithString:@"Duration:" fontName:@"Marker Felt" fontSize:20];
    label501.position =  ccp(140, 50);
    label501.color = ccc3(0, 0, 0);
    label501.tag = SHOPLUCK_TAG;
    [item50 addChild: label501];
    label502 = [CCLabelTTF labelWithString:@"24 hour" fontName:@"Marker Felt" fontSize:20];
    label502.position =  ccp(140, 32);
    label502.color = ccc3(0, 0, 0);
    label502.tag = SHOPLUCK_TAG;
    [item50 addChild: label502];
    
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

    fp5 = [CCSprite spriteWithFile:@"Check.png"];
    fp5.position =  ccp(223, 43);
    fp5.tag = SHOPLUCK_TAG;
    [item5 addChild:fp5 z:15];
    fp10 = [CCSprite spriteWithFile:@"Check.png"];
    fp10.position =  ccp(223, 43);
    fp10.tag = SHOPLUCK_TAG;
    [item10 addChild:fp10 z:15];
    fp20 = [CCSprite spriteWithFile:@"Check.png"];
    fp20.position =  ccp(223, 43);
    fp20.tag = SHOPLUCK_TAG;
    [item20 addChild:fp20 z:15];
    fp25 = [CCSprite spriteWithFile:@"Check.png"];
    fp25.position =  ccp(223, 43);
    fp25.tag = SHOPLUCK_TAG;
    [item25 addChild:fp25 z:15];
    fp35 = [CCSprite spriteWithFile:@"Check.png"];
    fp35.position =  ccp(223, 43);
    fp35.tag = SHOPLUCK_TAG;
    [item35 addChild:fp35 z:15];
    fp50 = [CCSprite spriteWithFile:@"Check.png"];
    fp50.position =  ccp(223, 43);
    fp50.tag = SHOPLUCK_TAG;
    [item50 addChild:fp50 z:15];

    frame5 = [CCSprite spriteWithFile:@"FonPrice.png"];
    frame5.position =  ccp(100, 8);
    frame5.tag = SHOPLUCK_TAG;
    [item5 addChild:frame5 z:15];
    frame10 = [CCSprite spriteWithFile:@"FonPrice.png"];
    frame10.position =  ccp(100, 8);
    frame10.tag = SHOPLUCK_TAG;
    [item10 addChild:frame10 z:15];
    frame20 = [CCSprite spriteWithFile:@"FonPrice.png"];
    frame20.position =  ccp(100, 8);
    frame20.tag = SHOPLUCK_TAG;
    [item20 addChild:frame20 z:15];
    frame25 = [CCSprite spriteWithFile:@"FonPrice.png"];
    frame25.position =  ccp(100, 8);
    frame25.tag = SHOPLUCK_TAG;
    [item25 addChild:frame25 z:15];
    frame35 = [CCSprite spriteWithFile:@"FonPrice.png"];
    frame35.position =  ccp(100, 8);
    frame35.tag = SHOPLUCK_TAG;
    [item35 addChild:frame35 z:15];
    frame50 = [CCSprite spriteWithFile:@"FonPrice.png"];
    frame50.position =  ccp(100, 8);
    frame50.tag = SHOPLUCK_TAG;
    [item50 addChild:frame50 z:15];

    
    price5 = [CCLabelTTF labelWithString:@"2000" fontName:@"Marker Felt" fontSize:30];
    price5.position =  ccp(100, 8);
    price5.color = ccc3(0, 0, 0);
    price5.tag = SHOPLUCK_TAG;
    [item5 addChild: price5 z:16];
    price10 = [CCLabelTTF labelWithString:@"5000" fontName:@"Marker Felt" fontSize:30];
    price10.position =  ccp(100, 8);
    price10.color = ccc3(0, 0, 0);
    price10.tag = SHOPLUCK_TAG;
    [item10 addChild: price10 z:16];
    price20 = [CCLabelTTF labelWithString:@"7000" fontName:@"Marker Felt" fontSize:30];
    price20.position =  ccp(100, 8);
    price20.color = ccc3(0, 0, 0);
    price20.tag = SHOPLUCK_TAG;
    [item20 addChild: price20 z:16];
    price25 = [CCLabelTTF labelWithString:@"10000" fontName:@"Marker Felt" fontSize:30];
    price25.position =  ccp(100, 8);
    price25.color = ccc3(0, 0, 0);
    price25.tag = SHOPLUCK_TAG;
    [item25 addChild: price25 z:16];
    price35 = [CCLabelTTF labelWithString:@"15000" fontName:@"Marker Felt" fontSize:30];
    price35.position =  ccp(100, 8);
    price35.color = ccc3(0, 0, 0);
    price35.tag = SHOPLUCK_TAG;
    [item35 addChild: price35 z:16];
    price50 = [CCLabelTTF labelWithString:@"25000" fontName:@"Marker Felt" fontSize:30];
    price50.position =  ccp(100, 8);
    price50.color = ccc3(0, 0, 0);
    price50.tag = SHOPLUCK_TAG;
    [item50 addChild: price50 z:16];

    
    
    
    
    
    
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



}


- (void) show {
    
    for(CCNode *aChildNode in self.children)
        if((aChildNode.tag & 0xF) == SHOPLUCK_TAG) {
            
            for(CCNode *aChild in aChildNode.children)
                if((aChild.tag & 0xF) == SHOPLUCK_TAG) {
                    
                    [aChild runAction:[CCFadeIn actionWithDuration:0.000f]];
                    NSLog(@"show");

                    for(CCNode *aChild1 in aChild.children) {
                        NSLog(@"show1");
                        if((aChild1.tag & 0xF) == SHOPLUCK_TAG) {
                            
                            [aChild1 runAction:[CCFadeIn actionWithDuration:0.000f]];
                        }
                    }
                }
            
//            [aChildNode runAction:[CCFadeIn actionWithDuration:0.000f]];
            
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
