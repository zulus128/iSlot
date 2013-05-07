//
//  IntroLayer.m
//  iSlot
//
//  Created by Zul on 2/6/13.
//  Copyright Zul 2013. All rights reserved.
//


#import "IntroLayer.h"
#import "GameLayer.h"
#import "CCScrollLayer.h"
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

        CCScrollLayer *scroller = [[CCScrollLayer alloc] initWithLayers:layers
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
		[self addChild: labelYourLuck z:101];

        labelFameLevel = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"Level of fame: %d. Points: %d", [Common instance].famelevel1, [Common instance].famepoints] fontName:@"Marker Felt" fontSize:18];
		labelFameLevel.position =  ccp( 145 , 110 );
		[self addChild: labelFameLevel z:100];

        CCSprite* yluck = [CCSprite spriteWithFile:@"Luck.png"];
        [self addChild:yluck z:100];
        yluck.position = ccp(633, 730);

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
            
            [sett1 runAction:[CCFadeIn actionWithDuration:0.5f]];
            [settmenu runAction:[CCFadeIn actionWithDuration:0.5f]];
            settmenu.enabled = YES;
            
		}];
        [itemsett setPosition:ccp(868, 71)];
        
        CCSprite *spfb = [CCSprite spriteWithFile:@"Facebook.png"];
        CCSprite *spfb_t1 = [CCSprite spriteWithFile:@"Facebook.png"];
		CCMenuItemSprite *itemfb = [CCMenuItemSprite itemWithNormalSprite:spfb selectedSprite:spfb_t1 block:^(id sender) {
            
		}];
        [itemfb setPosition:ccp(949, 103)];
        
        CCSprite *sptwit = [CCSprite spriteWithFile:@"Twitter.png"];
        CCSprite *sptwit_t1 = [CCSprite spriteWithFile:@"Twitter.png"];
		CCMenuItemSprite *itemtwit = [CCMenuItemSprite itemWithNormalSprite:sptwit selectedSprite:sptwit_t1 block:^(id sender) {
            
		}];
        [itemtwit setPosition:ccp(949, 38)];
        
        CCSprite *spinapp = [CCSprite spriteWithFile:@"SlonInApp.png"];
        CCSprite *spinapp_t1 = [CCSprite spriteWithFile:@"TouchSlonInApp.png"];
		CCMenuItemSprite *iteminapp = [CCMenuItemSprite itemWithNormalSprite:spinapp selectedSprite:spinapp_t1 block:^(id sender) {
            
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

            [shoplay show];

		}];
        [itemshop setPosition:ccp(740, 730)];
        
        menu = [CCMenu menuWithItems: itemsett, itemfb, itemtwit, iteminapp, iteminapp1, itemgc, itemshop, nil];
        [self addChild: menu z:107];
		[menu setPosition:ccp(0, 0)];

	}
	
	return self;
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
    
    NSLog(@"afterShop");
    CCAction* action = [CCFadeTo actionWithDuration:0.3f opacity:0];
    [colorLayer runAction:action];
    menu.enabled = YES;

}

-(void) toTop {

    NSLog(@"toTop intro");
    
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


}

- (CCLayer*)layerWithChapterNumber:(int)chapterNumber
                      screenSize:(CGSize)screenSize {
    
    CCLayer *layer = [[CCLayer alloc] init];
//    [layer setScaleX:0.3f];
    NSString *s = chapterNumber == 1?@"PresentButton.png":@"FutureButton.png";
        CCMenuItemImage *image = [CCMenuItemImage itemFromNormalImage:s
                                                        selectedImage:s
                                                               target:self
                                                             selector:@selector(onSelectChapter:)];
        image.tag = chapterNumber;
        CCMenu *menu = [CCMenu menuWithItems: image, nil];
        menu.tag = MENU_TAG;
        [layer addChild: menu];
    
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


- (void) onEnter {
    
    [super onEnter];
    
    [self refreshLabels];
}

- (void) dealloc {
    
    [layers release];
    
	[super dealloc];
}

@end
