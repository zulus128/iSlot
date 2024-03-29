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
#import "ShopLayer.h"

#import "AppDelegate.h"

static InappLayer* inlay;
static ShopLayer* shoplay;
static CCLayerColor* colorLayer;
static CCMenu* menu1;
static MapLayer *layer;

static CCSprite *luck1;
static CCSprite *luck2;
static CCSprite *luck3;
static int tt;
static CCScene *scene;

@implementation MapLayer

// Helper class method that creates a Scene with the HelloWorldLayer as the only child.
+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	scene = [CCScene node];
	
    colorLayer = [CCLayerColor layerWithColor:ccc4(0, 0, 0, 0)];
    [scene addChild:colorLayer z:555];

    inlay = [InappLayer node];
    inlay.position = ccp(1024, 0);

    shoplay = [ShopLayer node];
    shoplay.position = ccp(0, 0);
    shoplay.opacity = 0;

	
    layer = [MapLayer node];

    
    CCSprite* top = [CCSprite spriteWithFile:@"UpBar.png"];
    top.position = ccp( 512, 730.5);
    [scene addChild:top z:5];
    
    luck1 = [CCSprite spriteWithFile:@"listLuck01.png"];
    luck1.position = ccp(634.5, 688);
    luck1.opacity = 0;
    luck1.tag = LUCK_TAG1;
    [scene addChild:luck1 z:100];
    luck2 = [CCSprite spriteWithFile:@"listLuck02.png"];
    luck2.position = ccp(634.5, 624);
    luck2.opacity = 0;
    luck2.tag = LUCK_TAG1;
    [scene addChild:luck2 z:100];
    luck3 = [CCSprite spriteWithFile:@"listLuck03.png"];
    luck3.position = ccp(634.5, 566);
    luck3.opacity = 0;
    luck3.tag = LUCK_TAG1;
    [scene addChild:luck3 z:100];
    
    CCSprite *spback = [CCSprite spriteWithFile:@"SlotBack.png"];
    CCSprite *spback_t1 = [CCSprite spriteWithFile:@"TouchSlotBack.png"];
    CCMenuItemSprite *itemback = [CCMenuItemSprite itemWithNormalSprite:spback selectedSprite:spback_t1 block:^(id sender) {
        
        [[CCDirector sharedDirector] popScene];
        
    }];
    [itemback setPosition:ccp(75, 730)];
    
    CCSprite *spinapp = [CCSprite spriteWithFile:@"SlonInApp.png"];
    CCSprite *spinapp_t1 = [CCSprite spriteWithFile:@"TouchSlonInApp.png"];
    CCMenuItemSprite *iteminapp = [CCMenuItemSprite itemWithNormalSprite:spinapp selectedSprite:spinapp_t1 block:^(id sender) {
    
        [self showSlon];

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
        CCNode* result = [layer getChildByTag:MENU_TAG1];
        if(result != nil) {
            ((CCMenu*)result).enabled = NO;
        }


    }];
    [iteminapp1 setPosition:ccp(975.5, 730)];
    
    CCSprite *spgc = [CCSprite spriteWithFile:@"GameCenter.png"];
    CCSprite *spgc_t1 = [CCSprite spriteWithFile:@"TouchGameCenter.png"];
    CCMenuItemSprite *itemgc = [CCMenuItemSprite itemWithNormalSprite:spgc selectedSprite:spgc_t1 block:^(id sender) {
        
        GKLeaderboardViewController *leaderboardViewController = [[GKLeaderboardViewController alloc] init];
        leaderboardViewController.leaderboardDelegate = layer;
        
        AppController *app = (AppController*) [[UIApplication sharedApplication] delegate];
        
        [[app navController] presentModalViewController:leaderboardViewController animated:YES];
        
        [leaderboardViewController release];
    }];
    [itemgc setPosition:ccp(525, 730)];

    CCSprite *spshop = [CCSprite spriteWithFile:@"Shop.png"];
    CCSprite *spshop_t1 = [CCSprite spriteWithFile:@"TouchShop.png"];
    CCMenuItemSprite *itemshop = [CCMenuItemSprite itemWithNormalSprite:spshop selectedSprite:spshop_t1 block:^(id sender) {
        
        colorLayer.opacity = 0;
        CCAction* action = [CCFadeTo actionWithDuration:0.3f opacity:180];
        [colorLayer runAction:action];
        menu1.enabled = NO;
        
        [shoplay show];
        
    }];
    [itemshop setPosition:ccp(740, 730)];
    
    CCSprite *spluck = [CCSprite spriteWithFile:@"Luck.png"];
    CCSprite *spluck_t1 = [CCSprite spriteWithFile:@"TouchLuck.png"];
    CCMenuItemSprite *itemluck = [CCMenuItemSprite itemWithNormalSprite:spluck selectedSprite:spluck_t1 block:^(id sender) {
        
//        NSLog(@"luck");
        if(luck1.opacity > 0) {
            
            [self hideLuckList];
            
        }
        else {
            
            [self showLuckList];
        }

    }];
    [itemluck setPosition:ccp(633, 730)];
    
    menu1 = [CCMenu menuWithItems: itemback, iteminapp, iteminapp1, itemgc, itemshop, itemluck, nil];
    [scene addChild: menu1 z:107];
    [menu1 setPosition:ccp(0, 0)];
    
//    CCSprite* yluck = [CCSprite spriteWithFile:@"Luck.png"];
//    [scene addChild:yluck z:100];
//    yluck.position = ccp(633, 730);

    
    labelMoney = [[CCLabelTTF labelWithString:[NSString stringWithFormat:@"%d", [Common instance].money] fontName:MAINFONT fontSize:44] retain];
    labelMoney.color = ccc3(0, 0, 0);
    labelMoney.position =  ccp( 300 , 730 - MONEY_Y_CORRECTION);
    [scene addChild: labelMoney z:413];
    
    labelKeys = [[CCLabelTTF labelWithString:[NSString stringWithFormat:@"%d", [Common instance].keys] fontName:MAINFONT fontSize:44]retain];
    labelKeys.color = ccc3(0, 0, 0);
    labelKeys.position =  ccp( 900 , 730 - MONEY_Y_CORRECTION);
    [scene addChild: labelKeys z:413];

    labelYourLuck = [[CCLabelTTF labelWithString:[NSString stringWithFormat:@"%d%%", [Common instance].yourluck] fontName:MAINFONT fontSize:24]retain];
    labelYourLuck.position =  ccp( 637 , 720 );
    labelYourLuck.color = BEJ_COLOR;
    [scene addChild: labelYourLuck z:413];

    
	
    [scene addChild: layer];

    [scene addChild: inlay z:556];
    [scene addChild: shoplay z:556];

	return scene;
}

+ (void) showSlon {
    
    [inlay setTab:0];
    [inlay runAction:[CCMoveTo actionWithDuration:0.3f position:ccp(0,0)]];
    colorLayer.opacity = 0;
    CCAction* action = [CCFadeTo actionWithDuration:0.3f opacity:180];
    [colorLayer runAction:action];
    menu1.enabled = NO;
    CCNode* result = [layer getChildByTag:MENU_TAG1];
    if(result != nil) {
        ((CCMenu*)result).enabled = NO;
    }
    
}

- (void) showSlon {
    
    [inlay setTab:0];
    [inlay runAction:[CCMoveTo actionWithDuration:0.3f position:ccp(0,0)]];
    colorLayer.opacity = 0;
    CCAction* action = [CCFadeTo actionWithDuration:0.3f opacity:180];
    [colorLayer runAction:action];
    menu1.enabled = NO;
    CCNode* result = [layer getChildByTag:MENU_TAG1];
    if(result != nil) {
        ((CCMenu*)result).enabled = NO;
    }
    
}

+ (void) showLuckList {
    
    yfrm = 640;
    NSArray* arr = [Common instance].lucks;
    tt = LUCK_TAG2;
    
    if(arr.count == 0) {
        
        CCSprite* frm = [CCSprite spriteWithFile:@"fonListLuck.png"];
        frm.position = ccp(634.5, 664.5 - 36 + 8);
        //        [frm setScaleX: 169/170];
        [frm setScaleY: 71.0f/frm.contentSize.height];
        frm.opacity = 0;
        frm.tag = tt++;
        [scene addChild:frm z:98];
        
        [luck2 setScaleY: 45 / 67.0f];
        luck2.position = ccp(634.5, 642.5);
        luck3.position = ccp(634.5, 664.5 - 45 - 16.5);
        
        CCLabelTTF* label51 = [CCLabelTTF labelWithString:@"No Luck" fontName:MAINFONT fontSize:24];
        label51.position =  ccp(635, 664.5 - 22.5);
        label51.color = ccc3(0, 0, 0);
        label51.tag = tt++;
        [scene addChild: label51 z:98];
        
        yfrm -= 44;
    }
    else {
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        NSNumber* nu;
        NSMutableArray* arr1 = [NSMutableArray array];
        NSMutableArray* arr2 = [NSMutableArray arrayWithArray:arr];
        while (arr2.count > 0) {
            int min = 1e10;
            int ind = 0;
            for(int i = 0; i < arr2.count; i++){
                
                NSNumber* n = [arr2 objectAtIndex:i];
                switch (n.intValue) {
                    case 5:
                        nu = [userDefaults valueForKey:@"luck5"];
                        break;
                    case 10:
                        nu = [userDefaults valueForKey:@"luck10"];
                        break;
                    case 20:
                        nu = [userDefaults valueForKey:@"luck20"];
                        break;
                    case 25:
                        nu = [userDefaults valueForKey:@"luck25"];
                        break;
                    case 35:
                        nu = [userDefaults valueForKey:@"luck35"];
                        break;
                    case 50:
                        nu = [userDefaults valueForKey:@"luck50"];
                        break;
                }
                
                if(nu.intValue < min) {
                    
                    min = nu.intValue;
                    ind = i;
                }
            }
            
            [arr1 addObject:[arr2 objectAtIndex:ind]];
            [arr2 removeObjectAtIndex:ind];
        }
        
        NSString* sss = @"itemListLuck01.png";
        NSString* sss1 = @"---";
        for(NSNumber* n in arr1){
            
            switch (n.intValue) {
                case 5:
                    sss = @"itemListLuck01.png";
                    nu = [userDefaults valueForKey:@"luck5"];
                    int mins = nu.intValue / 60;
                    int hrs = mins / 60;
                    sss1 = [NSString stringWithFormat:@"%d %@", (hrs > 0)?hrs:mins, (hrs > 0)?@"hour":@"minutes"];
                    break;
                case 10:
                    sss = @"itemListLuck02.png";
                    nu = [userDefaults valueForKey:@"luck10"];
                    mins = nu.intValue / 60;
                    hrs = mins / 60;
                    sss1 = [NSString stringWithFormat:@"%d %@", (hrs > 0)?hrs:mins, (hrs > 0)?@"hour":@"minutes"];
                    break;
                case 20:
                    sss = @"itemListLuck03.png";
                    nu = [userDefaults valueForKey:@"luck20"];
                    mins = nu.intValue / 60;
                    hrs = mins / 60;
                    sss1 = [NSString stringWithFormat:@"%d %@", (hrs > 0)?hrs:mins, (hrs > 0)?@"hour":@"minutes"];
                    break;
                case 25:
                    sss = @"itemListLuck04.png";
                    nu = [userDefaults valueForKey:@"luck25"];
                    mins = nu.intValue / 60;
                    hrs = mins / 60;
                    sss1 = [NSString stringWithFormat:@"%d %@", (hrs > 0)?hrs:mins, (hrs > 0)?@"hour":@"minutes"];
                    break;
                case 35:
                    sss = @"itemListLuck05.png";
                    nu = [userDefaults valueForKey:@"luck35"];
                    mins = nu.intValue / 60;
                    hrs = mins / 60;
                    sss1 = [NSString stringWithFormat:@"%d %@", (hrs > 0)?hrs:mins, (hrs > 0)?@"hour":@"minutes"];
                    break;
                case 50:
                    sss = @"itemListLuck06.png";
                    nu = [userDefaults valueForKey:@"luck50"];
                    mins = nu.intValue / 60;
                    hrs = mins / 60;
                    sss1 = [NSString stringWithFormat:@"%d %@", (hrs > 0)?hrs:mins, (hrs > 0)?@"hour":@"minutes"];
                    break;
            }
            if( nu.intValue <=0 )
                continue;
            
            CCSprite* frm = [CCSprite spriteWithFile:@"fonItemListLuck.png"];
            frm.position = ccp(634.5, yfrm);
            frm.opacity = 0;
            frm.tag = tt++;
            [scene addChild:frm z:98];
            
//            CCSprite* lck2 = [CCSprite spriteWithFile:@"listLuck02.png" /*rect:CGRectMake(634.5, yfrm, 209, 67)*/];
//            lck2.position = ccp(634.5, yfrm);
//            [lck2 setScaleY: 67/lck2.contentSize.height];
//            lck2.opacity = 0;
//            lck2.tag = tt++;
//            [scene addChild:lck2 z:99];
            
            CCSprite* lft = [CCSprite spriteWithFile:sss];
            lft.position = ccp(589, yfrm);
            lft.opacity = 0;
            lft.tag = tt++;
            [scene addChild:lft z:98];
            
            float x = 670;
            int f = 16;
            CCLabelTTF* label5 = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"Luck: +%d", n.intValue] fontName:MAINFONT fontSize:f];
            label5.position =  ccp(x, yfrm + 15);
            label5.color = ccc3(0, 0, 0);
            label5.tag = tt++;
            [scene addChild: label5 z:98];
            CCLabelTTF* label51 = [CCLabelTTF labelWithString:@"Duration:" fontName:MAINFONT fontSize:f];
            label51.position =  ccp(x, yfrm - 5);
            label51.color = ccc3(0, 0, 0);
            label51.tag = tt++;
            [scene addChild: label51 z:98];
            CCLabelTTF* label52 = [CCLabelTTF labelWithString:sss1 fontName:MAINFONT fontSize:f];
            label52.position =  ccp(x, yfrm - 20);
            label52.color = ccc3(0, 0, 0);
            label52.tag = tt++;
            [scene addChild: label52 z:98];
            
            
            yfrm -= 67;
        }
    
        float sc = (45 + 67 * (arr.count - 1)) / 67.0f;
        [luck2 setScaleY: sc];
        luck2.position = ccp(634.5, 642.5 - 33.5 * (arr.count - 1));
        
        //    luck2.position = ccp(634.5, 642.5 );
        luck3.position = ccp(634.5, yfrm + 30);
    }
    
    int cnt = 0;
    for(CCNode *aChildNode in scene.children)
        if((aChildNode.tag >= LUCK_TAG2) || (aChildNode.tag == LUCK_TAG1)) {
            [aChildNode runAction:[CCFadeIn actionWithDuration:Ldelay]];
            cnt++;
        }
    NSLog(@"cnt show = %d", cnt);
    
}

+ (void) hideLuckList {
    
    for(CCNode *aChildNode in scene.children)
        if((aChildNode.tag >= LUCK_TAG2) || (aChildNode.tag == LUCK_TAG1))
            [aChildNode runAction:[CCFadeOut actionWithDuration:Ldelay]];
    
    [self performSelector:@selector(hideLuckList1) withObject:nil afterDelay:Ldelay * 2];
    
}

+ (void) hideLuckList1 {
    
    luck1.opacity = 0;
    luck2.opacity = 0;
    luck3.opacity = 0;
    
    
    for(int i = LUCK_TAG2; i < tt; i++)
        [scene removeChildByTag:i cleanup:YES];
    
}

- (void) hideLuckList {
    
    for(CCNode *aChildNode in scene.children)
        if((aChildNode.tag >= LUCK_TAG2) || (aChildNode.tag == LUCK_TAG1))
            [aChildNode runAction:[CCFadeOut actionWithDuration:Ldelay]];
    
    [self performSelector:@selector(hideLuckList1) withObject:nil afterDelay:Ldelay * 2];
    
}

- (void) hideLuckList1 {
    
    luck1.opacity = 0;
    luck2.opacity = 0;
    luck3.opacity = 0;
    
    
    for(int i = LUCK_TAG2; i < tt; i++)
        [scene removeChildByTag:i cleanup:YES];
    
}


-(void) leaderboardViewControllerDidFinish:(GKLeaderboardViewController *)viewController
{
	AppController *app = (AppController*) [[UIApplication sharedApplication] delegate];
	[[app navController] dismissModalViewControllerAnimated:YES];
}

//- (CCLayer*)layerWithChapterNumber:(int)chapterNumber
//                        screenSize:(CGSize)screenSize {
//    
//    CCLayer *layer = [[CCLayer alloc] init];
//    NSString *s = chapterNumber == 1?@"PresentButton.png":@"FutureButton.png";
//    CCMenuItemImage *image = [CCMenuItemImage itemFromNormalImage:s
//                                                    selectedImage:s
//                                                           target:self
//                                                         selector:@selector(onSelectChapter:)];
//    image.tag = chapterNumber;
//    CCMenu *mmenu = [CCMenu menuWithItems: image, nil];
//    mmenu.tag = MENU_TAG;
//    [layer addChild: mmenu];
//    
//    if(chapterNumber == 1) {
//        
//        image.isEnabled = NO;
//        
//        CCSprite *spfb = [CCSprite spriteWithFile:@"LockLevel.png"];
//        spfb.position = ccp(520, 380);
//        [layer addChild:spfb];
//        
//    }
//    
//    return layer;
//}

-(id) init {
    
	if( (self=[super init])) {
        
//        CGSize screenSize = [CCDirector sharedDirector].winSize;

        self.touchEnabled = YES;
        
        inlay.player = self;
        shoplay.player = self;

        CCSprite *fon = [CCSprite spriteWithFile:@"FonMapLevel01_1.png"];
        fon.position = ccp(1024, 346);
        [self addChild:fon z:6];
        
        CCSprite *fon1 = [CCSprite spriteWithFile:@"FonMapLevel01_2.png"];
        fon1.position = ccp(3072, 346);
        [fon1 setOpacity: 127];
        [self addChild:fon1 z:6];
        
//        arealock1 = [CCSprite spriteWithFile:@"LockArea01.png"];
//        arealock1.position = ccp(1526, 346);
//        [self addChild:arealock1 z:316];
//        arealock2 = [CCSprite spriteWithFile:@"LockArea02.png"];
//        arealock2.position = ccp(2603.5, 346);
//        [self addChild:arealock2 z:316];
//        arealock3 = [CCSprite spriteWithFile:@"LockArea03.png"];
//        arealock3.position = ccp(3544.5, 346);
//        [self addChild:arealock3 z:316];
        
        oreol = [CCSprite spriteWithFile:@"oreol.png"];
//        oreol.position = ccp(-10000, -10000);
        oreol.position = ccplevel(177, 255);
        [self addChild:oreol z:298];
        [self performSelector:@selector(orerot) withObject:nil afterDelay:0];

        
        NSString* l1 = @"Level01.png";
//        CCMenuItemSprite *item1_1= [CCMenuItemSprite itemWithNormalSprite:[CCSprite spriteWithFile:l1] selectedSprite:[CCSprite spriteWithFile:l1] block:^(id sender) { [self level]; }];
        CCMenuItemSprite *item1_1= [CCMenuItemSprite itemWithNormalSprite:[CCSprite spriteWithFile:l1] selectedSprite:[CCSprite spriteWithFile:l1] target:self selector:@selector(level:)];
        item1_1.tag = 11;
        [item1_1 setPosition:ccplevel(177, 255)];
        CCMenuItemSprite *item1_2= [CCMenuItemSprite itemWithNormalSprite:[CCSprite spriteWithFile:l1] selectedSprite:[CCSprite spriteWithFile:l1] target:self selector:@selector(level:)];
        item1_2.tag = 21;
        [item1_2 setPosition:ccplevel(1130, 515)];
        CCMenuItemSprite *item1_3= [CCMenuItemSprite itemWithNormalSprite:[CCSprite spriteWithFile:l1] selectedSprite:[CCSprite spriteWithFile:l1] target:self selector:@selector(level:)];
        item1_3.tag = 31;
        [item1_3 setPosition:ccplevel(2571, 98)];
        CCMenuItemSprite *item1_4= [CCMenuItemSprite itemWithNormalSprite:[CCSprite spriteWithFile:l1] selectedSprite:[CCSprite spriteWithFile:l1] target:self selector:@selector(level:)];
        item1_4.tag = 41;
        [item1_4 setPosition:ccplevel(3167, 306)];
        
        l1 = @"Level02.png";
        CCMenuItemSprite *item2_1= [CCMenuItemSprite itemWithNormalSprite:[CCSprite spriteWithFile:l1] selectedSprite:[CCSprite spriteWithFile:l1] target:self selector:@selector(level:)];
        item2_1.tag = 12;
        [item2_1 setPosition:ccplevel(23, 375)];
        CCMenuItemSprite *item2_2= [CCMenuItemSprite itemWithNormalSprite:[CCSprite spriteWithFile:l1] selectedSprite:[CCSprite spriteWithFile:l1] target:self selector:@selector(level:)];
        item2_2.tag = 22;
        [item2_2 setPosition:ccplevel(1348, 228)];
        CCMenuItemSprite *item2_3= [CCMenuItemSprite itemWithNormalSprite:[CCSprite spriteWithFile:l1] selectedSprite:[CCSprite spriteWithFile:l1] target:self selector:@selector(level:)];
        item2_3.tag = 32;
        [item2_3 setPosition:ccplevel(2303, 233)];
        CCMenuItemSprite *item2_4= [CCMenuItemSprite itemWithNormalSprite:[CCSprite spriteWithFile:l1] selectedSprite:[CCSprite spriteWithFile:l1] target:self selector:@selector(level:)];
        item2_4.tag = 42;
        [item2_4 setPosition:ccplevel(3505, 215)];
        
        l1 = @"Level03.png";
        CCMenuItemSprite *item3_1= [CCMenuItemSprite itemWithNormalSprite:[CCSprite spriteWithFile:l1] selectedSprite:[CCSprite spriteWithFile:l1] target:self selector:@selector(level:)];
        item3_1.tag = 13;
        [item3_1 setPosition:ccplevel(390, 490)];
        CCMenuItemSprite *item3_2= [CCMenuItemSprite itemWithNormalSprite:[CCSprite spriteWithFile:l1] selectedSprite:[CCSprite spriteWithFile:l1] target:self selector:@selector(level:)];
        item3_2.tag = 23;
        [item3_2 setPosition:ccplevel(1888, 170)];
        CCMenuItemSprite *item3_3= [CCMenuItemSprite itemWithNormalSprite:[CCSprite spriteWithFile:l1] selectedSprite:[CCSprite spriteWithFile:l1] target:self selector:@selector(level:)];
        item3_3.tag = 33;
        [item3_3 setPosition:ccplevel(2538, 306)];
        CCMenuItemSprite *item3_4= [CCMenuItemSprite itemWithNormalSprite:[CCSprite spriteWithFile:l1] selectedSprite:[CCSprite spriteWithFile:l1] target:self selector:@selector(level:)];
        item3_4.tag = 43;
        [item3_4 setPosition:ccplevel(3844, 463)];
        
        l1 = @"Level04.png";
        CCMenuItemSprite *item4_1= [CCMenuItemSprite itemWithNormalSprite:[CCSprite spriteWithFile:l1] selectedSprite:[CCSprite spriteWithFile:l1] target:self selector:@selector(level:)];
        item4_1.tag = 14;
        [item4_1 setPosition:ccplevel(785, 528)];
        CCMenuItemSprite *item4_2= [CCMenuItemSprite itemWithNormalSprite:[CCSprite spriteWithFile:l1] selectedSprite:[CCSprite spriteWithFile:l1] target:self selector:@selector(level:)];
        item4_2.tag = 24;
        [item4_2 setPosition:ccplevel(1787, 470)];
        CCMenuItemSprite *item4_3= [CCMenuItemSprite itemWithNormalSprite:[CCSprite spriteWithFile:l1] selectedSprite:[CCSprite spriteWithFile:l1] target:self selector:@selector(level:)];
        item4_3.tag = 34;
        [item4_3 setPosition:ccplevel(2149, 507)];
        
        l1 = @"Level05.png";
        CCMenuItemSprite *item5_1= [CCMenuItemSprite itemWithNormalSprite:[CCSprite spriteWithFile:l1] selectedSprite:[CCSprite spriteWithFile:l1] target:self selector:@selector(level:)];
        item5_1.tag = 15;
        [item5_1 setPosition:ccplevel(675, 263)];
        CCMenuItemSprite *item5_3= [CCMenuItemSprite itemWithNormalSprite:[CCSprite spriteWithFile:l1] selectedSprite:[CCSprite spriteWithFile:l1] target:self selector:@selector(level:)];
        item5_3.tag = 35;
        [item5_3 setPosition:ccplevel(2641, 543)];

        l1 = @"Level06.png";
        CCMenuItemSprite *item6_3= [CCMenuItemSprite itemWithNormalSprite:[CCSprite spriteWithFile:l1] selectedSprite:[CCSprite spriteWithFile:l1] target:self selector:@selector(level:)];
        item6_3.tag = 36;
        [item6_3 setPosition:ccplevel(2870, 324)];
        
        l1 = @"BonnusLevel.png";
        CCMenuItemSprite *bonitem1= [CCMenuItemSprite itemWithNormalSprite:[CCSprite spriteWithFile:l1] selectedSprite:[CCSprite spriteWithFile:l1] target:self selector:@selector(bonlevel:)];
        bonitem1.tag = 19;
        [bonitem1 setPosition:ccplevel(900, 150)];
        CCMenuItemSprite *bonitem2= [CCMenuItemSprite itemWithNormalSprite:[CCSprite spriteWithFile:l1] selectedSprite:[CCSprite spriteWithFile:l1] target:self selector:@selector(bonlevel:)];
        bonitem2.tag = 29;
        [bonitem2 setPosition:ccplevel(2100, 310)];
        CCMenuItemSprite *bonitem3= [CCMenuItemSprite itemWithNormalSprite:[CCSprite spriteWithFile:l1] selectedSprite:[CCSprite spriteWithFile:l1] target:self selector:@selector(bonlevel:)];
        bonitem3.tag = 39;
        [bonitem3 setPosition:ccplevel(2810, 140)];
        CCMenuItemSprite *bonitem4= [CCMenuItemSprite itemWithNormalSprite:[CCSprite spriteWithFile:l1] selectedSprite:[CCSprite spriteWithFile:l1] target:self selector:@selector(bonlevel:)];
        bonitem4.tag = 49;
        [bonitem4 setPosition:ccplevel(3580, 510)];
        
        menu = [CCMenu menuWithItems: item1_1, item1_2, item1_3, item1_4,
                        item2_1, item2_2, item2_3, item2_4,
                        item3_1, item3_2, item3_3, item3_4,
                        item4_1, item4_2, item4_3,
                        item5_1, item5_3,
                        item6_3,
                        bonitem1, bonitem2, bonitem3, bonitem4,
                        nil];
        [self addChild: menu z:300];
        menu.tag = MENU_TAG1;
        [menu setPosition:ccp(0, -74)];

        l1 = @"LockLevel.png";
        CCSprite *lock2_1 = [CCSprite spriteWithFile:l1];
        lock2_1.position = ccplock(23, 375);
        lock2_1.tag = LOCKS_TAG + 12;
        [self addChild:lock2_1 z:309];
        CCSprite *lock3_1 = [CCSprite spriteWithFile:l1];
        lock3_1.position = ccplock(390, 490);
        lock3_1.tag = LOCKS_TAG + 13;
        [self addChild:lock3_1 z:309];
        CCSprite *lock4_1 = [CCSprite spriteWithFile:l1];
        lock4_1.position = ccplock(785, 528);
        lock4_1.tag = LOCKS_TAG + 14;
        [self addChild:lock4_1 z:309];
        CCSprite *lock5_1 = [CCSprite spriteWithFile:l1];
        lock5_1.position = ccplock(675, 263);
        lock5_1.tag = LOCKS_TAG + 15;
        [self addChild:lock5_1 z:309];
        
        CCSprite *lock1_2 = [CCSprite spriteWithFile:l1];
        lock1_2.position = ccplock(1130, 515);
        lock1_2.tag = LOCKS_TAG + 21;
        [self addChild:lock1_2 z:309];
        CCSprite *lock2_2 = [CCSprite spriteWithFile:l1];
        lock2_2.position = ccplock(1348, 228);
        lock2_2.tag = LOCKS_TAG + 22;
        [self addChild:lock2_2 z:309];
        CCSprite *lock3_2 = [CCSprite spriteWithFile:l1];
        lock3_2.position = ccplock(1888, 170);
        lock3_2.tag = LOCKS_TAG + 23;
        [self addChild:lock3_2 z:309];
        CCSprite *lock4_2 = [CCSprite spriteWithFile:l1];
        lock4_2.position = ccplock(1787, 470);
        lock4_2.tag = LOCKS_TAG + 24;
        [self addChild:lock4_2 z:309];
        
        CCSprite *lock1_3 = [CCSprite spriteWithFile:l1];
        lock1_3.position = ccplock(2571, 98);
        lock1_3.tag = LOCKS_TAG + 31;
        [self addChild:lock1_3 z:309];
        CCSprite *lock2_3 = [CCSprite spriteWithFile:l1];
        lock2_3.position = ccplock(2303, 233);
        lock2_3.tag = LOCKS_TAG + 32;
        [self addChild:lock2_3 z:309];
        CCSprite *lock3_3 = [CCSprite spriteWithFile:l1];
        lock3_3.position = ccplock(2538, 306);
        lock3_3.tag = LOCKS_TAG + 33;
        [self addChild:lock3_3 z:309];
        CCSprite *lock4_3 = [CCSprite spriteWithFile:l1];
        lock4_3.position = ccplock(2149, 507);
        lock4_3.tag = LOCKS_TAG + 34;
        [self addChild:lock4_3 z:309];
        CCSprite *lock5_3 = [CCSprite spriteWithFile:l1];
        lock5_3.position = ccplock(2641, 543);
        lock5_3.tag = LOCKS_TAG + 35;
        [self addChild:lock5_3 z:309];
        CCSprite *lock6_3 = [CCSprite spriteWithFile:l1];
        lock6_3.position = ccplock(2870, 324);
        lock6_3.tag = LOCKS_TAG + 36;
        [self addChild:lock6_3 z:309];
        
        CCSprite *lock1_4 = [CCSprite spriteWithFile:l1];
        lock1_4.position = ccplock(3167, 306);
        lock1_4.tag = LOCKS_TAG + 41;
        [self addChild:lock1_4 z:309];
        CCSprite *lock2_4 = [CCSprite spriteWithFile:l1];
        lock2_4.position = ccplock(3505, 215);
        lock2_4.tag = LOCKS_TAG + 42;
        [self addChild:lock2_4 z:309];
        CCSprite *lock3_4 = [CCSprite spriteWithFile:l1];
        lock3_4.position = ccplock(3844, 463);
        lock3_4.tag = LOCKS_TAG + 43;
        [self addChild:lock3_4 z:309];
        
        CCSprite *lockbon1 = [CCSprite spriteWithFile:l1];
        lockbon1.position = ccplock(900, 150);
        lockbon1.tag = LOCKS_TAG + 19;
        [self addChild:lockbon1 z:309];
        CCSprite *lockbon2 = [CCSprite spriteWithFile:l1];
        lockbon2.position = ccplock(2100, 310);
        lockbon2.tag = LOCKS_TAG + 29;
        [self addChild:lockbon2 z:309];
        CCSprite *lockbon3 = [CCSprite spriteWithFile:l1];
        lockbon3.position = ccplock(2810, 140);
        lockbon3.tag = LOCKS_TAG + 39;
        [self addChild:lockbon3 z:309];
        CCSprite *lockbon4 = [CCSprite spriteWithFile:l1];
        lockbon4.position = ccplock(3580, 510);
        lockbon4.tag = LOCKS_TAG + 49;
        [self addChild:lockbon4 z:309];
        
        l1 = @"ChechLevel.png";
        CCSprite *ch1_1 = [CCSprite spriteWithFile:l1];
        ch1_1.position = ccpchech(177, 255);
        ch1_1.tag = CHECH_TAG + 11;
        [self addChild:ch1_1 z:309];
        CCSprite *ch2_1 = [CCSprite spriteWithFile:l1];
        ch2_1.position = ccpchech(23, 375);
        ch2_1.tag = CHECH_TAG + 12;
        [self addChild:ch2_1 z:309];
        CCSprite *ch3_1 = [CCSprite spriteWithFile:l1];
        ch3_1.position = ccpchech(390, 490);
        ch3_1.tag = CHECH_TAG + 13;
        [self addChild:ch3_1 z:309];
        CCSprite *ch4_1 = [CCSprite spriteWithFile:l1];
        ch4_1.position = ccpchech(785, 528);
        ch4_1.tag = CHECH_TAG + 14;
        [self addChild:ch4_1 z:309];
        CCSprite *ch5_1 = [CCSprite spriteWithFile:l1];
        ch5_1.position = ccpchech(675, 263);
        ch5_1.tag = CHECH_TAG + 15;
        [self addChild:ch5_1 z:309];
        
        CCSprite *ch1_2 = [CCSprite spriteWithFile:l1];
        ch1_2.position = ccpchech(1130, 515);
        ch1_2.tag = CHECH_TAG + 21;
        [self addChild:ch1_2 z:309];
        CCSprite *ch2_2 = [CCSprite spriteWithFile:l1];
        ch2_2.position = ccpchech(1348, 228);
        ch2_2.tag = CHECH_TAG + 22;
        [self addChild:ch2_2 z:309];
        CCSprite *ch3_2 = [CCSprite spriteWithFile:l1];
        ch3_2.position = ccpchech(1888, 170);
        ch3_2.tag = CHECH_TAG + 23;
        [self addChild:ch3_2 z:309];
        CCSprite *ch4_2 = [CCSprite spriteWithFile:l1];
        ch4_2.position = ccpchech(1787, 470);
        ch4_2.tag = CHECH_TAG + 24;
        [self addChild:ch4_2 z:309];
        
        CCSprite *ch1_3 = [CCSprite spriteWithFile:l1];
        ch1_3.position = ccpchech(2571, 98);
        ch1_3.tag = CHECH_TAG + 31;
        [self addChild:ch1_3 z:309];
        CCSprite *ch2_3 = [CCSprite spriteWithFile:l1];
        ch2_3.position = ccpchech(2303, 233);
        ch2_3.tag = CHECH_TAG + 32;
        [self addChild:ch2_3 z:309];
        CCSprite *ch3_3 = [CCSprite spriteWithFile:l1];
        ch3_3.position = ccpchech(2538, 306);
        ch3_3.tag = CHECH_TAG + 33;
        [self addChild:ch3_3 z:309];
        CCSprite *ch4_3 = [CCSprite spriteWithFile:l1];
        ch4_3.position = ccpchech(2149, 507);
        ch4_3.tag = CHECH_TAG + 34;
        [self addChild:ch4_3 z:309];
        CCSprite *ch5_3 = [CCSprite spriteWithFile:l1];
        ch5_3.position = ccpchech(2641, 543);
        ch5_3.tag = CHECH_TAG + 35;
        [self addChild:ch5_3 z:309];
        CCSprite *ch6_3 = [CCSprite spriteWithFile:l1];
        ch6_3.position = ccpchech(2870, 324);
        ch6_3.tag = CHECH_TAG + 36;
        [self addChild:ch6_3 z:309];
        
        CCSprite *ch1_4 = [CCSprite spriteWithFile:l1];
        ch1_4.position = ccpchech(3167, 306);
        ch1_4.tag = CHECH_TAG + 41;
        [self addChild:ch1_4 z:309];
        CCSprite *ch2_4 = [CCSprite spriteWithFile:l1];
        ch2_4.position = ccpchech(3505, 215);
        ch2_4.tag = CHECH_TAG + 42;
        [self addChild:ch2_4 z:309];
        CCSprite *ch3_4 = [CCSprite spriteWithFile:l1];
        ch3_4.position = ccpchech(3844, 463);
        ch3_4.tag = CHECH_TAG + 43;
        [self addChild:ch3_4 z:309];
        
        CCSprite *chbon1 = [CCSprite spriteWithFile:l1];
        chbon1.position = ccpchech(900, 150);
        chbon1.tag = CHECH_TAG + 19;
        [self addChild:chbon1 z:309];
        CCSprite *chbon2 = [CCSprite spriteWithFile:l1];
        chbon2.position = ccpchech(2100, 310);
        chbon2.tag = CHECH_TAG + 29;
        [self addChild:chbon2 z:309];
        CCSprite *chbon3 = [CCSprite spriteWithFile:l1];
        chbon3.position = ccpchech(2810, 140);
        chbon3.tag = CHECH_TAG + 39;
        [self addChild:chbon3 z:309];
        CCSprite *chbon4 = [CCSprite spriteWithFile:l1];
        chbon4.position = ccpchech(3580, 510);
        chbon4.tag = CHECH_TAG + 49;
        [self addChild:chbon4 z:309];
        
        
        l1 = @"StarLevelNone.png";
        CCSprite *star1_1 = [CCSprite spriteWithFile:l1];
        star1_1.position = ccpstar(165, 325);
        star1_1.tag = STARS_TAG + 11;
        [self addChild:star1_1 z:302];
        CCSprite *star1_2 = [CCSprite spriteWithFile:l1];
        star1_2.position = ccpstar(1118, 585);
        star1_2.tag = STARS_TAG + 21;
        [self addChild:star1_2 z:302];
        CCSprite *star1_3 = [CCSprite spriteWithFile:l1];
        star1_3.position = ccpstar(2559, 168);
        star1_3.tag = STARS_TAG + 31;
        [self addChild:star1_3 z:302];
        CCSprite *star1_4 = [CCSprite spriteWithFile:l1];
        star1_4.position = ccpstar(3155, 376);
        star1_4.tag = STARS_TAG + 41;
        [self addChild:star1_4 z:302];
        
        CCSprite *star2_1 = [CCSprite spriteWithFile:l1];
        star2_1.position = ccpstar(11, 445);
        star2_1.tag = STARS_TAG + 12;
        [self addChild:star2_1 z:302];
        CCSprite *star2_2 = [CCSprite spriteWithFile:l1];
        star2_2.position = ccpstar(1336, 298);
        star2_2.tag = STARS_TAG + 22;
        [self addChild:star2_2 z:302];
        CCSprite *star2_3 = [CCSprite spriteWithFile:l1];
        star2_3.position = ccpstar(2291, 303);
        star2_3.tag = STARS_TAG + 32;
        [self addChild:star2_3 z:302];
        CCSprite *star2_4 = [CCSprite spriteWithFile:l1];
        star2_4.position = ccpstar(3493, 285);
        star2_4.tag = STARS_TAG + 42;
        [self addChild:star2_4 z:302];
        
        CCSprite *star3_1 = [CCSprite spriteWithFile:l1];
        star3_1.position = ccpstar(378, 560);
        star3_1.tag = STARS_TAG + 13;
        [self addChild:star3_1 z:302];
        CCSprite *star3_2 = [CCSprite spriteWithFile:l1];
        star3_2.position = ccpstar(1876, 240);
        star3_2.tag = STARS_TAG + 23;
        [self addChild:star3_2 z:302];
        CCSprite *star3_3 = [CCSprite spriteWithFile:l1];
        star3_3.position = ccpstar(2526, 376);
        star3_3.tag = STARS_TAG + 33;
        [self addChild:star3_3 z:302];
        CCSprite *star3_4 = [CCSprite spriteWithFile:l1];
        star3_4.position = ccpstar(3831, 533);
        star3_4.tag = STARS_TAG + 43;
        [self addChild:star3_4 z:302];
        
        CCSprite *star4_1 = [CCSprite spriteWithFile:l1];
        star4_1.position = ccpstar(775, 598);
        star4_1.tag = STARS_TAG + 14;
        [self addChild:star4_1 z:302];
        CCSprite *star4_2 = [CCSprite spriteWithFile:l1];
        star4_2.position = ccpstar(1775, 540);
        star4_2.tag = STARS_TAG + 24;
        [self addChild:star4_2 z:302];
        CCSprite *star4_3 = [CCSprite spriteWithFile:l1];
        star4_3.position = ccpstar(2137, 577);
        star4_3.tag = STARS_TAG + 34;
        [self addChild:star4_3 z:302];
        
        CCSprite *star5_1 = [CCSprite spriteWithFile:l1];
        star5_1.position = ccpstar(663, 333);
        star5_1.tag = STARS_TAG + 15;
        [self addChild:star5_1 z:302];
        CCSprite *star5_3 = [CCSprite spriteWithFile:l1];
        star5_3.position = ccpstar(2629, 613);
        star5_3.tag = STARS_TAG + 35;
        [self addChild:star5_3 z:302];
        
        CCSprite *star6_3 = [CCSprite spriteWithFile:l1];
        star6_3.position = ccpstar(2858, 394);
        star6_3.tag = STARS_TAG + 36;
        [self addChild:star6_3 z:302];
        

        [self refreshLabels];

        [self unscheduleAllSelectors];
        [self scheduleUpdate];
        [self schedule:@selector(timer) interval:1.0f];

	}
	
	return self;
}

-(void) orerot {
    
    oreol.rotation = oreol_rot;
    oreol_rot += 2;//12.8f;
    
    [self performSelector:@selector(orerot) withObject:nil afterDelay:0.1f];

}

-(void)level:(CCMenuItemSprite*)sender {
    
    
    NSLog(@"level pressed %d", sender.tag);
    
    if([Common instance].curlevel == sender.tag)
        return;

    if(luck1.opacity > 0)
        [self hideLuckList1];

    [Common instance].curlevel = sender.tag;
    [[CCDirector sharedDirector] pushScene:[GameLayer scene]];
    
}

-(void)bonlevel:(CCMenuItemSprite*)sender {
    
    
    NSLog(@"bonus level pressed %d", sender.tag);
    [Common instance].curlevel = sender.tag;
    [[CCDirector sharedDirector] pushScene:[GameLayer scene]];
    
}

- (void) afterShop {
    
    if(!menu1.enabled) {
        
        NSLog(@"afterShop");
        CCAction* action = [CCFadeTo actionWithDuration:0.3f opacity:0];
        [colorLayer runAction:action];
        menu1.enabled = YES;
    }
}

-(void) toTop {
    
    CCAction* action = [CCFadeTo actionWithDuration:0.3f opacity:0];
    [colorLayer runAction:action];
    [inlay runAction:[CCMoveTo actionWithDuration:0.3f position:ccp(1024,0)]];
    menu1.enabled = YES;
    CCNode* result = [layer getChildByTag:MENU_TAG1];
    if(result != nil) {
        ((CCMenu*)result).enabled = YES;
    }
}

- (void) refreshLabels {
    
    [labelMoney setString:[NSString stringWithFormat:@"%d", [Common instance].money]];
    [labelKeys setString:[NSString stringWithFormat:@"%d", [Common instance].keys]];
    [labelYourLuck setString:[NSString stringWithFormat:@"%d%%", [Common instance].yourluck]];
 
    
    
    int n = [Common instance].lastLevelPassed + 1;
    int next = n;
    if(n > 43)
        next = 49;
    if((n > 36) && (n < 41))
        next = 41;
    if((n > 24) && (n < 31))
        next = 31;
    if((n > 15) && (n < 21))
        next = 21;
    if((n > 0) && (n < 11))
        next = 11;
    
    NSLog(@"[Common instance].lastLevelPassed = %d, next = %d", [Common instance].lastLevelPassed, next);

    arealock1.visible = !(next > 20);
    arealock2.visible = !(next > 30);
    arealock3.visible = !(next > 40);
    
//    arealock1.visible = NO;
//    arealock2.visible = NO;
//    arealock3.visible = NO;

    for(CCMenuItemSprite *aChildNode in menu.children)
        if(aChildNode.tag > 10) {


            int t1 = [[Common instance] getStarsForLevel:aChildNode.tag];

            CCNode* chech = [self getChildByTag:(aChildNode.tag + CHECH_TAG)];
            BOOL bonus = ((aChildNode.tag - (aChildNode.tag/10) * 10) == 9);
            BOOL chvis = bonus?(t1 >= 1):(t1 >= 3);
            chech.visible = chvis;

            aChildNode.isEnabled = YES;//!chvis && (aChildNode.tag <= next); //todel
            
            CCNode* llock = [self getChildByTag:(aChildNode.tag + LOCKS_TAG)];
            llock.visible = (aChildNode.tag > next);//!aChildNode.isEnabled;
            
            if(aChildNode.tag == next) {
                
                oreol.position = ccp(aChildNode.position.x, aChildNode.position.y - 46 - 40);
            }
            
            if(bonus)
                continue;
            
            NSString* l1 = @"StarLevelNone.png";
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
            CCSprite* stars = (CCSprite*)[self getChildByTag:(aChildNode.tag + STARS_TAG)];
            CCTexture2D* tex = [[CCTextureCache sharedTextureCache] addImage:l1];
            [stars setTexture: tex];
        }

//    for(CCMenuItemSprite *aChildNode in menu.children)
//        NSLog(@"menu item enabled = %d, tag = %d", aChildNode.isEnabled, aChildNode.tag);

    
}

-(void) ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{

    UITouch *touch =[touches anyObject];
    CGPoint point = [touch locationInView:[touch view]];
    point = [[CCDirector sharedDirector]convertToGL:point];
    float x = point.x;
    float y = point.y;

    x0 = point.x;
    xl0 = self.position.x;
    
    cTime = CACurrentMediaTime();
    
    if(luck1.opacity > 0)
        if(!((x > 540) && (x < 727) && (y > yfrm))) {
            
            [self hideLuckList];
        }

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
    
//    CCMoveTo *moveTo = [CCMoveTo actionWithDuration:0.001f position:ccp(xx, 0)];
//    [self runAction:moveTo];
    
    
    
//    x0 = point.x;
//    xl0 = xx;

}

-(void) ccTouchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    
//    NSLog(@"ccTouchesEnded");
    UITouch *touch =[touches anyObject];
    CGPoint point = [touch locationInView:[touch view]];
    point = [[CCDirector sharedDirector]convertToGL:point];


    double cTime1 = CACurrentMediaTime();
    double k = 0.25f/(cTime1 - cTime);
    NSLog(@"cTime = %f, cTime1 = %f, /k = %f", cTime, cTime1, k);

    float delta = (point.x - x0) * (1+k);
    float xx = xl0 + delta;
    if(xx > 0)
        xx = 0;
    if(xx < -3072)
        xx = -3072;
    //    NSLog(@"xx = %f", xx);
//    self.position = ccp(xx, 0);
   
    [self stopAllActions];

//    CCMoveTo *moveTo = [CCMoveTo actionWithDuration:0.9f position:ccp(xx, 0)];
//    [self runAction:[CCEaseOut actionWithAction:moveTo rate:1.8f]];
    CCMoveTo *moveTo = [CCMoveTo actionWithDuration:k position:ccp(xx, 0)];
    [self runAction:[CCEaseOut actionWithAction:moveTo rate:1.8f * k]];

}

- (void) timer {
    
//    NSLog(@"timer2");
    
    if([[Common instance] reduceTimeLuck])
        [self refreshLabels];
    
}

- (void) onEnter {
    
    [super onEnter];
    [Common instance].curlevel = -1;

    [self refreshLabels];
}

- (void) dealloc {
    
    [labelMoney release];
    [labelKeys release];
    [labelYourLuck release];
    
	[super dealloc];
}
@end
