//
//  Bar.m
//  iSlot
//
//  Created by Zul on 2/8/13.
//  Copyright (c) 2013 Zul. All rights reserved.
//

#import "Bar.h"
#import "GameLayer.h"
static int precnt;

@implementation Bar

//- (id)initWithLayer:(CCLayer *)lay X:(int)xx Y:(int)yy Delay:(float)del {
- (id)initWithLayer:(CCLayer *)lay X:(int)xx Y:(int)yy Delay:(float)del BonDelay1:(float)del1 BonDelay2:(float)del2 BonDelay4:(float)del4 {
    
    self = [super init];
    if (self) {
        // Custom initialization
        layer = lay;
        X = xx;
        Y = yy;
        delay = del;
        bondelay1 = del1;
        bondelay2 = del2;
        bondelay4 = del4;

        for(int i = 0; i < SLIDE_CNT; i++)
            slide_num[i] = -1;

        
        for(int i = 0; i < SLIDE_TYPES; i++) {

            proto[i] = [CCSprite spriteWithFile:[NSString stringWithFormat:@"slotStilistik01-%d.png", i]];
//            proto[i] = [CCSprite spriteWithFile:[NSString stringWithFormat:@"BlurslotStilistik01-%d.png", i]];
            proto[i].position = ccp(-5000, -5000);
            proto[i].tag = 1000 + i;
            [layer addChild:proto[i] z:2];
            
//            blur[i] = [CCSprite spriteWithFile:[NSString stringWithFormat:@"slotStilistik01-%d.png", i]];
            blur[i] = [CCSprite spriteWithFile:[NSString stringWithFormat:@"BlurslotStilistik01-%d.png", i]];
            blur[i].position = ccp(-5000, -5000);
            blur[i].tag = 2000 + i;
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

- (void) presetComb {

    preset = YES;
}

- (int) getRandom:(int)pos {


    BOOL b = YES;
    int j = 0;
    
    if (preset) {

        presetcnt++;

        
        if([Common instance].randCombNow && (posline > -1000)) {
        
            j = [Common instance].randSlideType;
        }
        else
            b = NO;
        
        if(presetcnt > 7) {
            
            BOOL pr = YES;
            
//            if([Common instance].combcnt5 >= [Common instance].max5) {
//                
//                int pcl = [layer preCheckLines];
//                if(pcl >= 1000)
//                    pr = NO;
//                
//            }
//
//            if(pr && ([Common instance].combcnt4 >= [Common instance].max4)) {
//                
//                int pcl = [layer preCheckLines];
//                int d = pcl / 1000;
//                int dd = pcl - d * 1000;
//                if(dd > 0)
//                    pr = NO;
//                
//            }
            
            
            stop1 = pr;
        }

    }
    
    do {
        
        if(!preset || !b)
            j = [[Common instance] getRnd];

        
        b = YES;

        if(preset && (presetcnt < (6 + posline)) && (j ==[Common instance].randSlideType)) {
            
            b = NO;
            continue;
        }
        
        if([Common instance].curlevel == 19) { //first bonus level
        
            switch (j) {
                case 0:
                case 1:
                case 6:
                case 7:
                case 8:
                    b = NO;
                    continue;
            }
        }
        
        for(int i = 0; i < SLIDE_CNT; i++) {
            if(slide_num[i] == j) {
                
                b = NO;
                break;
            }
        }
    }
    while (!b);
/*
    if(preset){
        
        switch (presetcnt) {
            case 5:
                prearr[0] = j;
                break;
            case 6:
                prearr[1] = j;
                break;
            case 7: {
                prearr[2] = j;
                
                precnt++;
                
                if (precnt >= (BARS_CNT - 2)) {
                    
                    int pcl = [self preCheckLines];
                    NSLog(@"lll = %d", pcl);
                    
                    
                    if([Common instance].combcnt4 >= [Common instance].max4) {
                        
                        int d = pcl / 1000;
                        int dd = pcl - d * 1000;
                        if(dd > 0)
                            [layer prolong];
                        //presetcnt -= 3;
                    }
                }
                if (precnt >= (BARS_CNT - 1)) {
                    
                    int pcl = [self preCheckLines];
                    NSLog(@"lll = %d", pcl);
                    
                    
                    if([Common instance].combcnt5 >= [Common instance].max5) {
                        
                        if(pcl > 0)
                            [layer prolong];
                        //presetcnt -= 3;
                    }
                }
                break;
            }
        }
//        NSLog(@"j = %d", j);
//        j = 0;
    }
*/
    slide_num[pos] = j;
    return j;
}

-(void) prolong {

    presetcnt = 7;
}

-(int) getSlideNum: (int)pos {
    
    //    NSLog(@"pos = %d, slide = %d", pos, slide_num[1 + pos]);
    return slide_num[1 + pos];
}

-(int) getPreSlideNum: (int)pos {
    
    return prearr[1 + pos];
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

//-(void) start {
-(void) startWithPosInRandLine:(int)posinline {

    precnt = 0;
    
    posline = posinline;
    
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
//    stop2 = false;
    
    preset = NO;
    presetcnt = 0;
    
    dell = delay;
    int n1 = [Common instance].curlevel / 10;
    int n2 = [Common instance].curlevel - n1 * 10;
    
    if (n2 == 9) //bonus level
        switch (n1) {
            case 1:
                dell = bondelay1;
                break;
            case 2:
                dell = bondelay2;
                break;
            case 4:
                dell = bondelay4;
                break;
        }

    [self performSelector:@selector(stop1) withObject:nil afterDelay:dell];

//    [self performSelector:@selector(presetComb) withObject:nil afterDelay:(dell - SPEED1 * 3.5555f)];
    
//    for(int i = 1; i < SLIDE_CNT; i++) {
    for(int i = (SLIDE_CNT - 1); i > 0; i--) {
        
        [slide[i] runAction:
         [CCSequence actions:
          CCCA(move_ease),
          [move_ease reverse],
          nil]
         ];
    }
    [slide[0] runAction:seq1];

}

-(void) stop1 {
    
//    stop2 = true;
    [self presetComb];
//    [self performSelector:@selector(stop3) withObject:nil afterDelay:[Common instance].speed * 4.9f];

}

-(void) stop3 {
    
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
    
//    for(int i = 1; i < SLIDE_CNT; i++) {
   for(int i = (SLIDE_CNT - 1); i > 0; i--) {
        
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

- (int) preCheckLines {
    
    GameLayer* gl = (GameLayer*)layer;
    int res = 0;
    
    for(int i = 0; i < [Common instance].lines; i++) {
        
        int cnt = 1;
        int fpos = 0;

        int first = [gl getSlideWithBar:fpos Line:i Pos:fpos];

                for(int j = (fpos + 1); j < BARS_CNT; j++) {
                    
                    int slide1 = [gl getSlideWithBar:j Line:i Pos:j];
                    
                    if((slide1 == first) || (slide1 == 0 /*WILD*/)) {
                        cnt++;
                    }
                    else
                        if(first == 0) {
                            cnt++;
                            first = slide1;
                        }
                        else
                            break;
                }
            
        
        if(cnt == 4)
            res += 1000;
        if(cnt == 5)
            res += 1;
    }
    
    //    NSLog(@"---------preCheckLines %d", res);
    
    return res;
}

@end
