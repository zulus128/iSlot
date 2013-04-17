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
#import "Common.h"

#import "InappLayer.h"

static InappLayer* inlay;
static CCLayerColor* colorLayer;
static CCMenu* menu1;
static MapLayer *layer;

@implementation MapLayer

// Helper class method that creates a Scene with the HelloWorldLayer as the only child.
+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
    colorLayer = [CCLayerColor layerWithColor:ccc4(0, 0, 0, 0)];
    [scene addChild:colorLayer z:555];

    
    CCSprite* top = [CCSprite spriteWithFile:@"UpBar.png"];
    top.position = ccp( 512, 730.5);
    [scene addChild:top z:5];
    
    CCSprite *spback = [CCSprite spriteWithFile:@"SlotBack.png"];
    CCSprite *spback_t1 = [CCSprite spriteWithFile:@"TouchSlotBack.png"];
    CCMenuItemSprite *itemback = [CCMenuItemSprite itemWithNormalSprite:spback selectedSprite:spback_t1 block:^(id sender) {
        
        [[CCDirector sharedDirector] popScene];
        
    }];
    [itemback setPosition:ccp(75, 730)];
    
    CCSprite *spinapp = [CCSprite spriteWithFile:@"SlonInApp.png"];
    CCSprite *spinapp_t1 = [CCSprite spriteWithFile:@"TouchSlonInApp.png"];
    CCMenuItemSprite *iteminapp = [CCMenuItemSprite itemWithNormalSprite:spinapp selectedSprite:spinapp_t1 block:^(id sender) {
    
        [inlay setTab:0];
        [inlay runAction:[CCMoveTo actionWithDuration:0.3f position:ccp(0,0)]];
        colorLayer.opacity = 0;
        CCAction* action = [CCFadeTo actionWithDuration:0.3f opacity:180];
        [colorLayer runAction:action];
        menu1.enabled = NO;
        CCNode* result = [layer getChildByTag:MENU_TAG];
        if(result != nil) {
            ((CCMenu*)result).enabled = NO;
        }


    }];
    [iteminapp setPosition:ccp(443.5, 730)];
    
    CCSprite *spinapp1 = [CCSprite spriteWithFile:@"SlonInApp.png"];
    CCSprite *spinapp1_t1 = [CCSprite spriteWithFile:@"TouchSlonInApp.png"];
    CCMenuItemSprite *iteminapp1 = [CCMenuItemSprite itemWithNormalSprite:spinapp1 selectedSprite:spinapp1_t1 block:^(id sender) {

        [inlay setTab:1];
        [inlay runAction:[CCMoveTo actionWithDuration:0.3f position:ccp(0,0)]];
        colorLayer.opacity = 0;
        CCAction* action = [CCFadeTo actionWithDuration:0.3f opacity:180];
        [colorLayer runAction:action];
        menu1.enabled = NO;
        CCNode* result = [layer getChildByTag:MENU_TAG];
        if(result != nil) {
            ((CCMenu*)result).enabled = NO;
        }


    }];
    [iteminapp1 setPosition:ccp(975.5, 730)];
    
    menu1 = [CCMenu menuWithItems: itemback, iteminapp, iteminapp1, nil];
    [scene addChild: menu1 z:107];
    [menu1 setPosition:ccp(0, 0)];
    
    CCSprite* yluck = [CCSprite spriteWithFile:@"Luck.png"];
    [scene addChild:yluck z:100];
    yluck.position = ccp(633, 730);

    
    labelMoney = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"%d", [Common instance].money] fontName:@"Marker Felt" fontSize:44];
    labelMoney.color = ccc3(0, 0, 0);
    labelMoney.position =  ccp( 300 , 730 );
    [scene addChild: labelMoney z:413];
    
    labelYourLuck = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"%d%%", [Common instance].yourluck] fontName:@"Marker Felt" fontSize:24];
    labelYourLuck.position =  ccp( 637 , 720 );
    [scene addChild: labelYourLuck z:413];

    
    inlay = [InappLayer node];
    inlay.position = ccp(1024, 0);
    
	layer = [MapLayer node];
	[scene addChild: layer];
	
    [scene addChild: inlay z:556];

	return scene;
}

//
-(id) init
{
	if( (self=[super init])) {
        
//        CGSize screenSize = [CCDirector sharedDirector].winSize;

        self.touchEnabled = YES;
        
        
        inlay.player = self;

        
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

        menu = [CCMenu menuWithItems: item1_1, item1_2, item1_3, item1_4,
                        item2_1, item2_2, item2_3, item2_4,
                        item3_1, item3_2, item3_3, item3_4,
                        item4_1, item4_2, item4_3,
                        item5_1, item5_2,
                        item6_1,
                        nil];
        [self addChild: menu z:300];
        menu.tag = MENU_TAG;
        [menu setPosition:ccp(0, -74)];


        [self refreshLabels];

	}
	
	return self;
}

-(void) toTop {
    
    CCAction* action = [CCFadeTo actionWithDuration:0.3f opacity:0];
    [colorLayer runAction:action];
    [inlay runAction:[CCMoveTo actionWithDuration:0.3f position:ccp(1024,0)]];
    menu1.enabled = YES;
    CCNode* result = [layer getChildByTag:MENU_TAG];
    if(result != nil) {
        ((CCMenu*)result).enabled = YES;
    }

}

-(void) level1 {
    
    [Common instance].curlevel = 1;
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

- (void) refreshLabels {
    
    [labelMoney setString:[NSString stringWithFormat:@"%d", [Common instance].money]];
    [labelYourLuck setString:[NSString stringWithFormat:@"%d%%", [Common instance].yourluck]];
 
    NSString* l1 = @"StarLevelNone.png";
    int t1 = [[Common instance] getStarsForLevel:1];
    switch (t1) {
        case 0:
            l1 = @"StarLevelNone.png";
            break;
        case 1:
            l1 = @"StarLevelOne.png";
            break;
        case 2:
            l1 = @"StarLevelTwo.png";
            break;
        case 3:
            l1 = @"StarLevelTree.png";
            break;
        default:
            l1 = @"StarLevelNone.png";
            break;
    }
    CCSprite *star1_1 = [CCSprite spriteWithFile:l1];
    star1_1.position = ccpstar(165, 325);
    [self addChild:star1_1 z:302];
    //        CCSprite *star1_2 = [CCSprite spriteWithFile:l1];
    //        star1_2.position = ccpstar(1118, 585);
    //        [self addChild:star1_2 z:302];
    //        CCSprite *star1_3 = [CCSprite spriteWithFile:l1];
    //        star1_3.position = ccpstar(2559, 168);
    //        [self addChild:star1_3 z:302];
    //        CCSprite *star1_4 = [CCSprite spriteWithFile:l1];
    //        star1_4.position = ccpstar(3155, 376);
    //        [self addChild:star1_4 z:302];
    
    t1 = [[Common instance] getStarsForLevel:2];
    switch (t1) {
        case 0:
            l1 = @"StarLevelNone.png";
            break;
        case 1:
            l1 = @"StarLevelOne.png";
            break;
        case 2:
            l1 = @"StarLevelTwo.png";
            break;
        case 3:
            l1 = @"StarLevelTree.png";
            break;
        default:
            l1 = @"StarLevelNone.png";
            break;
    }
    CCSprite *star2_1 = [CCSprite spriteWithFile:l1];
    star2_1.position = ccpstar(11, 445);
    [self addChild:star2_1 z:302];
    
    t1 = [[Common instance] getStarsForLevel:3];
    switch (t1) {
        case 0:
            l1 = @"StarLevelNone.png";
            break;
        case 1:
            l1 = @"StarLevelOne.png";
            break;
        case 2:
            l1 = @"StarLevelTwo.png";
            break;
        case 3:
            l1 = @"StarLevelTree.png";
            break;
        default:
            l1 = @"StarLevelNone.png";
            break;
    }
    CCSprite *star3_1 = [CCSprite spriteWithFile:l1];
    star3_1.position = ccpstar(378, 560);
    [self addChild:star3_1 z:302];
    
    t1 = [[Common instance] getStarsForLevel:4];
    switch (t1) {
        case 0:
            l1 = @"StarLevelNone.png";
            break;
        case 1:
            l1 = @"StarLevelOne.png";
            break;
        case 2:
            l1 = @"StarLevelTwo.png";
            break;
        case 3:
            l1 = @"StarLevelTree.png";
            break;
        default:
            l1 = @"StarLevelNone.png";
            break;
    }
    CCSprite *star4_1 = [CCSprite spriteWithFile:l1];
    star4_1.position = ccpstar(775, 598);
    [self addChild:star4_1 z:302];
    
    t1 = [[Common instance] getStarsForLevel:5];
    switch (t1) {
        case 0:
            l1 = @"StarLevelNone.png";
            break;
        case 1:
            l1 = @"StarLevelOne.png";
            break;
        case 2:
            l1 = @"StarLevelTwo.png";
            break;
        case 3:
            l1 = @"StarLevelTree.png";
            break;
        default:
            l1 = @"StarLevelNone.png";
            break;
    }
    CCSprite *star5_1 = [CCSprite spriteWithFile:l1];
    star5_1.position = ccpstar(663, 333);
    [self addChild:star5_1 z:302];
    
    l1 = @"LockLevel.png";
    CCSprite *lock2_1 = [CCSprite spriteWithFile:l1];
    lock2_1.position = ccplock(23, 375);
    [self addChild:lock2_1 z:309];
    CCSprite *lock3_1 = [CCSprite spriteWithFile:l1];
    lock3_1.position = ccplock(390, 490);
    [self addChild:lock3_1 z:309];
    CCSprite *lock4_1 = [CCSprite spriteWithFile:l1];
    lock4_1.position = ccplock(785, 528);
    [self addChild:lock4_1 z:309];
    CCSprite *lock5_1 = [CCSprite spriteWithFile:l1];
    lock5_1.position = ccplock(675, 263);
    [self addChild:lock5_1 z:309];
    

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
    CCMoveTo *moveTo = [CCMoveTo actionWithDuration:0.6f position:ccp(xx, 0)];
    [self runAction:[CCEaseOut actionWithAction:moveTo rate:1.7f]];

}

- (void) onEnter {
    
    [super onEnter];
    
    [self refreshLabels];
}

@end
