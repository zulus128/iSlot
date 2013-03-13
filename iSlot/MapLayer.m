//
//  IntroLayer.m
//  iSlot
//
//  Created by Zul on 2/6/13.
//  Copyright Zul 2013. All rights reserved.
//


// Import the interfaces
#import "MapLayer.h"
#import "GameLayer.h"

@implementation MapLayer

// Helper class method that creates a Scene with the HelloWorldLayer as the only child.
+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
    
    CCSprite* top = [CCSprite spriteWithFile:@"UpBar.png"];
    top.position = ccp( 512, 730.5);
    [scene addChild:top z:5];
    
    CCSprite *spback = [CCSprite spriteWithFile:@"SlotBack.png"];
    CCSprite *spback_t1 = [CCSprite spriteWithFile:@"TouchSlotBack.png"];
    CCMenuItemSprite *itemback = [CCMenuItemSprite itemWithNormalSprite:spback selectedSprite:spback_t1 block:^(id sender) {
        
        [[CCDirector sharedDirector] popScene];
        
    }];
    [itemback setPosition:ccp(75, 730)];

    CCMenu* menu = [CCMenu menuWithItems: itemback, nil];
    [scene addChild: menu z:107];
    [menu setPosition:ccp(0, 0)];
    
	// 'layer' is an autorelease object.
	MapLayer *layer = [MapLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

//
-(id) init
{
	if( (self=[super init])) {
        
//        CGSize screenSize = [CCDirector sharedDirector].winSize;

        self.touchEnabled = YES;
        
        
        
        CCSprite *fon = [CCSprite spriteWithFile:@"FonMapLevel01_1.png"];
        fon.position = ccp(1024, 346);
        [self addChild:fon z:6];
        
        CCSprite *fon1 = [CCSprite spriteWithFile:@"FonMapLevel01_2.png"];
        fon1.position = ccp(3072, 346);
        [self addChild:fon1 z:6];
        
        
        CCSprite *l1_1= [CCSprite spriteWithFile:@"Level01.png"];
        CCSprite *l1_t1 = [CCSprite spriteWithFile:@"Level01.png"];
        CCSprite *l1_2= [CCSprite spriteWithFile:@"Level01.png"];
        CCSprite *l1_t2 = [CCSprite spriteWithFile:@"Level01.png"];
        CCSprite *l1_3= [CCSprite spriteWithFile:@"Level01.png"];
        CCSprite *l1_t3 = [CCSprite spriteWithFile:@"Level01.png"];
        CCSprite *l1_4= [CCSprite spriteWithFile:@"Level01.png"];
        CCSprite *l1_t4 = [CCSprite spriteWithFile:@"Level01.png"];
        
        CCMenuItemSprite *item1_1= [CCMenuItemSprite itemWithNormalSprite:l1_1 selectedSprite:l1_t1 block:^(id sender) { [self level1]; }];
        [item1_1 setPosition:ccp(234.5, 457.5)];
        CCMenuItemSprite *item1_2= [CCMenuItemSprite itemWithNormalSprite:l1_2 selectedSprite:l1_t2 block:^(id sender) { [self level1]; }];
        [item1_2 setPosition:ccp(1187.5, 197.5)];
        CCMenuItemSprite *item1_3= [CCMenuItemSprite itemWithNormalSprite:l1_3 selectedSprite:l1_t3 block:^(id sender) { [self level1]; }];
        [item1_3 setPosition:ccp(2628.5, 614.5)];
        CCMenuItemSprite *item1_4= [CCMenuItemSprite itemWithNormalSprite:l1_4 selectedSprite:l1_t4 block:^(id sender) { [self level1]; }];
        [item1_4 setPosition:ccp(3224.5, 406.5)];
        
        CCMenu* menu = [CCMenu menuWithItems: item1_1, item1_2, item1_3, item1_4, nil];
        [self addChild: menu z:300];
        [menu setPosition:ccp(0, -74)];

        
	}
	
	return self;
}

-(void) level1 {


    [[CCDirector sharedDirector] pushScene:[GameLayer scene]];
 
}

-(void) ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{

    UITouch *touch =[touches anyObject];
    CGPoint point = [touch locationInView:[touch view]];
    point = [[CCDirector sharedDirector]convertToGL:point];

    x0 = point.x;
    xl0 = self.position.x;
}

-(void) ccTouchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{

    UITouch *touch =[touches anyObject];
    CGPoint point = [touch locationInView:[touch view]];
    point = [[CCDirector sharedDirector]convertToGL:point];
    
//    NSLog(@"moved x = %f, y = %f", point.x, point.y);

    float delta = point.x - x0;
    float xx = xl0 + delta;
    if(xx > 0)
        xx = 0;
    if(xx < -3072)
        xx = -3072;
//    NSLog(@"xx = %f", xx);
    self.position = ccp(xx, 0);
}

-(void) ccTouchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    
//    NSLog(@"ccTouchesEnded");
    UITouch *touch =[touches anyObject];
    CGPoint point = [touch locationInView:[touch view]];
    point = [[CCDirector sharedDirector]convertToGL:point];

    float delta = (point.x - x0) * 2;
    float xx = xl0 + delta;
    if(xx > 0)
        xx = 0;
    if(xx < -3072)
        xx = -3072;
    //    NSLog(@"xx = %f", xx);
//    self.position = ccp(xx, 0);
   
    [self stopAllActions];
    CCMoveTo *moveTo = [CCMoveTo actionWithDuration:0.3f position:ccp(xx, 0)];
    [self runAction:[CCEaseOut actionWithAction:moveTo rate:1.5f]];

}


@end
