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

-(void) addContent {
    
        self.touchEnabled = YES;
    
    CCSprite *spshop = [CCSprite spriteWithFile:@"ShopLine01.png"];
    CCSprite *spshop_t1 = [CCSprite spriteWithFile:@"ShopLine01.png"];
    itemshop = [CCMenuItemSprite itemWithNormalSprite:spshop selectedSprite:spshop_t1 block:^(id sender) {
        NSLog(@"selected");
        
        int lines = [Common instance].linesBought;
        int price = (lines - 2) * 250;

        if(lines < LINES_CNT) {

            lines++;
            NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
            [userDefaults setObject:[NSNumber numberWithInt:li] forKey:@"linesBought"];
            [userDefaults synchronize];
        }

    }];
    itemshop.opacity = 0;

    int X = 160;
    int Y = 1260;
    int lines = [Common instance].linesBought;
    
    for(int i = 0; i < LINES_CNT; i++) {
    
        int x = X + (i % 3) * 237;
        int y = Y - (i / 3) * 127;
//        y = 1200 - y;
        
		CCSprite* l1 = [CCSprite spriteWithFile:[NSString stringWithFormat:@"ShopLine%02d.png", i + 1]];
		l1.position = ccp(x, y);
        l1.opacity = 0;
        l1.tag = SHOPSUB_TAG;
		[self addChild: l1];
        
        if (i <= (lines - 1)) {
            
            CCSprite* l2 = [CCSprite spriteWithFile:@"Check.png"];
            l2.position = ccp(x + 94, y - 14);
            l2.opacity = 0;
            l2.tag = SHOPSUB_TAG;
            [self addChild: l2];
            
        }
        
        if (i > lines ) {
            
            CCSprite* l2 = [CCSprite spriteWithFile:@"LockShop.png"];
            l2.position = ccp(x + 86, y - 25);
            l2.opacity = 0;
            l2.tag = SHOPSUB_TAG;
            [self addChild: l2];
            
        }
        
        if (i == lines ) {
            
            CCSprite* l2 = [CCSprite spriteWithFile:@"FonPrice.png"];
            l2.position = ccp(x - 18, y - 50);
            l2.opacity = 0;
            l2.tag = SHOPSUB_TAG;
            [self addChild: l2];
            
            lab1 = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"%d", (lines - 2) * 250] fontName:@"Marker Felt" fontSize:40];
            lab1.position =  ccp(x - 18, y - 50);
            lab1.opacity = 0;
            lab1.tag = SHOPSUB_TAG;
            [self addChild: lab1];

            [itemshop setPosition:ccp(x, y)];
            
        }
        
    }
    
    CCMenu* menukeys = [CCMenu menuWithItems: itemshop, nil];
    [self addChild: menukeys z:8];
    [menukeys setPosition:ccp(0, 0)];

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
    
    for(CCNode *aChildNode in self.children)
        if(aChildNode.tag == SHOPSUB_TAG) {
        
        ((CCSprite*)aChildNode).opacity = 0;
        [aChildNode runAction:[CCFadeIn actionWithDuration:DSLdelay]];
        
    }
    
}

- (void) hide {
    
    for(CCNode *aChildNode in self.children)
        if(aChildNode.tag == SHOPSUB_TAG) {
        
        [aChildNode runAction:[CCFadeOut actionWithDuration:DSLdelay]];
        
    }
    
}

- (void)ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    UITouch *touch =[touches anyObject];
    CGPoint point = [touch locationInView:[touch view]];
    point = [[CCDirector sharedDirector]convertToGL:point];

//    NSLog(@"y = %f", point.y);
    
    y0 = point.y;
    yl0 = self.position.y;
    
    
}

-(void) ccTouchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    
    UITouch *touch =[touches anyObject];
    CGPoint point = [touch locationInView:[touch view]];
    point = [[CCDirector sharedDirector]convertToGL:point];
    
    
    float xx = self.position.x;
    
    float delta = point.y - y0;

//    NSLog(@"moved x = %f, y = %f, delta = %f", point.x, point.y, delta);

    float yy = yl0 + delta;
    
    NSLog(@"yy = %f", yy);

    if(yy > -184)
        yy = -184;
    if(yy < -765)
        yy = -765;
    //    NSLog(@"xx = %f", xx);
    self.position = ccp(xx, yy);
}

-(void) ccTouchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    
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

@end
