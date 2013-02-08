//
//  GameLayer.m
//  iSlot
//
//  Created by Zul on 2/7/13.
//  Copyright (c) 2013 Zul. All rights reserved.
//

#import "GameLayer.h"


#define SPEED 0.07f
#define DELAY1 10.0f
#define SLIDE_TYPES 11

#define SLIDE_HEIGHT 144
#define CCCA(x) [[x copy] autorelease]

@interface GameLayer ()

@end

@implementation GameLayer

// Helper class method that creates a Scene with the HelloWorldLayer as the only child.
+(CCScene *) scene {
    
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	GameLayer *layer = [GameLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

// on "init" you need to initialize your instance
-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super's" return value
	if( (self=[super init]) ) {
		
//		// create and initialize a Label
//		CCLabelTTF *label = [CCLabelTTF labelWithString:@"Hello World" fontName:@"Marker Felt" fontSize:64];
//        
		// ask director for the window size
		CGSize size = [[CCDirector sharedDirector] winSize];
//
//		// position the label on the center of the screen
//		label.position =  ccp( size.width /2 , size.height/2 );
//		
//		// add the label as a child to this Layer
//		[self addChild: label];
	
        
        CCSprite* back = [CCSprite spriteWithFile:@"FonSlot01.png"];
        [self addChild:back z:5];
        back.position = ccp( size.width / 2, size.height / 2);

        Y = size.height / 2 - 107;
        X = size.width / 2 - 299;

        int y = Y;
        for(int i = 0; i < CNT; i++) {
        
            int j = CCRANDOM_0_1() * SLIDE_TYPES;

            slide[i] = [CCSprite spriteWithFile:[NSString stringWithFormat:@"slotStilistik01-%d.png", j]];
//            slide[i] = [CCSprite spriteWithFile:@"slotStilistik01-5.png"];
            slide[i].position = ccp(X, y);
//            slide[i].scale = 2;
            [self addChild:slide[i] z:2];
            
            y += (SLIDE_HEIGHT + 0);
        }
        
        for(int i = 0; i < CNT; i++) {
            
            NSLog(@"slide %d : %f, %f", i, slide[i].position.x, slide[i].position.y);
            
        }
        NSLog(@"------begin------------------------");
        
        id move = [CCMoveBy actionWithDuration:0.3f position:ccp(0, SLIDE_HEIGHT / 10)];
        move_ease = [[CCEaseOut actionWithAction:[[move copy] autorelease] rate:1.7f] retain];

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
        
        CCSprite *spriteSpin = [CCSprite spriteWithFile:@"Spin.png"];
        CCSprite *spriteSpinSelected = [CCSprite spriteWithFile:@"Spin.png"];
		CCMenuItemSprite *item1 = [CCMenuItemSprite itemWithNormalSprite:spriteSpin selectedSprite:spriteSpinSelected block:^(id sender) {
            
            NSLog(@"Spin clicked!");

            stop1 = false;
            [self performSelector:@selector(stop1) withObject:nil afterDelay:DELAY1];

            [slide[0] runAction:seq1];
            for(int i = 1; i < CNT; i++) {
            
                [slide[i] runAction:
                 [CCSequence actions:
                   CCCA(move_ease),
                   [move_ease reverse],
                   nil]
                 ];
            }
            
		}];
        [item1 setPosition:ccp(890, 90)];

        CCMenu *menu = [CCMenu menuWithItems: item1, nil];
        [self addChild: menu z:7];
		[menu setPosition:ccp(0, 0)];
        
	}
	return self;
}

-(void) stop1 {

    stop1 = true;
}

-(void) callback1 {
    
    NSLog(@"callback1!");

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
    [self addChild:slide[0] z:2];

    CCSprite* s = slide[0];
    for(int i = 0; i < (CNT - 1); i++) {
        
        slide[i] = slide[i + 1];
        slide[i].position = ccp(X, Y + i * SLIDE_HEIGHT);
    }
    slide[CNT - 1] = s;
    
    [self performSelector:@selector(endForward) withObject:nil afterDelay:0.0];

}

-(void) endForward {

    if(stop1) {
        
        for(int i = 0; i < CNT; i++) {
            
            [slide[i] runAction:
             [CCSequence actions:
//              [move_ease reverse],
              CCCA(move_ease),
              [move_ease reverse],
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

// on "dealloc" you need to release all your retained objects
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

