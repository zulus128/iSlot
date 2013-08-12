//
//  IntroLayer.m
//  iSlot
//
//  Created by Zul on 2/6/13.
//  Copyright Zul 2013. All rights reserved.
//


#import "IntroLayer.h"
#import "GameLayer.h"
#import "MapLayer.h"

#import "InappLayer.h"
#import "ShopLayer.h"

#import "AppDelegate.h"

static InappLayer* inlay;
static ShopLayer* shoplay;

#pragma mark - IntroLayer

@implementation IntroLayer

+(CCScene *) scene
{
	CCScene *scene = [CCScene node];
	
    inlay = [InappLayer node];
    inlay.position = ccp(1024, 0);
    
    shoplay = [ShopLayer node];
    shoplay.position = ccp(0, 0);
    shoplay.opacity = 0;
    
	IntroLayer *layer = [IntroLayer node];
	[scene addChild: layer];
	
    [scene addChild: inlay];
    
    [scene addChild: shoplay];
    
	return scene;
}

// 
-(id) init
{
	if( (self=[super init])) {

        CGSize screenSize = [CCDirector sharedDirector].winSize;
        
        self.touchEnabled = YES;
        
        colorLayer = [CCLayerColor layerWithColor:ccc4(0, 0, 0, 0)];
        [self addChild:colorLayer z:555];

        inlay.player = self;
        shoplay.player = self;
        
        CCSprite* back1 = [CCSprite spriteWithFile:@"FonBack.png"];
        back1.position = ccp( 544, 70.5);
        [self addChild:back1 z:5];

        layers = [[NSMutableArray alloc] init];
        CCLayer *layer = [self layerWithChapterNumber:0 screenSize:screenSize];
        [layers addObject:layer];
        CCLayer *layer1 = [self layerWithChapterNumber:1 screenSize:screenSize];
        [layers addObject:layer1];
        CCLayer *layer2 = [self layerWithChapterNumber:2 screenSize:screenSize];
        [layers addObject:layer2];

        scroller = [[CCScrollLayer alloc] initWithLayers:layers
                                                            widthOffset:570];
        [scroller selectPage:0];
        scroller.showPagesIndicator = NO;
        [self addChild:scroller z:12];
        [scroller release];
//        [layers release];

        
        labelMoney = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"%d", [Common instance].money] fontName:@"Marker Felt" fontSize:44];
        labelMoney.color = ccc3(0, 0, 0);
        labelMoney.position =  ccp( 300 , 730 );
        [self addChild: labelMoney z:13];
        
        labelKeys = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"%d", [Common instance].keys] fontName:@"Marker Felt" fontSize:44];
        labelKeys.color = ccc3(0, 0, 0);
        labelKeys.position =  ccp( 900 , 730 );
        [self addChild: labelKeys z:13];
        
        labelYourLuck = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"%d%%", [Common instance].yourluck] fontName:@"Marker Felt" fontSize:24];
		labelYourLuck.position =  ccp( 637 , 720 );
		[self addChild: labelYourLuck z:108];

        labelFameLevel = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"Level of fame: %d. Points: %d", [Common instance].famelevel1, [Common instance].famepoints] fontName:@"Marker Felt" fontSize:18];
		labelFameLevel.position =  ccp( 145 , 110 );
		[self addChild: labelFameLevel z:100];

//        CCSprite* yluck = [CCSprite spriteWithFile:@"Luck.png"];
//        [self addChild:yluck z:100];
//        yluck.position = ccp(633, 730);

        luck1 = [CCSprite spriteWithFile:@"listLuck01.png"];
        luck1.position = ccp(634.5, 688);
        luck1.opacity = 0;
        luck1.tag = LUCK_TAG1;
        [self addChild:luck1 z:100];
//        luck2 = [CCSprite spriteWithFile:@"listLuck02.png"];
//        luck2.position = ccp(634.5, 624);
//        luck2.opacity = 0;
//        luck2.tag = LUCK_TAG1;
//        [self addChild:luck2 z:100];
        luck3 = [CCSprite spriteWithFile:@"listLuck03.png"];
        luck3.position = ccp(634.5, 566);
        luck3.opacity = 0;
        luck3.tag = LUCK_TAG1;
        [self addChild:luck3 z:100];

        CCSprite* fameback = [CCSprite spriteWithFile:@"WhileFonFame.png"];
        [self addChild:fameback z:13];
        fameback.position = ccp(155, 75);
        
        fame = [CCSprite spriteWithFile:@"BlueFonFame.png"];
        [self addChild:fame z:14];
        fame.position = ccp(-5, 75);

        CCSprite* back2 = [CCSprite spriteWithFile:@"BottomLine.png"];
        back2.position = ccp( 512, 63);
        [self addChild:back2 z:15];

        sett1 = [CCSprite spriteWithFile:@"SettingWindow.png"];
        sett1.position = ccp(772.5, 223);
        sett1.opacity = 0;
        [self addChild:sett1 z:150];
        
        CCMenuItem *enableMusic = [CCMenuItemImage itemFromNormalImage:@"SettingOn.png"
                                                         selectedImage:@"SettingOn.png" target:nil selector:nil];
        CCMenuItem *disableMusic = [CCMenuItemImage itemFromNormalImage:@"SettingOff.png"
                                                          selectedImage:@"SettingOff.png" target:nil selector:nil];
        CCMenuItemToggle *musicToggle = [CCMenuItemToggle itemWithTarget:self
                                                                selector:@selector(musicMute:) items:enableMusic, disableMusic, nil];
        [musicToggle setPosition:ccp(836, 264.5)];
        
        CCMenuItem *enableMusic1 = [CCMenuItemImage itemFromNormalImage:@"SettingOn.png"
                                                         selectedImage:@"SettingOn.png" target:nil selector:nil];
        CCMenuItem *disableMusic1 = [CCMenuItemImage itemFromNormalImage:@"SettingOff.png"
                                                          selectedImage:@"SettingOff.png" target:nil selector:nil];
        CCMenuItemToggle *soundToggle = [CCMenuItemToggle itemWithTarget:self
                                                                selector:@selector(soundMute:) items:enableMusic1, disableMusic1, nil];
        [soundToggle setPosition:ccp(836, 196.5)];
        
        settmenu = [CCMenu menuWithItems: musicToggle, soundToggle, nil];
        settmenu.opacity = 0;
        settmenu.enabled = NO;
        [self addChild: settmenu z:707];
		[settmenu setPosition:ccp(0, 0)];

        
        [self refreshLabels];
        
        
        CCSprite *spsett = [CCSprite spriteWithFile:@"Setting.png"];
        CCSprite *spsett_t1 = [CCSprite spriteWithFile:@"Setting.png"];
		CCMenuItemSprite *itemsett = [CCMenuItemSprite itemWithNormalSprite:spsett selectedSprite:spsett_t1 block:^(id sender) {
            NSLog(@"settings");
            
            if(settmenu.enabled) {
                
                    [sett1 runAction:[CCFadeOut actionWithDuration:0.5f]];
                    [settmenu runAction:[CCFadeOut actionWithDuration:0.5f]];
                    settmenu.enabled = NO;
                    
                }
            else {
                
            [sett1 runAction:[CCFadeIn actionWithDuration:0.5f]];
            [settmenu runAction:[CCFadeIn actionWithDuration:0.5f]];
            settmenu.enabled = YES;
            }
            
		}];
        [itemsett setPosition:ccp(868, 71)];
        
        CCSprite *spfb = [CCSprite spriteWithFile:@"Facebook.png"];
        CCSprite *lck = [CCSprite spriteWithFile:@"LockLevel.png"];
        lck.position = ccp(36,22);
        lck.scale = 0.5f;
        [spfb addChild:lck];
        CCSprite *spfb_t1 = [CCSprite spriteWithFile:@"Facebook.png"];
		CCMenuItemSprite *itemfb = [CCMenuItemSprite itemWithNormalSprite:spfb selectedSprite:spfb_t1 block:^(id sender) {
            
		}];
        [itemfb setPosition:ccp(949, 103)];
        itemfb.isEnabled = NO;
        
        CCSprite *sptwit = [CCSprite spriteWithFile:@"Twitter.png"];
        CCSprite *lck1 = [CCSprite spriteWithFile:@"LockLevel.png"];
        lck1.position = ccp(36,22);
        lck1.scale = 0.5f;
        [sptwit addChild:lck1];
        CCSprite *sptwit_t1 = [CCSprite spriteWithFile:@"Twitter.png"];
		CCMenuItemSprite *itemtwit = [CCMenuItemSprite itemWithNormalSprite:sptwit selectedSprite:sptwit_t1 block:^(id sender) {
            
		}];
        [itemtwit setPosition:ccp(949, 38)];
        itemtwit.isEnabled = NO;
        
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
            menu.enabled = NO;
            for(CCLayer* l in layers) {
                
                CCNode* result = [l getChildByTag:MENU_TAG];
                if(result != nil) {
                    ((CCMenu*)result).enabled = NO;
                }
            }
            scroller.touchEnabled = NO;

		}];
        [iteminapp1 setPosition:ccp(975.5, 730)];
        
        CCSprite *spgc = [CCSprite spriteWithFile:@"GameCenter.png"];
        CCSprite *spgc_t1 = [CCSprite spriteWithFile:@"TouchGameCenter.png"];
		CCMenuItemSprite *itemgc = [CCMenuItemSprite itemWithNormalSprite:spgc selectedSprite:spgc_t1 block:^(id sender) {
            
            //            GKGameCenterViewController *leaderboardViewController = [[GKGameCenterViewController alloc] init];
            //            leaderboardViewController.gameCenterDelegate = self;
            
            GKLeaderboardViewController *leaderboardViewController = [[GKLeaderboardViewController alloc] init];
			leaderboardViewController.leaderboardDelegate = self;
			
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
            menu.enabled = NO;
            for(CCLayer* l in layers) {
                
                CCNode* result = [l getChildByTag:MENU_TAG];
                if(result != nil) {
                    ((CCMenu*)result).enabled = NO;
                }
            }
            scroller.touchEnabled = NO;

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

        menu = [CCMenu menuWithItems: itemsett, itemfb, itemtwit, iteminapp, iteminapp1, itemgc, itemshop, itemluck, nil];
        [self addChild: menu z:107];
		[menu setPosition:ccp(0, 0)];

        CCSprite *hint1 = [CCSprite spriteWithFile:@"1.png"];
        CCSprite *hint1_t1 = [CCSprite spriteWithFile:@"1.png"];
		CCMenuItemSprite *itemhint1 = [CCMenuItemSprite itemWithNormalSprite:hint1 selectedSprite:hint1_t1 block:^(id sender) {
            NSLog(@"hint1");
            ((CCNode*)sender).visible = NO;
            
		}];
        [itemhint1 setPosition:ccp(845, 568)];
        
        CCSprite *hint2 = [CCSprite spriteWithFile:@"2.png"];
        CCSprite *hint2_t1 = [CCSprite spriteWithFile:@"2.png"];
		CCMenuItemSprite *itemhint2 = [CCMenuItemSprite itemWithNormalSprite:hint2 selectedSprite:hint2_t1 block:^(id sender) {
            NSLog(@"hint2");
            ((CCNode*)sender).visible = NO;
            
		}];
        [itemhint2 setPosition:ccp(355, 559)];
        CCSprite *hint3 = [CCSprite spriteWithFile:@"3.png"];
        CCSprite *hint3_t1 = [CCSprite spriteWithFile:@"3.png"];
		CCMenuItemSprite *itemhint3 = [CCMenuItemSprite itemWithNormalSprite:hint3 selectedSprite:hint3_t1 block:^(id sender) {
            NSLog(@"hint3");
            ((CCNode*)sender).visible = NO;
            
		}];
        [itemhint3 setPosition:ccp(315, 230)];

        CCMenu* hintmenu = [CCMenu menuWithItems: itemhint1, itemhint2, itemhint3, nil];
        [self addChild: hintmenu z:1107];
		[hintmenu setPosition:ccp(0, 0)];

//        NSLog(@"sch--------");
        [self unscheduleAllSelectors];
        [self scheduleUpdate];
        [self schedule:@selector(timer) interval:1.0f];
        
        
//        NSTimer* timer1 = [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(timer) userInfo:nil repeats:YES];

	}
	
	return self;
}

- (void) showSlon {
    
    [inlay setTab:0];
    [inlay runAction:[CCMoveTo actionWithDuration:0.3f position:ccp(0,0)]];
    colorLayer.opacity = 0;
    CCAction* action = [CCFadeTo actionWithDuration:0.3f opacity:180];
    [colorLayer runAction:action];
    menu.enabled = NO;
    for(CCLayer* l in layers) {
        
        CCNode* result = [l getChildByTag:MENU_TAG];
        if(result != nil) {
            ((CCMenu*)result).enabled = NO;
        }
    }
    scroller.touchEnabled = NO;

}

- (void) showLuckList {

    float yfrm = 640;
    NSArray* arr = [Common instance].lucks;
    tt = LUCK_TAG;
    
    if(arr.count == 0) {

        CCSprite* frm = [CCSprite spriteWithFile:@"fonListLuck.png"];
        frm.position = ccp(634.5, yfrm - 10);
        frm.opacity = 0;
        frm.tag = tt++;
        [self addChild:frm z:98];
        
        CCSprite* lck2 = [CCSprite spriteWithFile:@"listLuck02.png" /*rect:CGRectMake(634.5, yfrm, 209, 67)*/];
        lck2.position = ccp(634.5, yfrm);
//        [lck2 setScaleY: 67/lck2.contentSize.height];
        lck2.opacity = 0;
        lck2.tag = tt++;
        [self addChild:lck2 z:99];

        CCLabelTTF* label51 = [CCLabelTTF labelWithString:@"No Luck" fontName:@"Marker Felt" fontSize:24];
        label51.position =  ccp(635, yfrm - 6);
        label51.color = ccc3(0, 0, 0);
        label51.tag = tt++;
        [self addChild: label51 z:98];

        yfrm -= 81;
    }
    else
    for(NSNumber* n in arr){

        
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        NSNumber* nu;
        NSString* sss = @"itemListLuck01.png";
        NSString* sss1 = @"30 minutes";
        switch (n.intValue) {
            case 5:
                sss = @"itemListLuck01.png";
                nu = [userDefaults valueForKey:@"luck5"];
                sss1 = [NSString stringWithFormat:@"%d minutes", nu.intValue / 60];
                break;
            case 10:
                sss = @"itemListLuck02.png";
                nu = [userDefaults valueForKey:@"luck10"];
                sss1 = [NSString stringWithFormat:@"%d minutes", nu.intValue / 60];
                break;
            case 20:
                sss = @"itemListLuck03.png";
                nu = [userDefaults valueForKey:@"luck20"];
                sss1 = [NSString stringWithFormat:@"%d minutes", nu.intValue / 60];
                break;
            case 25:
                sss = @"itemListLuck04.png";
                nu = [userDefaults valueForKey:@"luck25"];
                sss1 = [NSString stringWithFormat:@"%d minutes", nu.intValue / 60];
                break;
            case 35:
                sss = @"itemListLuck05.png";
                nu = [userDefaults valueForKey:@"luck35"];
                sss1 = [NSString stringWithFormat:@"%d minutes", nu.intValue / 60];
                break;
            case 50:
                sss = @"itemListLuck06.png";
                nu = [userDefaults valueForKey:@"luck50"];
                sss1 = [NSString stringWithFormat:@"%d minutes", nu.intValue / 60];
                break;
        }
        if( nu.intValue <=0 )
            continue;

        CCSprite* frm = [CCSprite spriteWithFile:@"fonItemListLuck.png"];
        frm.position = ccp(634.5, yfrm);
        frm.opacity = 0;
        frm.tag = tt++;
        [self addChild:frm z:98];
        
        CCSprite* lck2 = [CCSprite spriteWithFile:@"listLuck02.png" /*rect:CGRectMake(634.5, yfrm, 209, 67)*/];
        lck2.position = ccp(634.5, yfrm);
//        [lck2 setScaleY: 67/lck2.contentSize.height];
        lck2.opacity = 0;
        lck2.tag = tt++;
        [self addChild:lck2 z:99];

        CCSprite* lft = [CCSprite spriteWithFile:sss];
        lft.position = ccp(589, yfrm);
        lft.opacity = 0;
        lft.tag = tt++;
        [self addChild:lft z:98];

        float x = 670;
        int f = 16;
        CCLabelTTF* label5 = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"Luck: +%d", n.intValue] fontName:@"Marker Felt" fontSize:f];
        label5.position =  ccp(x, yfrm + 15);
        label5.color = ccc3(0, 0, 0);
        label5.tag = tt++;
        [self addChild: label5 z:98];
        CCLabelTTF* label51 = [CCLabelTTF labelWithString:@"Duration:" fontName:@"Marker Felt" fontSize:f];
        label51.position =  ccp(x, yfrm - 5);
        label51.color = ccc3(0, 0, 0);
        label51.tag = tt++;
        [self addChild: label51 z:98];
        CCLabelTTF* label52 = [CCLabelTTF labelWithString:sss1 fontName:@"Marker Felt" fontSize:f];
        label52.position =  ccp(x, yfrm - 20);
        label52.color = ccc3(0, 0, 0);
        label52.tag = tt++;
        [self addChild: label52 z:98];


        yfrm -= 67;
    }

    luck3.position = ccp(634.5, yfrm + 30);

    int cnt = 0;
    for(CCNode *aChildNode in self.children)
        if((aChildNode.tag >= LUCK_TAG) || (aChildNode.tag == LUCK_TAG1)) {
            [aChildNode runAction:[CCFadeIn actionWithDuration:Ldelay]];
            cnt++;
        }
    NSLog(@"cnt show = %d", cnt);
    
}

- (void) hideLuckList {

    for(CCNode *aChildNode in self.children)
        if((aChildNode.tag >= LUCK_TAG) || (aChildNode.tag == LUCK_TAG1))
            [aChildNode runAction:[CCFadeOut actionWithDuration:Ldelay]];

    [self performSelector:@selector(hideLuckList1) withObject:nil afterDelay:Ldelay * 2];

}

- (void) hideLuckList1 {

    for(int i = LUCK_TAG; i < tt; i++)
        [self removeChildByTag:i cleanup:YES];
    
}

- (void)ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {

    UITouch *touch =[touches anyObject];
    CGPoint point = [touch locationInView:[touch view]];
    point = [[CCDirector sharedDirector]convertToGL:point];

//    NSLog(@"touch %f, %f", point.x, point.y);
    float x = point.x;
    float y = point.y;
    
    if(settmenu.enabled)
    if((x < 610) || (x > 927) || (y < 114) || (y > 350)) {
        
        [sett1 runAction:[CCFadeOut actionWithDuration:0.5f]];
        [settmenu runAction:[CCFadeOut actionWithDuration:0.5f]];
        settmenu.enabled = NO;

    }
}

-(void)musicMute:(id)sender {
    
}

-(void)soundMute:(id)sender {
    
}

-(void) gameCenterViewControllerDidFinish:(GKGameCenterViewController *)gameCenterViewController {

    AppController *app = (AppController*) [[UIApplication sharedApplication] delegate];
	[[app navController] dismissModalViewControllerAnimated:YES];

}

-(void) achievementViewControllerDidFinish:(GKAchievementViewController *)viewController
{
	AppController *app = (AppController*) [[UIApplication sharedApplication] delegate];
	[[app navController] dismissModalViewControllerAnimated:YES];
}

-(void) leaderboardViewControllerDidFinish:(GKLeaderboardViewController *)viewController
{
	AppController *app = (AppController*) [[UIApplication sharedApplication] delegate];
	[[app navController] dismissModalViewControllerAnimated:YES];
}

- (void) afterShop {
    
    if(!menu.enabled) {
        
        NSLog(@"afterShop");
        CCAction* action = [CCFadeTo actionWithDuration:0.3f opacity:0];
        [colorLayer runAction:action];
        menu.enabled = YES;

        for(CCLayer* l in layers) {
            
            CCNode* result = [l getChildByTag:MENU_TAG];
            if(result != nil) {
                ((CCMenu*)result).enabled = YES;
            }
        }

        scroller.touchEnabled = YES;

    }

}

-(void) toTop {

    NSLog(@"toTop intro1");
    
    CCAction* action = [CCFadeTo actionWithDuration:0.3f opacity:0];
    [colorLayer runAction:action];
    menu.enabled = YES;
    [inlay runAction:[CCMoveTo actionWithDuration:0.3f position:ccp(1024,0)]];
    for(CCLayer* l in layers) {
        
        CCNode* result = [l getChildByTag:MENU_TAG];
        if(result != nil) {
            ((CCMenu*)result).enabled = YES;
        }
    }

    scroller.touchEnabled = YES;

}

- (CCLayer*)layerWithChapterNumber:(int)chapterNumber
                      screenSize:(CGSize)screenSize {
    
    CCLayer *layer = [[CCLayer alloc] init];
//    NSString *s = chapterNumber == 1?@"PresentButton.png":@"FutureButton.png";
    NSString* s;
    switch (chapterNumber) {
        case 0:
            s = @"FutureButton.png";
            break;
        case 1:
            s = @"PresentButton.png";
            break;
        case 2:
            s = @"XXcButton.png";
            break;
    }
        CCMenuItemImage *image = [CCMenuItemImage itemFromNormalImage:s
                                                        selectedImage:s
                                                               target:self
                                                             selector:@selector(onSelectChapter:)];
        image.tag = chapterNumber;
        CCMenu *mmenu = [CCMenu menuWithItems: image, nil];
        mmenu.tag = MENU_TAG;
        [layer addChild: mmenu];
    
    if(chapterNumber == 1) {
    
        image.isEnabled = NO;
        
        CCSprite *spfb = [CCSprite spriteWithFile:@"LockLevel.png"];
        spfb.position = ccp(520, 380);
        [layer addChild:spfb];
        
    }
    
    return layer;
}

- (void) refreshLabels {
    
    [labelMoney setString:[NSString stringWithFormat:@"%d", [Common instance].money]];
    [labelKeys setString:[NSString stringWithFormat:@"%d", [Common instance].keys]];
    [labelYourLuck setString:[NSString stringWithFormat:@"%d%%", [Common instance].yourluck]];

    float p, x;
    int k = 0;
    for(int i = 0; i < FAME_LEVELS; i++)
        if([Common instance].famepoints < [[Common instance] getFames:i]) {
            k = i;
            break;
        }
    
    [Common instance].famelevel1 = (k + 1);
    
    p = /*[Common instance].famepoints > 50?50:*/[Common instance].famepoints - (k>0?[[Common instance] getFames:(k-1)]:0);
    x = p * 160 / ([[Common instance] getFames:k] - (k>0?[[Common instance] getFames:(k-1)]:0));
    fame.position = ccp(-5 + x, 75);
    [labelFameLevel setString:[NSString stringWithFormat:@"Level of fame: %d. Points: %d", [Common instance].famelevel1, [Common instance].famepoints]];
    
}

- (void)onSelectChapter:(CCMenuItemImage *)sender {
    
//    [[CCDirector sharedDirector] pushScene:[GameLayer scene]];

    [[CCDirector sharedDirector] pushScene:[MapLayer scene]];
    
}

- (void) timer {
    
//    NSLog(@"timer1");

    if([[Common instance] reduceTimeLuck])
        [self refreshLabels];

}

- (void) onEnter {
    
    [super onEnter];
    
    [self refreshLabels];
}

- (void) dealloc {
    
    [layers release];
    
	[super dealloc];
}

@end
