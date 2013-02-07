//
//  GameLayer.m
//  iSlot
//
//  Created by Zul on 2/7/13.
//  Copyright (c) 2013 Zul. All rights reserved.
//

#import "GameLayer.h"

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
	
        
        
        CCSprite* s1 = [CCSprite spriteWithFile:[NSString stringWithFormat:@"slotStilistik01-%d.png", 2] rect:CGRectMake(0,0,156,144)];
        s1.position = ccp(100, 100);
        [self addChild:s1];
        CCSprite* s2 = [CCSprite spriteWithFile:[NSString stringWithFormat:@"slotStilistik01-%d.png", 3]];
        s2.position = ccp(100, 200);
        [self addChild:s2];
        
//        int y = 100;//size.height / 2 - 300;
//        int x = 100;//size.width / 2 - 78;
//        for(int i = 0; i < CNT; i++) {
//        
//            slide[i] = [CCSprite spriteWithFile:[NSString stringWithFormat:@"slotStilistik01-%d.png", i]];
////            slide[i] = [CCSprite spriteWithFile:@"slotStilistik01-5.png"];
//            slide[i].position = ccp(x, y);
//            [self addChild:slide[i]];
//            
//            y += 144;
//        }
        
	}
	return self;
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

