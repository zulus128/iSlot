//
//  GameLayer.m
//  iSlot
//
//  Created by Zul on 2/7/13.
//  Copyright (c) 2013 Zul. All rights reserved.
//

#import "GameLayer.h"
#import "Bar.h"
#import "Common.h"

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
		
		CGSize size = [[CCDirector sharedDirector] winSize];

        [Common instance].speed = SPEED1;
		label = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"%.2f", [Common instance].speed] fontName:@"Marker Felt" fontSize:24];
		label.position =  ccp( size.width /2 , 40 );
		[self addChild: label z:100];
	
        CCSprite* back = [CCSprite spriteWithFile:@"FonSlot01.png"];
        [self addChild:back z:5];
        back.position = ccp( size.width / 2, size.height / 2);

        int y = size.height / 2 - 107;
        int x = size.width / 2 - 299;

        Bar* bar1 = [[Bar alloc] initWithLayer:self X:x Y:y Delay:DELAY1];
        Bar* bar2 = [[Bar alloc] initWithLayer:self X:(x + 150) Y:y Delay:DELAY2];
        Bar* bar3 = [[Bar alloc] initWithLayer:self X:(x + 300) Y:y Delay:DELAY3];
        Bar* bar4 = [[Bar alloc] initWithLayer:self X:(x + 450) Y:y Delay:DELAY4];
        Bar* bar5 = [[Bar alloc] initWithLayer:self X:(x + 600) Y:y Delay:DELAY5];
        
        CCSprite *spriteSpin = [CCSprite spriteWithFile:@"Spin.png"];
        CCSprite *spriteSpinSelected = [CCSprite spriteWithFile:@"TouchSpin.png"];
		CCMenuItemSprite *item1 = [CCMenuItemSprite itemWithNormalSprite:spriteSpin selectedSprite:spriteSpinSelected block:^(id sender) {
            
//            NSLog(@"Spin clicked! finished = %d", [Common instance].finished);
            if([Common instance].finished == 0) {

                [Common instance].finished = 5 * CNT;
                
                [bar1 start];
                [bar2 start];
                [bar3 start];
                [bar4 start];
                [bar5 start];
            }
            
		}];
        
        [item1 setPosition:ccp(890, 90)];
        
        CCLabelTTF* labelplus = [CCLabelTTF labelWithString:@"+" fontName:@"Marker Felt" fontSize:25];
        CCMenuItemLabel* item2 = [CCMenuItemLabel itemWithLabel:labelplus target:self selector:@selector(speedPlus)];
        CCLabelTTF* labelminus = [CCLabelTTF labelWithString:@"-" fontName:@"Marker Felt" fontSize:25];
        CCMenuItemLabel* item3 = [CCMenuItemLabel itemWithLabel:labelminus target:self selector:@selector(speedMinus)];

        [item2 setPosition:ccp(size.width / 2 - 40, 40)];
        [item3 setPosition:ccp(size.width / 2 + 40, 40)];

        CCMenu *menu = [CCMenu menuWithItems: item1, item2, item3, nil];
        [self addChild: menu z:7];
		[menu setPosition:ccp(0, 0)];

	}
	return self;
}

- (void) speedPlus {
    
    [Common instance].speed += 0.01;
    if([Common instance].speed > 1)
        [Common instance].speed = 1;
    
    [label setString:[NSString stringWithFormat:@"%.2f", [Common instance].speed]];
}

- (void) speedMinus {
    
    [Common instance].speed -= 0.01;
    if([Common instance].speed < 0.01)
        [Common instance].speed = 0.01f;
    
    [label setString:[NSString stringWithFormat:@"%.2f", [Common instance].speed]];
}

// on "dealloc" you need to release all your retained objects
- (void) dealloc {
    
	// in case you have something to dealloc, do it in this method
	// in this particular example nothing needs to be released.
	// cocos2d will automatically release all the children (Label)
	
	// don't forget to call "super dealloc"
    
    
	[super dealloc];
}

@end

