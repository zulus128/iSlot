//
//  Bar.m
//  iSlot
//
//  Created by Zul on 2/8/13.
//  Copyright (c) 2013 Zul. All rights reserved.
//

#import "Bar.h"

@implementation Bar

- (id)initWithLayer:(CCLayer *)lay X:(int)xx Y:(int)yy Delay:(float)del {
    
    self = [super init];
    if (self) {
        // Custom initialization
        layer = lay;
        X = xx;
        Y = yy;
        delay = del;
        
        int y = Y;
        for(int i = 0; i < CNT; i++) {
            
            int j = CCRANDOM_0_1() * SLIDE_TYPES;
            
            slide[i] = [CCSprite spriteWithFile:[NSString stringWithFormat:@"slotStilistik01-%d.png", j]];
            //            slide[i] = [CCSprite spriteWithFile:@"slotStilistik01-5.png"];
            slide[i].position = ccp(X, y);
            //            slide[i].scale = 2;
            [layer addChild:slide[i] z:2];
            
            y += (SLIDE_HEIGHT + 0);
        }
        
        id move = [CCMoveBy actionWithDuration:0.05f + CCRANDOM_0_1()/6 position:ccp(0, SLIDE_HEIGHT / 10 + CCRANDOM_0_1() * 5)];
        move_ease = [[CCEaseOut actionWithAction:[[move copy] autorelease] rate:0.7f] retain];
        
        move_forward = [[CCMoveBy actionWithDuration:SPEED position:ccp(0, -SLIDE_HEIGHT)]retain];
        seq_forward = [[CCSequence actions:
                        move_forward,
                        [CCCallFunc actionWithTarget:self selector:@selector(slideGone)],
                        //                        [CCDelayTime actionWithDuration:3],
                        //                        [CCCallFunc actionWithTarget:self selector:@selector(endForward)],
                        nil]retain];
        
        seq1 = [[CCSequence actions:
                 CCCA(move_ease),
                 [move_ease reverse],
                 [CCCallFunc actionWithTarget:self selector:@selector(callback1)],
                 nil]retain];
        

    }
    return self;
}

-(void) start {

    stop1 = false;
    [self performSelector:@selector(stop1) withObject:nil afterDelay:delay];
    
    [slide[0] runAction:seq1];
    for(int i = 1; i < CNT; i++) {
        
        [slide[i] runAction:
         [CCSequence actions:
          CCCA(move_ease),
          [move_ease reverse],
          nil]
         ];
    }

}

-(void) stop1 {
    
    stop1 = true;
}

-(void) callback1 {
    
//    NSLog(@"callback1!");
    
    //    [slide[0] runAction:[CCRepeatForever actionWithAction:seq_forward]];
    //    [slide[0] stopAllActions];
    [slide[0] runAction:seq_forward];
    for(int i = 1; i < CNT; i++) {
        
        [slide[i] stopAllActions];
        [slide[i] runAction:CCCA(move_forward)];
    }
}

-(void) slideGone {
    
    //    NSLog(@"slideGone! %d %d", X, Y);
    
    //    for(int i = 0; i < CNT; i++) {
    //
    //        NSLog(@"slide %d : %f, %f", i, slide[i].position.x, slide[i].position.y);
    //
    //    }
    //    NSLog(@"------------------------------");
    
    
    [slide[0] removeFromParent];
    int i = CCRANDOM_0_1() * SLIDE_TYPES;
    slide[0] = [CCSprite spriteWithFile:[NSString stringWithFormat:@"slotStilistik01-%d.png", i]];
    slide[0].position = ccp(X, Y + (CNT - 1) * SLIDE_HEIGHT);
    [layer addChild:slide[0] z:2];
    
    CCSprite* s = slide[0];
    for(int i = 0; i < (CNT - 1); i++) {
        
        slide[i] = slide[i + 1];
        slide[i].position = ccp(X, Y + i * SLIDE_HEIGHT);
    }
    slide[CNT - 1] = s;
    
    [self performSelector:@selector(endForward) withObject:nil afterDelay:0.0];
    
}

-(void) endBar {
    
//    NSLog(@"Finished! %d", [Common instance].finished);
    [Common instance].finished --;
}

-(void) endForward {
    
    if(stop1) {
        
        for(int i = 0; i < CNT; i++) {
            
            [slide[i] runAction:
             [CCSequence actions:
              [move_ease reverse],
              CCCA(move_ease),
//              [move_ease reverse],
              [CCCallFunc actionWithTarget:self selector:@selector(endBar)],
              nil]
             ];
        }
        return;
    }
    
    for(int i = 1; i < CNT; i++) {
        
        //        [slide[i] stopAllActions];
        [slide[i] runAction:CCCA(move_forward)];
    }
    [slide[0] runAction:seq_forward];
    
}

- (void) dealloc {
    
	// in case you have something to dealloc, do it in this method
	// in this particular example nothing needs to be released.
	// cocos2d will automatically release all the children (Label)
	
	// don't forget to call "super dealloc"
    
    
    [move_ease release];
    [seq1 release];
    //    [seq2 release];
    [move_forward release];
    [seq_forward release];
    //    [move_ease_rev release];
    
	[super dealloc];
}

@end
