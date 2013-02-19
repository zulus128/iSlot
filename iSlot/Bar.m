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

        for(int i = 0; i < SLIDE_CNT; i++)
            slide_num[i] = -1;

        
        for(int i = 0; i < SLIDE_TYPES; i++) {

            proto[i] = [CCSprite spriteWithFile:[NSString stringWithFormat:@"slotStilistik01-%d.png", i]];
            proto[i].position = ccp(-5000, -5000);
            [layer addChild:proto[i] z:2];
            
            blur[i] = [CCSprite spriteWithFile:[NSString stringWithFormat:@"BlurslotStilistik01-%d.png", i]];
            blur[i].position = ccp(-5000, -5000);
            [layer addChild:blur[i] z:2];
            
        }
        
        int y = Y;
        for(int i = 0; i < SLIDE_CNT; i++) {
            
            int j = [self getRandom:i];
            slide[i] = proto[j];
            slide[i].position = ccp(X, y);
            y += (SLIDE_HEIGHT + 0);
        }
        
        slide[SLIDE_CNT - 1].position = ccp(X, Y - SLIDE_HEIGHT);
        
        id move = [CCMoveBy actionWithDuration:0.18f position:ccp(0, SLIDE_HEIGHT / 9)];
        move_ease = [[CCEaseOut actionWithAction:[[move copy] autorelease] rate:0.7f] retain];
        
        move_forward = [[CCMoveBy actionWithDuration:[Common instance].speed position:ccp(0, -SLIDE_HEIGHT)]retain];
        seq_forward = [[CCSequence actions:
                        move_forward,
                        [CCCallFunc actionWithTarget:self selector:@selector(slideGone)],
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
        for(int i = 0; i < SLIDE_CNT; i++) {
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

-(int) getSlideNum: (int)pos {
    
//    NSLog(@"pos = %d, slide = %d", pos, slide_num[1 + pos]);
    return slide_num[1 + pos];
}

-(CCSprite*) getSprite: (int)pos {

//    NSLog(@"pos = %d", pos);
    return slide[1 + pos];
}

-(void) replaceTop {

    slide[SLIDE_CNT - 1].position = ccp(X, Y + SLIDE_HEIGHT * (SLIDE_CNT - 1));
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
    for(int i = 1; i < SLIDE_CNT; i++) {
        
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
    
    for(int i = 0; i < SLIDE_CNT; i++) {
        
        slide[i].position = ccp(-5000, -5000);
        slide[i] = blur[slide_num[i]];
        float yy = Y + i * SLIDE_HEIGHT;
        slide[i].position = ccp(X, yy);

    }
    
    for(int i = 1; i < SLIDE_CNT; i++) {
        
        [slide[i] runAction:CCCA(move_forward)];
    }
    
    [slide[0] runAction:seq_forward];

}

-(void) slideGone {
    
    slide[0].position = ccp(-5000, -5000);

    for(int i = 0; i < (SLIDE_CNT - 1); i++) {
        
        slide[i] = slide[i + 1];
        slide_num[i] = slide_num[i + 1];
//        slide[i].position = ccp(X, Y + i * SLIDE_HEIGHT);
    }

    int i = [self getRandom:(SLIDE_CNT - 1)];// CCRANDOM_0_1() * SLIDE_TYPES;
    CCSprite* s = blur[i];
    float yy = Y + (SLIDE_CNT - 1) * SLIDE_HEIGHT;
    s.position = ccp(X, yy);
    slide[SLIDE_CNT - 1] = s;

    [self performSelector:@selector(endForward) withObject:nil afterDelay:0.0];
    
}

-(void) endBar {
    
//    NSLog(@"Finished! %d", [Common instance].finished);
    [Common instance].finished --;
    
    finished ++;
    if(finished == SLIDE_CNT)
        slide[SLIDE_CNT - 1].position = ccp(X, Y - SLIDE_HEIGHT);

//    if([Common instance].finished == 0)
//        [self checkLines];
}

-(void) endForward {
    
    if(stop1) {
        
        for(int i = 0; i < SLIDE_CNT; i++) {
            
            CGPoint p = slide[i].position;
            slide[i].position = ccp(-5000, -5000);
            slide[i] = proto[slide_num[i]];
            slide[i].position = p;

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
    
    for(int i = 1; i < SLIDE_CNT; i++) {
        
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
