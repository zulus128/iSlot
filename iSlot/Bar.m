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

        for(int i = 0; i < CNT; i++)
            slide_num[i] = -1;

        
        for(int i = 0; i < SLIDE_TYPES; i++) {

            proto[i] = [CCSprite spriteWithFile:[NSString stringWithFormat:@"slotStilistik01-%d.png", i]];
            proto[i].position = ccp(-5000, -5000);
            [layer addChild:proto[i] z:2];

        }
        
        int y = Y;
        for(int i = 0; i < CNT; i++) {
            
//            int j = CCRANDOM_0_1() * SLIDE_TYPES;
            int j = [self getRandom:i];
//            NSLog(@"start %d", j);
            slide[i] = proto[j];//[CCSprite spriteWithFile:[NSString stringWithFormat:@"slotStilistik01-%d.png", j]];
            slide[i].position = ccp(X, y);
//            [layer addChild:slide[i] z:2];

            y += (SLIDE_HEIGHT + 0);
        }
        
        slide[CNT - 1].position = ccp(X, Y - SLIDE_HEIGHT);
        
//        id move = [CCMoveBy actionWithDuration:0.05f + CCRANDOM_0_1()/6 position:ccp(0, SLIDE_HEIGHT / 10 + CCRANDOM_0_1() * 5)];
        id move = [CCMoveBy actionWithDuration:0.18f position:ccp(0, SLIDE_HEIGHT / 9)];
        move_ease = [[CCEaseOut actionWithAction:[[move copy] autorelease] rate:0.7f] retain];
        
        move_forward = [[CCMoveBy actionWithDuration:[Common instance].speed position:ccp(0, -SLIDE_HEIGHT)]retain];
//        move_forward = [[CCMoveBy actionWithDuration:1.0f position:ccp(0, -SLIDE_HEIGHT)]retain];
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

- (int) getRandom:(int)pos {

    BOOL b;
    int j;
    do {
        b = YES;
        j = CCRANDOM_0_1() * SLIDE_TYPES;
        for(int i = 0; i < CNT; i++) {
            if(slide_num[i] == j) {
                
                b = NO;
                break;
            }
        }
    }
    while (!b);
    slide_num[pos] = j;
    return j;
}

-(void) replaceTop {

    slide[CNT - 1].position = ccp(X, Y + SLIDE_HEIGHT * (CNT - 1));
//    for(int i = 0; i < CNT; i++) {
//        slide[i].position = ccp(X, Y + i * SLIDE_HEIGHT);
//    }

}

-(void) start {

    
    if(move_forward != nil) {
     
        [move_forward release];
        [seq_forward release];
        move_forward = [[CCMoveBy actionWithDuration:[Common instance].speed position:ccp(0, -SLIDE_HEIGHT)]retain];
        seq_forward = [[CCSequence actions:
                        move_forward,
                        [CCCallFunc actionWithTarget:self selector:@selector(slideGone)],
                        nil]retain];
    }

    
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

    [self replaceTop];
    finished = 0;
    for(int i = 1; i < CNT; i++) {
        
        
//        id move_f = [CCMoveTo actionWithDuration:1.0f position:ccp(X, Y + (i - 1) * SLIDE_HEIGHT)];
        

        
        
        [slide[i] runAction:CCCA(move_forward)];
//        [slide[i] runAction:move_f];
    }
//    id seq_f = [CCSequence actions:
//                [CCMoveTo actionWithDuration:1.0f position:ccp(X, Y - SLIDE_HEIGHT)],
//                [CCCallFunc actionWithTarget:self selector:@selector(slideGone)],
//                nil];
    [slide[0] runAction:seq_forward];
}

-(void) slideGone {
    
    //    NSLog(@"slideGone! %d %d", X, Y);
    
    
    
//    [slide[0] removeFromParent];
    slide[0].position = ccp(-5000, -5000);
//    [layer addChild:s z:2];
    
//    CCSprite* s = slide[0];
    for(int i = 0; i < (CNT - 1); i++) {
        
        slide[i] = slide[i + 1];
        slide_num[i] = slide_num[i + 1];
//        slide[i].position = ccp(X, Y + i * SLIDE_HEIGHT);
    }


    
    int i = [self getRandom:(CNT - 1)];// CCRANDOM_0_1() * SLIDE_TYPES;
    CCSprite* s = proto[i];//[CCSprite spriteWithFile:[NSString stringWithFormat:@"slotStilistik01-%d.png", i]];
//    s.position = ccp(X, Y + (CNT - 1) * SLIDE_HEIGHT );

//    NSLog(@"--- %d, %f", Y + (CNT - 1) * SLIDE_HEIGHT, Y + slide[CNT - 2].position.y + SLIDE_HEIGHT);

//    float yy = slide[CNT - 2].position.y + SLIDE_HEIGHT;
    float yy = Y + (CNT - 1) * SLIDE_HEIGHT;
    s.position = ccp(X, yy);
    slide[CNT - 1] = s;

//    for(int i = 0; i < CNT; i++) {
//
//        NSLog(@"slide %d :%f", i, slide[i].position.y);
//
//    }
//    NSLog(@"------------------------------");

    [self performSelector:@selector(endForward) withObject:nil afterDelay:0.0];
    
}

-(void) endBar {
    
//    NSLog(@"Finished! %d", [Common instance].finished);
    [Common instance].finished --;
    
    finished ++;
    if(finished == CNT)
        slide[CNT - 1].position = ccp(X, Y - SLIDE_HEIGHT);

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
    
//    for(int i = 0; i < CNT; i++) {
//        slide[i].position = ccp(X, Y + i * SLIDE_HEIGHT);
//    }

    for(int i = 1; i < CNT; i++) {
        
        //        [slide[i] stopAllActions];
        slide[i].position = ccp(X, Y + i * SLIDE_HEIGHT);
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
    [move_forward release];
    [seq_forward release];
	[super dealloc];
}

@end
