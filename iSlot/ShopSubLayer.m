//
//  ShopSubLayer.m
//  iSlot
//
//  Created by вадим on 5/9/13.
//  Copyright (c) 2013 Zul. All rights reserved.
//

#import "ShopSubLayer.h"
#import "Common.h"

@implementation ShopSubLayer

-(void) onBuyCoins {
    
    [self.player afterShop];
    [self.shlayer hide];
    [self.player showSlon];
}

-(void) onConfirmed {
    
    int lines = [Common instance].linesBought;
    int price = (lines - 2) * 250;
    
    [Common instance].money -= price;
    [self.player refreshLabels];
    
    if(lines < LINES_CNT) {
        
        lines++;
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        [userDefaults setObject:[NSNumber numberWithInt:lines] forKey:@"linesBought"];
        [userDefaults synchronize];
        
        [Common instance].linesBought = lines;
        
        int x = XXX + (lines % 3) * 237;
        int y = YYY - (lines / 3) * 127;
        
        ll2.position = ccp(x - 18, y - 50);
        
        [lab1 setString:[NSString stringWithFormat:@"%d", (lines - 2) * 250]];
        
        lab1.position =  ccp(x - 18, y - 50);
        
        [itemshop setPosition:ccp(x, y)];
        
        int t = SHOPSUB_TAG + ((lines - 1) << 8);
        CCSprite* s = (CCSprite*)[self getChildByTag:t];
        if(s != nil)
            s.visible = YES;
        t = SHOPSUB_TAG + (lines << 16);
        s = (CCSprite*)[self getChildByTag:t];
        if(s != nil)
            s.visible = NO;
    }

}

-(void) addContent {
    
        self.touchEnabled = NO;
    
    CCSprite *spshop = [CCSprite spriteWithFile:@"ShopLine01.png"];
    CCSprite *spshop_t1 = [CCSprite spriteWithFile:@"ShopLine01.png"];
    itemshop = [CCMenuItemSprite itemWithNormalSprite:spshop selectedSprite:spshop_t1 block:^(id sender) {
        
        NSLog(@"line selected");
        
        int lines = [Common instance].linesBought;
        int price = (lines - 2) * 250;
        
//        [self.shlayer showConf2];

        if(([Common instance].money - price) < 0)
            [self.shlayer showConf1];
        else
            if(([Common instance].money - price) < 250)
                [self.shlayer showConf2];
        else
            [self.shlayer showConf];
        
        

    }];
    
    itemshop.opacity = 0;

    int lines = [Common instance].linesBought;
    
    for(int i = 0; i < LINES_CNT; i++) {
    
        int x = XXX + (i % 3) * 237;
        int y = YYY - (i / 3) * 127;
//        y = 1200 - y;
        
		CCSprite* l1 = [CCSprite spriteWithFile:[NSString stringWithFormat:@"ShopLine%02d.png", i + 1]];
		l1.position = ccp(x, y);
        l1.opacity = 0;
        l1.tag = SHOPSUB_TAG;
		[self addChild: l1];
        
        CCSprite* l2 = [CCSprite spriteWithFile:@"Check.png"];
        l2.position = ccp(x + 94, y - 14);
        l2.opacity = 0;
        l2.visible = NO;
        l2.tag = SHOPSUB_TAG + (i << 8);
        [self addChild: l2];

        CCSprite* l22 = [CCSprite spriteWithFile:@"LockShop.png"];
        l22.position = ccp(x + 86, y - 25);
        l22.opacity = 0;
        l22.visible = NO;
        l22.tag = SHOPSUB_TAG + (i << 16);
        [self addChild: l22];

        if (i <= (lines - 1)) {
            
            l2.visible = YES;
        }
        
        if (i > lines ) {
            
            l22.visible = YES;

        }
        
        if (i == lines ) {
            
            ll2 = [CCSprite spriteWithFile:@"FonPrice.png"];
            ll2.position = ccp(x - 18, y - 50);
            ll2.opacity = 0;
            ll2.tag = SHOPSUB_TAG;
            [self addChild: ll2 z:5];
            
            lab1 = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"%d", (lines - 2) * 250] fontName:@"Marker Felt" fontSize:40];
            lab1.position =  ccp(x - 18, y - 50);
            lab1.opacity = 0;
            lab1.tag = SHOPSUB_TAG;
            [self addChild: lab1 z:6];

            [itemshop setPosition:ccp(x, y)];
            
        }
        
    }
    
    menukeys = [CCMenu menuWithItems: itemshop, nil];
    [self addChild: menukeys z:8];
    [menukeys setPosition:ccp(0, 0)];

    self.position = ccp(125, -765);

}

- (void) visit {

    if (!self.visible) {
        return;
    }
    
    int k = IS_RETINA?1:2;
    
    glEnable(GL_SCISSOR_TEST);
    glScissor(100/k, 470/k, 1900/k, 680/k);
    [super visit];
    glDisable(GL_SCISSOR_TEST);
}

- (void) show {

//    for(CCNode *aChildNode in self.children)
//        NSLog(@"tag %d, %d", aChildNode.tag, aChildNode.tag & 0xFF);
    
    self.position = ccp(125, -765);

    for(CCNode *aChildNode in self.children)
        if((aChildNode.tag & 0xF) == SHOPSUB_TAG) {
        
        ((CCSprite*)aChildNode).opacity = 0;
        [aChildNode runAction:[CCFadeIn actionWithDuration:DSLdelay]];
        
    }
    
    self.touchEnabled = YES;

}

- (void) hide {
    
    for(CCNode *aChildNode in self.children)
        if((aChildNode.tag & 0xF) == SHOPSUB_TAG) {
        
        [aChildNode runAction:[CCFadeOut actionWithDuration:DSLdelay]];
        
    }

    self.touchEnabled = NO;

    [self performSelector:@selector(hide1) withObject:nil afterDelay:DSLdelay];

}

- (void) hide1 {
    
    self.position = ccp(10125, -10765);

}

- (void)ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    if(blocked)
        return;

    UITouch *touch =[touches anyObject];
    CGPoint point = [touch locationInView:[touch view]];
    point = [[CCDirector sharedDirector]convertToGL:point];

//    NSLog(@"y = %f", point.y);
    
    y0 = point.y;
    yl0 = self.position.y;
    
    
}

-(void) ccTouchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    
    if(blocked)
        return;

    UITouch *touch =[touches anyObject];
    CGPoint point = [touch locationInView:[touch view]];
    point = [[CCDirector sharedDirector]convertToGL:point];
    
    
    float xx = self.position.x;
    
    float delta = point.y - y0;

//    NSLog(@"moved x = %f, y = %f, delta = %f", point.x, point.y, delta);

    float yy = yl0 + delta;
    
//    NSLog(@"yy = %f", yy);

    if(yy > -184)
        yy = -184;
    if(yy < -765)
        yy = -765;
    //    NSLog(@"xx = %f", xx);
    self.position = ccp(xx, yy);
}

-(void) ccTouchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    
    if(blocked)
        return;
    
    //    NSLog(@"ccTouchesEnded");
    UITouch *touch =[touches anyObject];
    CGPoint point = [touch locationInView:[touch view]];
    point = [[CCDirector sharedDirector]convertToGL:point];
    
    float xx = self.position.x;

    float delta = (point.y - y0) * 2;
    float yy = yl0 + delta;

    if(yy > -184)
        yy = -184;
    if(yy < -765)
        yy = -765;
    
    [self stopAllActions];
    CCMoveTo *moveTo = [CCMoveTo actionWithDuration:0.6f position:ccp(xx, yy)];
    [self runAction:[CCEaseOut actionWithAction:moveTo rate:1.7f]];
    
}

-(void)enable {
    
    blocked = NO;
    menukeys.enabled = YES;
}

-(void)disable {

    blocked = YES;
    menukeys.enabled = NO;

}

@end
