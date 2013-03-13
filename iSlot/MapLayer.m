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
        
        
        NSString* l1 = @"Level01.png";
        CCMenuItemSprite *item1_1= [CCMenuItemSprite itemWithNormalSprite:[CCSprite spriteWithFile:l1] selectedSprite:[CCSprite spriteWithFile:l1] block:^(id sender) { [self level1]; }];
        [item1_1 setPosition:ccplevel(177, 255)];
        CCMenuItemSprite *item1_2= [CCMenuItemSprite itemWithNormalSprite:[CCSprite spriteWithFile:l1] selectedSprite:[CCSprite spriteWithFile:l1] block:^(id sender) { [self level1]; }];
        [item1_2 setPosition:ccplevel(1130, 515)];
        CCMenuItemSprite *item1_3= [CCMenuItemSprite itemWithNormalSprite:[CCSprite spriteWithFile:l1] selectedSprite:[CCSprite spriteWithFile:l1] block:^(id sender) { [self level1]; }];
        [item1_3 setPosition:ccplevel(2571, 98)];
        CCMenuItemSprite *item1_4= [CCMenuItemSprite itemWithNormalSprite:[CCSprite spriteWithFile:l1] selectedSprite:[CCSprite spriteWithFile:l1] block:^(id sender) { [self level1]; }];
        [item1_4 setPosition:ccplevel(3167, 306)];
        
        l1 = @"Level02.png";
        CCMenuItemSprite *item2_1= [CCMenuItemSprite itemWithNormalSprite:[CCSprite spriteWithFile:l1] selectedSprite:[CCSprite spriteWithFile:l1] block:^(id sender) { [self level2]; }];
        [item2_1 setPosition:ccplevel(23, 375)];
        CCMenuItemSprite *item2_2= [CCMenuItemSprite itemWithNormalSprite:[CCSprite spriteWithFile:l1] selectedSprite:[CCSprite spriteWithFile:l1] block:^(id sender) { [self level2]; }];
        [item2_2 setPosition:ccplevel(1348, 228)];
        CCMenuItemSprite *item2_3= [CCMenuItemSprite itemWithNormalSprite:[CCSprite spriteWithFile:l1] selectedSprite:[CCSprite spriteWithFile:l1] block:^(id sender) { [self level2]; }];
        [item2_3 setPosition:ccplevel(2303, 233)];
        CCMenuItemSprite *item2_4= [CCMenuItemSprite itemWithNormalSprite:[CCSprite spriteWithFile:l1] selectedSprite:[CCSprite spriteWithFile:l1] block:^(id sender) { [self level2]; }];
        [item2_4 setPosition:ccplevel(3505, 215)];
        
        l1 = @"Level03.png";
        CCMenuItemSprite *item3_1= [CCMenuItemSprite itemWithNormalSprite:[CCSprite spriteWithFile:l1] selectedSprite:[CCSprite spriteWithFile:l1] block:^(id sender) { [self level3]; }];
        [item3_1 setPosition:ccplevel(390, 490)];
        CCMenuItemSprite *item3_2= [CCMenuItemSprite itemWithNormalSprite:[CCSprite spriteWithFile:l1] selectedSprite:[CCSprite spriteWithFile:l1] block:^(id sender) { [self level3]; }];
        [item3_2 setPosition:ccplevel(1888, 170)];
        CCMenuItemSprite *item3_3= [CCMenuItemSprite itemWithNormalSprite:[CCSprite spriteWithFile:l1] selectedSprite:[CCSprite spriteWithFile:l1] block:^(id sender) { [self level3]; }];
        [item3_3 setPosition:ccplevel(2538, 306)];
        CCMenuItemSprite *item3_4= [CCMenuItemSprite itemWithNormalSprite:[CCSprite spriteWithFile:l1] selectedSprite:[CCSprite spriteWithFile:l1] block:^(id sender) { [self level3]; }];
        [item3_4 setPosition:ccplevel(3844, 463)];
        
        l1 = @"Level04.png";
        CCMenuItemSprite *item4_1= [CCMenuItemSprite itemWithNormalSprite:[CCSprite spriteWithFile:l1] selectedSprite:[CCSprite spriteWithFile:l1] block:^(id sender) { [self level4]; }];
        [item4_1 setPosition:ccplevel(785, 528)];
        CCMenuItemSprite *item4_2= [CCMenuItemSprite itemWithNormalSprite:[CCSprite spriteWithFile:l1] selectedSprite:[CCSprite spriteWithFile:l1] block:^(id sender) { [self level4]; }];
        [item4_2 setPosition:ccplevel(1787, 470)];
        CCMenuItemSprite *item4_3= [CCMenuItemSprite itemWithNormalSprite:[CCSprite spriteWithFile:l1] selectedSprite:[CCSprite spriteWithFile:l1] block:^(id sender) { [self level4]; }];
        [item4_3 setPosition:ccplevel(2149, 507)];
        
        l1 = @"Level05.png";
        CCMenuItemSprite *item5_1= [CCMenuItemSprite itemWithNormalSprite:[CCSprite spriteWithFile:l1] selectedSprite:[CCSprite spriteWithFile:l1] block:^(id sender) { [self level5]; }];
        [item5_1 setPosition:ccplevel(675, 263)];
        CCMenuItemSprite *item5_2= [CCMenuItemSprite itemWithNormalSprite:[CCSprite spriteWithFile:l1] selectedSprite:[CCSprite spriteWithFile:l1] block:^(id sender) { [self level5]; }];
        [item5_2 setPosition:ccplevel(2641, 543)];

        l1 = @"Level06.png";
        CCMenuItemSprite *item6_1= [CCMenuItemSprite itemWithNormalSprite:[CCSprite spriteWithFile:l1] selectedSprite:[CCSprite spriteWithFile:l1] block:^(id sender) { [self level6]; }];
        [item6_1 setPosition:ccplevel(2870, 324)];

        CCMenu* menu = [CCMenu menuWithItems: item1_1, item1_2, item1_3, item1_4,
                        item2_1, item2_2, item2_3, item2_4,
                        item3_1, item3_2, item3_3, item3_4,
                        item4_1, item4_2, item4_3,
                        item5_1, item5_2,
                        item6_1,
                        nil];
        [self addChild: menu z:300];
        [menu setPosition:ccp(0, -74)];

        l1 = @"StarLevelNone";
        
        
	}
	
	return self;
}

-(void) level1 {
    
    
    [[CCDirector sharedDirector] pushScene:[GameLayer scene]];
    
}
-(void) level2 {
}
-(void) level3 {
}
-(void) level4 {
}
-(void) level5 {
}
-(void) level6 {
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
    CCMoveTo *moveTo = [CCMoveTo actionWithDuration:0.5f position:ccp(xx, 0)];
    [self runAction:[CCEaseOut actionWithAction:moveTo rate:1.5f]];

}


@end
