//
//  GameLayer.m
//  iSlot
//
//  Created by Zul on 2/7/13.
//  Copyright (c) 2013 Zul. All rights reserved.
//

#import "GameLayer.h"
#import "Common.h"
#import "InappLayer.h"

#import "InappLayer.h"
#import "BonusLayer.h"
#import "ShopLayer.h"

#import "AppDelegate.h"

static ShopLayer* shoplay;

static InappLayer* inlay;
static BonusLayer* bonlay;


@implementation GameLayer

// Helper class method that creates a Scene with the HelloWorldLayer as the only child.
+(CCScene *) scene {
    
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	
    inlay = [InappLayer node];
    inlay.position = ccp(1024, 0);
    
    bonlay = [BonusLayer node];
    bonlay.position = ccp(1024, 0);
    bonlay.opacity = 0;
    
    shoplay = [ShopLayer node];
//    shoplay.position = ccp(5000, 0);
    shoplay.opacity = 0;
    
	GameLayer *layer = [GameLayer node];
	[scene addChild: layer];
    
    [scene addChild: inlay];
    
    [scene addChild: bonlay];

    [scene addChild: shoplay];
    
	return scene;
}

-(int) getLmoney {

    int n1 = [Common instance].curlevel / 10;
    int n2 = [Common instance].curlevel - n1 * 10;

    if (n2 == 9) //bonus level
        switch (n1) {
            case 1:
                return 1500;
            case 2:
                return 2500;
            case 3:
                return 6000;
            case 4:
                return 20550;
        }
    
    
    int t1 = [[Common instance] getStarsForLevel:[Common instance].curlevel];
    if(t1 > 2)
        t1 = 2;
    NSArray* a = (NSArray*)[money objectForKey:[NSNumber numberWithInt:[Common instance].curlevel]];
    return ((NSNumber*)[a objectAtIndex:t1]).intValue;
}

// on "init" you need to initialize your instance
-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super's" return value
	if( (self=[super init]) ) {
		
        self.touchEnabled = YES;

        colorLayer = [CCLayerColor layerWithColor:ccc4(0, 0, 0, 0)];
        [self addChild:colorLayer z:555];
        
        inlay.player = self;
        bonlay.player = self;
        shoplay.player = self;
        
        NSArray* line1 = [[NSArray alloc] initWithObjects:
                          [[NSNumber alloc] initWithInt:0],
                          [[NSNumber alloc] initWithInt:0],
                          [[NSNumber alloc] initWithInt:0],
                          [[NSNumber alloc] initWithInt:0],
                          [[NSNumber alloc] initWithInt:0],
                          nil];
        
        NSArray* line2 = [[NSArray alloc] initWithObjects:
                          [[NSNumber alloc] initWithInt:1],
                          [[NSNumber alloc] initWithInt:1],
                          [[NSNumber alloc] initWithInt:1],
                          [[NSNumber alloc] initWithInt:1],
                          [[NSNumber alloc] initWithInt:1],
                          nil];
        
        NSArray* line3 = [[NSArray alloc] initWithObjects:
                          [[NSNumber alloc] initWithInt:-1],
                          [[NSNumber alloc] initWithInt:-1],
                          [[NSNumber alloc] initWithInt:-1],
                          [[NSNumber alloc] initWithInt:-1],
                          [[NSNumber alloc] initWithInt:-1],
                          nil];
        
        NSArray* line4 = [[NSArray alloc] initWithObjects:
                          [[NSNumber alloc] initWithInt:1],
                          [[NSNumber alloc] initWithInt:0],
                          [[NSNumber alloc] initWithInt:-1],
                          [[NSNumber alloc] initWithInt:0],
                          [[NSNumber alloc] initWithInt:1],
                          nil];
        
        NSArray* line5 = [[NSArray alloc] initWithObjects:
                          [[NSNumber alloc] initWithInt:-1],
                          [[NSNumber alloc] initWithInt:0],
                          [[NSNumber alloc] initWithInt:1],
                          [[NSNumber alloc] initWithInt:0],
                          [[NSNumber alloc] initWithInt:-1],
                          nil];
        
        NSArray* line6 = [[NSArray alloc] initWithObjects:
                          [[NSNumber alloc] initWithInt:-1],
                          [[NSNumber alloc] initWithInt:0],
                          [[NSNumber alloc] initWithInt:0],
                          [[NSNumber alloc] initWithInt:0],
                          [[NSNumber alloc] initWithInt:-1],
                          nil];
        
        NSArray* line7 = [[NSArray alloc] initWithObjects:
                          [[NSNumber alloc] initWithInt:1],
                          [[NSNumber alloc] initWithInt:0],
                          [[NSNumber alloc] initWithInt:0],
                          [[NSNumber alloc] initWithInt:0],
                          [[NSNumber alloc] initWithInt:1],
                          nil];
        
        NSArray* line8 = [[NSArray alloc] initWithObjects:
                          [[NSNumber alloc] initWithInt:0],
                          [[NSNumber alloc] initWithInt:1],
                          [[NSNumber alloc] initWithInt:1],
                          [[NSNumber alloc] initWithInt:1],
                          [[NSNumber alloc] initWithInt:0],
                          nil];
        
        NSArray* line9 = [[NSArray alloc] initWithObjects:
                          [[NSNumber alloc] initWithInt:0],
                          [[NSNumber alloc] initWithInt:-1],
                          [[NSNumber alloc] initWithInt:-1],
                          [[NSNumber alloc] initWithInt:-1],
                          [[NSNumber alloc] initWithInt:0],
                          nil];
        
        NSArray* line10 = [[NSArray alloc] initWithObjects:
                           [[NSNumber alloc] initWithInt:1],
                           [[NSNumber alloc] initWithInt:1],
                           [[NSNumber alloc] initWithInt:0],
                           [[NSNumber alloc] initWithInt:-1],
                           [[NSNumber alloc] initWithInt:-1],
                           nil];
        
        NSArray* line11 = [[NSArray alloc] initWithObjects:
                           [[NSNumber alloc] initWithInt:-1],
                           [[NSNumber alloc] initWithInt:-1],
                           [[NSNumber alloc] initWithInt:0],
                           [[NSNumber alloc] initWithInt:1],
                           [[NSNumber alloc] initWithInt:1],
                           nil];
        
        NSArray* line12 = [[NSArray alloc] initWithObjects:
                           [[NSNumber alloc] initWithInt:1],
                           [[NSNumber alloc] initWithInt:0],
                           [[NSNumber alloc] initWithInt:1],
                           [[NSNumber alloc] initWithInt:0],
                           [[NSNumber alloc] initWithInt:1],
                           nil];
        
        NSArray* line13 = [[NSArray alloc] initWithObjects:
                           [[NSNumber alloc] initWithInt:-1],
                           [[NSNumber alloc] initWithInt:0],
                           [[NSNumber alloc] initWithInt:-1],
                           [[NSNumber alloc] initWithInt:0],
                           [[NSNumber alloc] initWithInt:-1],
                           nil];
        
        NSArray* line14 = [[NSArray alloc] initWithObjects:
                           [[NSNumber alloc] initWithInt:0],
                           [[NSNumber alloc] initWithInt:1],
                           [[NSNumber alloc] initWithInt:0],
                           [[NSNumber alloc] initWithInt:-1],
                           [[NSNumber alloc] initWithInt:0],
                           nil];
        
        NSArray* line15 = [[NSArray alloc] initWithObjects:
                           [[NSNumber alloc] initWithInt:0],
                           [[NSNumber alloc] initWithInt:-1],
                           [[NSNumber alloc] initWithInt:0],
                           [[NSNumber alloc] initWithInt:1],
                           [[NSNumber alloc] initWithInt:0],
                           nil];
        
        NSArray* line16 = [[NSArray alloc] initWithObjects:
                           [[NSNumber alloc] initWithInt:1],
                           [[NSNumber alloc] initWithInt:-1],
                           [[NSNumber alloc] initWithInt:-1],
                           [[NSNumber alloc] initWithInt:-1],
                           [[NSNumber alloc] initWithInt:1],
                           nil];
        
        NSArray* line17 = [[NSArray alloc] initWithObjects:
                           [[NSNumber alloc] initWithInt:-1],
                           [[NSNumber alloc] initWithInt:1],
                           [[NSNumber alloc] initWithInt:1],
                           [[NSNumber alloc] initWithInt:1],
                           [[NSNumber alloc] initWithInt:-1],
                           nil];
        
        NSArray* line18 = [[NSArray alloc] initWithObjects:
                           [[NSNumber alloc] initWithInt:0],
                           [[NSNumber alloc] initWithInt:0],
                           [[NSNumber alloc] initWithInt:1],
                           [[NSNumber alloc] initWithInt:0],
                           [[NSNumber alloc] initWithInt:0],
                           nil];
        
        NSArray* line19 = [[NSArray alloc] initWithObjects:
                           [[NSNumber alloc] initWithInt:0],
                           [[NSNumber alloc] initWithInt:0],
                           [[NSNumber alloc] initWithInt:-1],
                           [[NSNumber alloc] initWithInt:0],
                           [[NSNumber alloc] initWithInt:0],
                           nil];
        
        NSArray* line20 = [[NSArray alloc] initWithObjects:
                           [[NSNumber alloc] initWithInt:1],
                           [[NSNumber alloc] initWithInt:1],
                           [[NSNumber alloc] initWithInt:-1],
                           [[NSNumber alloc] initWithInt:1],
                           [[NSNumber alloc] initWithInt:1],
                           nil];
        
        NSArray* line21 = [[NSArray alloc] initWithObjects:
                           [[NSNumber alloc] initWithInt:-1],
                           [[NSNumber alloc] initWithInt:-1],
                           [[NSNumber alloc] initWithInt:1],
                           [[NSNumber alloc] initWithInt:-1],
                           [[NSNumber alloc] initWithInt:-1],
                           nil];
        
        
        lines = [[NSArray alloc] initWithObjects:line1, line2, line3, line4, line5, line6, line7, line8, line9, line10, line11, line12, line13, line14, line15, line16, line17, line18, line19, line20, line21, nil];
        

        NSArray* values0 = [[NSArray alloc] initWithObjects: //WILD
                            [[NSNumber alloc] initWithInt:3], //for 2
                            [[NSNumber alloc] initWithInt:30], //for 3
                            [[NSNumber alloc] initWithInt:300], //for 4
                            [[NSNumber alloc] initWithInt:3000], //for 5
                            nil];
        
        NSArray* values1 = [[NSArray alloc] initWithObjects: //SCATTER
                            [[NSNumber alloc] initWithInt:0], //for 2
                            [[NSNumber alloc] initWithInt:5], //for 3
                            [[NSNumber alloc] initWithInt:15], //for 4
                            [[NSNumber alloc] initWithInt:25], //for 5
                            nil];
        
        NSArray* values2 = [[NSArray alloc] initWithObjects: //J
                            [[NSNumber alloc] initWithInt:0], //for 2
                            [[NSNumber alloc] initWithInt:10], //for 3
                            [[NSNumber alloc] initWithInt:25], //for 4
                            [[NSNumber alloc] initWithInt:50], //for 5
                            nil];
        
        NSArray* values3 = [[NSArray alloc] initWithObjects: //Q
                            [[NSNumber alloc] initWithInt:0], //for 2
                            [[NSNumber alloc] initWithInt:10], //for 3
                            [[NSNumber alloc] initWithInt:25], //for 4
                            [[NSNumber alloc] initWithInt:50], //for 5
                            nil];
        
        NSArray* values4 = [[NSArray alloc] initWithObjects: //K
                            [[NSNumber alloc] initWithInt:0], //for 2
                            [[NSNumber alloc] initWithInt:15], //for 3
                            [[NSNumber alloc] initWithInt:35], //for 4
                            [[NSNumber alloc] initWithInt:100], //for 5
                            nil];
        
        NSArray* values5 = [[NSArray alloc] initWithObjects: //A
                            [[NSNumber alloc] initWithInt:0], //for 2
                            [[NSNumber alloc] initWithInt:15], //for 3
                            [[NSNumber alloc] initWithInt:35], //for 4
                            [[NSNumber alloc] initWithInt:100], //for 5
                            nil];
        
        NSArray* values6 = [[NSArray alloc] initWithObjects: //AVTOMAT
                            [[NSNumber alloc] initWithInt:2], //for 2
                            [[NSNumber alloc] initWithInt:15], //for 3
                            [[NSNumber alloc] initWithInt:50], //for 4
                            [[NSNumber alloc] initWithInt:150], //for 5
                            nil];
        
        NSArray* values7 = [[NSArray alloc] initWithObjects: //SPACE
                            [[NSNumber alloc] initWithInt:2], //for 2
                            [[NSNumber alloc] initWithInt:15], //for 3
                            [[NSNumber alloc] initWithInt:75], //for 4
                            [[NSNumber alloc] initWithInt:250], //for 5
                            nil];
        
        NSArray* values8 = [[NSArray alloc] initWithObjects: //SHUTTLE
                            [[NSNumber alloc] initWithInt:2], //for 2
                            [[NSNumber alloc] initWithInt:20], //for 3
                            [[NSNumber alloc] initWithInt:100], //for 4
                            [[NSNumber alloc] initWithInt:500], //for 5
                            nil];
        
        NSArray* values9 = [[NSArray alloc] initWithObjects: //9
                            [[NSNumber alloc] initWithInt:0], //for 2
                            [[NSNumber alloc] initWithInt:5], //for 3
                            [[NSNumber alloc] initWithInt:15], //for 4
                            [[NSNumber alloc] initWithInt:25], //for 5
                            nil];
        
        NSArray* values10 = [[NSArray alloc] initWithObjects: //10
                             [[NSNumber alloc] initWithInt:0], //for 2
                             [[NSNumber alloc] initWithInt:5], //for 3
                             [[NSNumber alloc] initWithInt:15], //for 4
                             [[NSNumber alloc] initWithInt:25], //for 5
                             nil];
        
        values = [[NSArray alloc] initWithObjects:values0, values1, values2, values3, values4, values5, values6, values7, values8, values9, values10, nil];
        

        money = [[NSMutableDictionary alloc] init];
        NSArray* mon11 = [[NSArray alloc] initWithObjects:
                          [[NSNumber alloc] initWithInt:50], //for first game
                          [[NSNumber alloc] initWithInt:80], //for second game
                          [[NSNumber alloc] initWithInt:170], //for third game
                          nil];
        [money setObject:mon11 forKey:[NSNumber numberWithInt:11]];
        NSArray* mon12 = [[NSArray alloc] initWithObjects:
                          [[NSNumber alloc] initWithInt:90], //for first game
                          [[NSNumber alloc] initWithInt:140], //for second game
                          [[NSNumber alloc] initWithInt:290], //for third game
                          nil];
        [money setObject:mon12 forKey:[NSNumber numberWithInt:12]];
        NSArray* mon13 = [[NSArray alloc] initWithObjects:
                          [[NSNumber alloc] initWithInt:80], //for first game
                          [[NSNumber alloc] initWithInt:130], //for second game
                          [[NSNumber alloc] initWithInt:270], //for third game
                          nil];
        [money setObject:mon13 forKey:[NSNumber numberWithInt:13]];
        NSArray* mon14 = [[NSArray alloc] initWithObjects:
                          [[NSNumber alloc] initWithInt:100], //for first game
                          [[NSNumber alloc] initWithInt:160], //for second game
                          [[NSNumber alloc] initWithInt:340], //for third game
                          nil];
        [money setObject:mon14 forKey:[NSNumber numberWithInt:14]];
        NSArray* mon15 = [[NSArray alloc] initWithObjects:
                          [[NSNumber alloc] initWithInt:120], //for first game
                          [[NSNumber alloc] initWithInt:190], //for second game
                          [[NSNumber alloc] initWithInt:400], //for third game
                          nil];
        [money setObject:mon15 forKey:[NSNumber numberWithInt:15]];

        NSArray* mon21 = [[NSArray alloc] initWithObjects:
                          [[NSNumber alloc] initWithInt:100], //for first game
                          [[NSNumber alloc] initWithInt:160], //for second game
                          [[NSNumber alloc] initWithInt:340], //for third game
                          nil];
        [money setObject:mon21 forKey:[NSNumber numberWithInt:21]];
        NSArray* mon22 = [[NSArray alloc] initWithObjects:
                          [[NSNumber alloc] initWithInt:160], //for first game
                          [[NSNumber alloc] initWithInt:260], //for second game
                          [[NSNumber alloc] initWithInt:550], //for third game
                          nil];
        [money setObject:mon22 forKey:[NSNumber numberWithInt:22]];
        NSArray* mon23 = [[NSArray alloc] initWithObjects:
                          [[NSNumber alloc] initWithInt:230], //for first game
                          [[NSNumber alloc] initWithInt:370], //for second game
                          [[NSNumber alloc] initWithInt:780], //for third game
                          nil];
        [money setObject:mon23 forKey:[NSNumber numberWithInt:23]];
        NSArray* mon24 = [[NSArray alloc] initWithObjects:
                          [[NSNumber alloc] initWithInt:400], //for first game
                          [[NSNumber alloc] initWithInt:640], //for second game
                          [[NSNumber alloc] initWithInt:1340], //for third game
                          nil];
        [money setObject:mon24 forKey:[NSNumber numberWithInt:24]];
        
        NSArray* mon31 = [[NSArray alloc] initWithObjects:
                          [[NSNumber alloc] initWithInt:750], //for first game
                          [[NSNumber alloc] initWithInt:1200], //for second game
                          [[NSNumber alloc] initWithInt:2500], //for third game
                          nil];
        [money setObject:mon31 forKey:[NSNumber numberWithInt:31]];
        NSArray* mon32 = [[NSArray alloc] initWithObjects:
                          [[NSNumber alloc] initWithInt:1250], //for first game
                          [[NSNumber alloc] initWithInt:2000], //for second game
                          [[NSNumber alloc] initWithInt:4200], //for third game
                          nil];
        [money setObject:mon32 forKey:[NSNumber numberWithInt:32]];
        NSArray* mon33 = [[NSArray alloc] initWithObjects:
                          [[NSNumber alloc] initWithInt:2250], //for first game
                          [[NSNumber alloc] initWithInt:3600], //for second game
                          [[NSNumber alloc] initWithInt:7550], //for third game
                          nil];
        [money setObject:mon33 forKey:[NSNumber numberWithInt:33]];
        NSArray* mon34 = [[NSArray alloc] initWithObjects:
                          [[NSNumber alloc] initWithInt:3750], //for first game
                          [[NSNumber alloc] initWithInt:6000], //for second game
                          [[NSNumber alloc] initWithInt:12600], //for third game
                          nil];
        [money setObject:mon34 forKey:[NSNumber numberWithInt:34]];
        NSArray* mon35 = [[NSArray alloc] initWithObjects:
                          [[NSNumber alloc] initWithInt:4950], //for first game
                          [[NSNumber alloc] initWithInt:7900], //for second game
                          [[NSNumber alloc] initWithInt:16500], //for third game
                          nil];
        [money setObject:mon35 forKey:[NSNumber numberWithInt:35]];
        NSArray* mon36 = [[NSArray alloc] initWithObjects:
                          [[NSNumber alloc] initWithInt:5200], //for first game
                          [[NSNumber alloc] initWithInt:8300], //for second game
                          [[NSNumber alloc] initWithInt:17000], //for third game
                          nil];
        [money setObject:mon36 forKey:[NSNumber numberWithInt:36]];
        
        NSArray* mon41 = [[NSArray alloc] initWithObjects:
                          [[NSNumber alloc] initWithInt:6100], //for first game
                          [[NSNumber alloc] initWithInt:9750], //for second game
                          [[NSNumber alloc] initWithInt:20000], //for third game
                          nil];
        [money setObject:mon41 forKey:[NSNumber numberWithInt:41]];
        NSArray* mon42 = [[NSArray alloc] initWithObjects:
                          [[NSNumber alloc] initWithInt:7500], //for first game
                          [[NSNumber alloc] initWithInt:12000], //for second game
                          [[NSNumber alloc] initWithInt:25000], //for third game
                          nil];
        [money setObject:mon42 forKey:[NSNumber numberWithInt:42]];
        NSArray* mon43 = [[NSArray alloc] initWithObjects:
                          [[NSNumber alloc] initWithInt:9990], //for first game
                          [[NSNumber alloc] initWithInt:16000], //for second game
                          [[NSNumber alloc] initWithInt:30000], //for third game
                          nil];
        [money setObject:mon43 forKey:[NSNumber numberWithInt:43]];

        
		CGSize size = [[CCDirector sharedDirector] winSize];

        
        combinations = [[NSMutableArray alloc] init];
        
        
		labelYourLuck = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"%d%%", [Common instance].yourluck] fontName:@"Marker Felt" fontSize:24];
		labelYourLuck.position =  ccp( 637 , 720 );
		[self addChild: labelYourLuck z:100];
        
        labelBet = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"BET: %d", [Common instance].coins * [Common instance].lines] fontName:@"Marker Felt" fontSize:34];
		labelBet.position =  ccp( 510 , 37 );
		[self addChild: labelBet z:100];

        [Common instance].levelwin = 0;
//        int t1 = [[Common instance] getStarsForLevel:[Common instance].curlevel];
        
        int lmoney = [self getLmoney];
        
        labelLevelMoney = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"%d / %d", [Common instance].levelwin, lmoney] fontName:@"Marker Felt" fontSize:24];
		labelLevelMoney.position =  ccp( 910 , 677 );
		[self addChild: labelLevelMoney z:16];
        
		labelFameLevel = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"Level of fame: %d. Points: %d", [Common instance].famelevel1, [Common instance].famepoints] fontName:@"Marker Felt" fontSize:18];
		labelFameLevel.position =  ccp( 145 , 130 );
		[self addChild: labelFameLevel z:100];

		CCLabelTTF* lastwin = [CCLabelTTF labelWithString:@"LAST WIN" fontName:@"Marker Felt" fontSize:34];
		lastwin.position =  ccp( 510 , 160 );
		[self addChild: lastwin z:100];

		CCLabelTTF* coinslab = [CCLabelTTF labelWithString:@"Coins" fontName:@"Marker Felt" fontSize:20];
		coinslab.position =  ccp( 315 , 170 );
		[self addChild: coinslab z:100];
        
		CCLabelTTF* lineslab = [CCLabelTTF labelWithString:@"Lines" fontName:@"Marker Felt" fontSize:20];
		lineslab.position =  ccp( 710 , 170 );
		[self addChild: lineslab z:100];
        
		lastw = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"%d", [Common instance].lastwin] fontName:@"Marker Felt" fontSize:34];
		lastw.position =  ccp( 510 , 110 );
		[self addChild: lastw z:100];
        
		label = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"%.3f", [Common instance].speed] fontName:@"Marker Felt" fontSize:24];
		label.position =  ccp( size.width /2 , 40 );
//		[self addChild: label z:100];

        labelCoins = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"%d", [Common instance].coins] fontName:@"Marker Felt" fontSize:44];
        labelCoins.color = ccc3(0, 0, 0);
        labelCoins.position =  ccp( 320 , 80 );
        [self addChild: labelCoins z:10];
        
        labelLines = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"%d", [Common instance].lines] fontName:@"Marker Felt" fontSize:44];
        labelLines.color = ccc3(0, 0, 0);
        labelLines.position =  ccp( 710 , 80 );
        [self addChild: labelLines z:10];

        labelMoney = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"%d", [Common instance].money] fontName:@"Marker Felt" fontSize:44];
        labelMoney.color = ccc3(0, 0, 0);
        labelMoney.position =  ccp( 300 , 730 );
        [self addChild: labelMoney z:10];

        labelKeys = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"%d", [Common instance].keys] fontName:@"Marker Felt" fontSize:44];
        labelKeys.color = ccc3(0, 0, 0);
        labelKeys.position =  ccp( 900 , 730 );
        [self addChild: labelKeys z:13];

        CCSprite* back = [CCSprite spriteWithFile:@"FonSlot01.png"];
        [self addChild:back z:5];
        back.position = ccp( size.width / 2, size.height / 2);

        CCSprite* levelback = [CCSprite spriteWithFile:@"WhileFonLevel.png"];
        [self addChild:levelback z:3];
        levelback.position = ccp(410, 678);
        
        star = [CCSprite spriteWithFile:@"Star.png"];
        [self addChild:star z:333];
        star.opacity = 0;

        for(int i = 0; i < BARS_CNT; i++) {

            stars[i] = [CCSprite spriteWithFile:@"Star.png"];
            [self addChild:stars[i] z:333];
            stars[i].opacity = 0;

        }

        level = [CCSprite spriteWithFile:@"BlueFonLevel.png"];
        [self addChild:level z:4];
        level.position = ccp(-400, 678);

//        CCSprite* yluck = [CCSprite spriteWithFile:@"Luck.png"];
//        [self addChild:yluck z:7];
//        yluck.position = ccp(633, 730);
        
        luck1 = [CCSprite spriteWithFile:@"listLuck01.png"];
        luck1.position = ccp(634.5, 688);
        luck1.opacity = 0;
        [self addChild:luck1 z:7];
        luck2 = [CCSprite spriteWithFile:@"listLuck02.png"];
        luck2.position = ccp(634.5, 624);
        luck2.opacity = 0;
        [self addChild:luck2 z:7];
        luck3 = [CCSprite spriteWithFile:@"listLuck03.png"];
        luck3.position = ccp(634.5, 566);
        luck3.opacity = 0;
        [self addChild:luck3 z:7];

        CCLabelTTF* luplus = [CCLabelTTF labelWithString:@"++" fontName:@"Marker Felt" fontSize:35];
        CCMenuItemLabel* item_lu1 = [CCMenuItemLabel itemWithLabel:luplus target:self selector:@selector(luckPlus)];
        CCLabelTTF* luminus = [CCLabelTTF labelWithString:@"--" fontName:@"Marker Felt" fontSize:35];
        CCMenuItemLabel* item_lu2 = [CCMenuItemLabel itemWithLabel:luminus target:self selector:@selector(luckMinus)];
        [item_lu1 setPosition:ccp(690, 725)];
        [item_lu2 setPosition:ccp(580, 725)];

        
        
        CCSprite* fameback = [CCSprite spriteWithFile:@"WhileFonFame.png"];
        [self addChild:fameback z:3];
        fameback.position = ccp(155, 95);
        
        fame = [CCSprite spriteWithFile:@"BlueFonFame.png"];
        [self addChild:fame z:4];
        fame.position = ccp(-5, 95);
        
        int y = size.height / 2 - 107;
        int x = size.width / 2 - 299;

//        bar[0] = [[Bar alloc] initWithLayer:self X:x Y:y Delay:DELAY1];
//        bar[1] = [[Bar alloc] initWithLayer:self X:(x + 150) Y:y Delay:DELAY2];
//        bar[2] = [[Bar alloc] initWithLayer:self X:(x + 300) Y:y Delay:DELAY3];
//        bar[3] = [[Bar alloc] initWithLayer:self X:(x + 450) Y:y Delay:DELAY4];
//        bar[4] = [[Bar alloc] initWithLayer:self X:(x + 600) Y:y Delay:DELAY5];
        
        bar[0] = [[Bar alloc] initWithLayer:self X:x Y:y Delay:DELAY1 BonDelay1:BON1DELAY1 BonDelay2:BON2DELAY1 BonDelay4:BON4DELAY1];
        bar[1] = [[Bar alloc] initWithLayer:self X:(x + 150) Y:y Delay:DELAY2 BonDelay1:BON1DELAY2 BonDelay2:BON2DELAY2 BonDelay4:BON4DELAY2];
        bar[2] = [[Bar alloc] initWithLayer:self X:(x + 300) Y:y Delay:DELAY3 BonDelay1:BON1DELAY3 BonDelay2:BON2DELAY3 BonDelay4:BON4DELAY3];
        bar[3] = [[Bar alloc] initWithLayer:self X:(x + 450) Y:y Delay:DELAY4 BonDelay1:BON1DELAY4 BonDelay2:BON2DELAY4 BonDelay4:BON4DELAY4];
        bar[4] = [[Bar alloc] initWithLayer:self X:(x + 600) Y:y Delay:DELAY5 BonDelay1:BON1DELAY5 BonDelay2:BON2DELAY5 BonDelay4:BON4DELAY5];
        
        CCSprite *spriteSpin = [CCSprite spriteWithFile:@"Spin.png"];
        CCSprite *spriteSpinSelected = [CCSprite spriteWithFile:@"TouchSpin.png"];
		CCMenuItemSprite *item1 = [CCMenuItemSprite itemWithNormalSprite:spriteSpin selectedSprite:spriteSpinSelected block:^(id sender) {
            
//            NSLog(@"Spin clicked! finished = %d", [Common instance].finished);
            if([Common instance].coins * [Common instance].lines <= [Common instance].money)
            if(!info && [Common instance].finished <= 0) {

                [menu setEnabled:NO];

                dropped_lab.visible = NO;
                droppedcomp.visible = NO;

                bigwin.visible = NO;

                [[Common instance] validateRnd];
                for(Combination* comb in combinations)
                    [comb release];
                [combinations removeAllObjects];

                for(int i = 0; i < LINES_CNT; i++)
                    lineSprite[i].position = ccp(-5000, -5000);

                [Common instance].money -= ([Common instance].coins * [Common instance].lines);
                [self refreshLabels];

                
                [Common instance].finished = BARS_CNT * SLIDE_CNT;

                for(int i = 0; i < BARS_CNT; i++)
                    [bar[i] start];

                
                [Common instance].famepoints ++;
                [self refreshLabels];
                
                [self performSelector:@selector(checkLines) withObject:nil afterDelay:(DELAY5 + 0.5f)];

                star.position = ccp(814, 156);
                star.opacity = 0;
                star.scale = STAR_STARTSCALE;
                id jump = [CCJumpTo actionWithDuration:1.0f position:ccp(52, 126) height:130 jumps:1];
                id op = [CCSequence actions:[CCFadeIn actionWithDuration:0.05f], [CCDelayTime actionWithDuration:0.8f], [CCFadeOut actionWithDuration:0.15f], nil];
                id zoom = [CCSequence actions:[CCScaleTo actionWithDuration:0.5f scale:STAR_ENDSCALE], [CCScaleTo actionWithDuration:0.5f scale:STAR_STARTSCALE], [CCCallFunc actionWithTarget:self selector:@selector(starFinished)], nil];
                [star runAction:jump];
                [star runAction:op];
                [star runAction:zoom];
            }
            
		}];
        
        [item1 setPosition:ccp(879.5f, 92.5f)];
        
        CCLabelTTF* labelplus = [CCLabelTTF labelWithString:@"++++" fontName:@"Marker Felt" fontSize:35];
        CCMenuItemLabel* item2 = [CCMenuItemLabel itemWithLabel:labelplus target:self selector:@selector(speedPlus)];
        CCLabelTTF* labelminus = [CCLabelTTF labelWithString:@"----" fontName:@"Marker Felt" fontSize:35];
        CCMenuItemLabel* item3 = [CCMenuItemLabel itemWithLabel:labelminus target:self selector:@selector(speedMinus)];
        [item2 setPosition:ccp(size.width / 2 - 70, 40)];
        [item3 setPosition:ccp(size.width / 2 + 70, 40)];
        
        CCSprite *spplus1 = [CCSprite spriteWithFile:@"Plas.png"];
        CCSprite *spplus_t1 = [CCSprite spriteWithFile:@"TouchPlas.png"];
		CCMenuItemSprite *itempl1 = [CCMenuItemSprite itemWithNormalSprite:spplus1 selectedSprite:spplus_t1 block:^(id sender) {
            
            if([Common instance].coins < ([Common instance].lines / 2))
                [Common instance].coins ++;
            
            [self refreshLabels];
            
		}];
        [itempl1 setPosition:ccp(317.5f, 132)];
        
        CCSprite *spplus2 = [CCSprite spriteWithFile:@"Plas.png"];
        CCSprite *spplus_t2 = [CCSprite spriteWithFile:@"TouchPlas.png"];
		CCMenuItemSprite *itempl2 = [CCMenuItemSprite itemWithNormalSprite:spplus2 selectedSprite:spplus_t2 block:^(id sender) {

            if([Common instance].lines < /*LINES_CNT*/[Common instance].linesBought)
                [Common instance].lines ++;
            
            [self refreshLabels];
            
            for(Combination* comb in combinations)
                [comb release];
            [combinations removeAllObjects];
            for(int i = 0; i < LINES_CNT; i++)
                lineSprite[i].position = ccp(-5000, -5000);
            for(int i = 0; i < [Common instance].lines; i++)
                lineSprite[i].position = ccp(513, 418);


            
		}];
        [itempl2 setPosition:ccp(706.5f, 132)];
        
        CCSprite *spmnus1 = [CCSprite spriteWithFile:@"Minus.png"];
        CCSprite *spmnus_t1 = [CCSprite spriteWithFile:@"TouchMinus.png"];
		CCMenuItemSprite *itemmn1 = [CCMenuItemSprite itemWithNormalSprite:spmnus1 selectedSprite:spmnus_t1 block:^(id sender) {
           
            if([Common instance].coins > 1)
                [Common instance].coins --;
            
            [self refreshLabels];
            
		}];
        [itemmn1 setPosition:ccp(317.5f, 35)];
        
        CCSprite *spmnus2 = [CCSprite spriteWithFile:@"Minus.png"];
        CCSprite *spmnus_t2 = [CCSprite spriteWithFile:@"TouchMinus.png"];
		CCMenuItemSprite *itemmn2 = [CCMenuItemSprite itemWithNormalSprite:spmnus2 selectedSprite:spmnus_t2 block:^(id sender) {
        
            if([Common instance].lines > 1)
                [Common instance].lines --;
            
            [self refreshLabels];
            
            for(Combination* comb in combinations)
                [comb release];
            [combinations removeAllObjects];
            for(int i = 0; i < LINES_CNT; i++)
                lineSprite[i].position = ccp(-5000, -5000);
            for(int i = 0; i < [Common instance].lines; i++)
                lineSprite[i].position = ccp(513, 418);


		}];
        [itemmn2 setPosition:ccp(706.5f, 35)];

        infoscene = [CCSprite spriteWithFile:@"FonInfo.png"];
        [infoscene setPosition:ccp(-512, 438)];
        [self addChild: infoscene z:560];

        for(int i = 0; i < SLIDE_TYPES; i++) {
            
            slide[i] = [CCSprite spriteWithFile:[NSString stringWithFormat:@"slotStilistik01-%d.png", i] /*rect:CGRectMake(0, 0, 130, 110)*/];

            int k = (i > 1)?108:130;
            [slide[i] setScaleX: k/slide[0].contentSize.width];
            [slide[i] setScaleY: k/slide[0].contentSize.height];
            
            [self addChild:slide[i] z:561];
        }
        slide[0].position = ccp(-889, 471);//WILD
        slide[1].position = ccp(-889, 301);//SCATTER
        slide[2].position = ccp(-184, 510);//J
        slide[3].position = ccp(-404, 262);//Q
        slide[4].position = ccp(-404, 386);//K
        slide[5].position = ccp(-404, 510);//A
        slide[6].position = ccp(-624, 510);//A
        slide[7].position = ccp(-624, 386);//A
        slide[8].position = ccp(-624, 262);//A
        slide[9].position = ccp(-184, 262);//9
        slide[10].position = ccp(-184, 386);//10
        
        CCSprite *spinfo = [CCSprite spriteWithFile:@"Info.png"];
        CCSprite *spinfo_t1 = [CCSprite spriteWithFile:@"TouchInfo.png"];
		CCMenuItemSprite *iteminfo = [CCMenuItemSprite itemWithNormalSprite:spinfo selectedSprite:spinfo_t1 block:^(id sender) {

            if(!info) {
   
                info = YES;
                
                colorLayer.opacity = 0;
                CCAction* action = [CCFadeTo actionWithDuration:0.3f opacity:180];
                [colorLayer runAction:action];

                [infoscene runAction:[CCMoveBy actionWithDuration:0.3f position:ccp(1024,0)]];
                for(int i = 0; i < SLIDE_TYPES; i++)
                    [slide[i] runAction:[CCMoveBy actionWithDuration:0.3f position:ccp(1024,0)]];

            }
            
		}];
        
        [iteminfo setPosition:ccp(971, 623)];

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
            menu.enabled = NO;

            
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

		}];
        [iteminapp1 setPosition:ccp(975.5, 730)];
        
        CCSprite *spgc = [CCSprite spriteWithFile:@"GameCenter.png"];
        CCSprite *spgc_t1 = [CCSprite spriteWithFile:@"TouchGameCenter.png"];
        CCMenuItemSprite *itemgc = [CCMenuItemSprite itemWithNormalSprite:spgc selectedSprite:spgc_t1 block:^(id sender) {
            
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
            
//            shoplay.position = ccp(0, 0);
            [shoplay show];

		}];
        [itemshop setPosition:ccp(740, 730)];

        CCSprite *spluck = [CCSprite spriteWithFile:@"Luck.png"];
        CCSprite *spluck_t1 = [CCSprite spriteWithFile:@"TouchLuck.png"];
        CCMenuItemSprite *itemluck = [CCMenuItemSprite itemWithNormalSprite:spluck selectedSprite:spluck_t1 block:^(id sender) {
            
            //        NSLog(@"luck");
            if(luck1.opacity > 0) {
                
                [luck1 runAction:[CCFadeOut actionWithDuration:Ldelay]];
                [luck2 runAction:[CCFadeOut actionWithDuration:Ldelay]];
                [luck3 runAction:[CCFadeOut actionWithDuration:Ldelay]];
                
            }
            else {
                
                [luck1 runAction:[CCFadeIn actionWithDuration:Ldelay]];
                [luck2 runAction:[CCFadeIn actionWithDuration:Ldelay]];
                [luck3 runAction:[CCFadeIn actionWithDuration:Ldelay]];
                
            }
            
        }];
        [itemluck setPosition:ccp(633, 730)];

        menu = [CCMenu menuWithItems: item1, /*item2, item3,*/ itempl1, itempl2, itemmn1, itemmn2, iteminfo, /*itemback, item_lu1, item_lu2,*/ iteminapp, iteminapp1, itemgc, itemshop, itemluck, nil];
        [self addChild: menu z:7];
		[menu setPosition:ccp(0, 0)];

        CCMenu* menuback = [CCMenu menuWithItems: itemback, nil];
        [self addChild: menuback z:7];
		[menuback setPosition:ccp(0, 0)];

        CCSprite *spmenu = [CCSprite spriteWithFile:@"ButtonMenu.png"];
        CCSprite *spmenu_t1 = [CCSprite spriteWithFile:@"TouchButtonMenu.png"];
		CCMenuItemSprite *itemMenu = [CCMenuItemSprite itemWithNormalSprite:spmenu selectedSprite:spmenu_t1 block:^(id sender) {
            
            [[Common instance] increaseStarsForCurrentLevel];
            [[Common instance] increaseLevel];
            [[CCDirector sharedDirector] popScene];
            
		}];
        [itemMenu setPosition:ccp(510, 210)];
        
        menu1 = [CCMenu menuWithItems: itemMenu, nil];
        [self addChild: menu1 z:1301];
		[menu1 setPosition:ccp(0, 0)];
        
        for(int i = 0; i < LINES_CNT; i++) {
            
            lineSprite[i] = [CCSprite spriteWithFile:[NSString stringWithFormat:@"Line%02d.png", i + 1]];
            lineSprite[i].position = ccp(-5000, -5000);
            [self addChild:lineSprite[i] z:6];
        }

        
        
        complete = [CCSprite spriteWithFile:@"WinView.png"];
        complete.visible = NO;
        [self addChild:complete z:1300];
        complete.position = ccp(512, 384);

        ygift = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"%d", 0] fontName:@"Marker Felt" fontSize:48];
		ygift.position =  ccp( 512 , 340 );
        ygift.visible = NO;
		[self addChild: ygift z:1400];

        [menu setEnabled:YES];
        [menu1 setEnabled:NO];
        [menu setVisible:YES];
        [menu1 setVisible:NO];

        
        droppedcomp = [CCSprite spriteWithFile:@"LineCombination.png"];
        droppedcomp.visible = NO;
        [self addChild:droppedcomp z:500];
        droppedcomp.position = ccp(514.5, 219);
        
        dropped_lab = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"Dropped %d Combinations", 0] fontName:@"Marker Felt" fontSize:30];
		dropped_lab.position =  ccp( 514.5 , 219 );
        dropped_lab.visible = NO;
		[self addChild: dropped_lab z:501];

        bigwin = [CCSprite spriteWithFile:@"BigWin.png"];
        bigwin.visible = NO;
        [self addChild:bigwin z:750];
        bigwin.position = ccp(512, 416.5);

        int n1 = [Common instance].curlevel / 10;
        int n2 = [Common instance].curlevel - n1 * 10;
        CCLabelTTF* title = [CCLabelTTF labelWithString:(n2 == 9)?[NSString stringWithFormat:@"Bonus Level %d", n1]:[NSString stringWithFormat:@"Level %d-%d", n1, n2] fontName:@"Marker Felt" fontSize:28];
        [self addChild:title z:16];
        title.position = ccp(512, 650);

        [self refreshLabels];
	}
	return self;
}

-(void)starFinished {
    
//    NSLog(@"starFinished %d", [Common instance].famepoints);
    
    int lmoney = [self getLmoney];
    [labelLevelMoney setString:[NSString stringWithFormat:@"%d / %d", [Common instance].levelwin, lmoney]];

    float p = [Common instance].levelwin > lmoney?lmoney:[Common instance].levelwin;
    float x = p * 810 / lmoney;
    level.position = ccp(-400 + x, 678);
    

    int k = 0;
    for(int i = 0; i < FAME_LEVELS; i++)
        if([Common instance].famepoints < [[Common instance] getFames:i]) {
            k = i;
            break;
        }

    [Common instance].famelevel1 = (k + 1);
    
    p = [Common instance].famepoints - (k>0?[[Common instance] getFames:(k-1)]:0);
    x = p * 160 / ([[Common instance] getFames:k] - (k>0?[[Common instance] getFames:(k-1)]:0));
    
//    NSLog(@"x = %f, p = %f", x, p);
    [fame stopAllActions];
    [fame runAction:[CCMoveTo actionWithDuration:0.7f position:ccp(-5 + x, 95)]];
    [labelFameLevel setString:[NSString stringWithFormat:@"Level of fame: %d. Points: %d", [Common instance].famelevel1, [Common instance].famepoints]];


}

-(void) leaderboardViewControllerDidFinish:(GKLeaderboardViewController *)viewController
{
	AppController *app = (AppController*) [[UIApplication sharedApplication] delegate];
	[[app navController] dismissModalViewControllerAnimated:YES];
}

-(void) afterBonus {
    
    NSLog(@"afterBonus");

    CCAction* action = [CCFadeTo actionWithDuration:0.1f opacity:0];
    [colorLayer runAction:action];
    menu.enabled = YES;
    [bonlay hide];
    bonus = NO;

}

- (void) afterShop {
    
    if(!menu.enabled) {

        NSLog(@"afterShop");
        CCAction* action = [CCFadeTo actionWithDuration:0.3f opacity:0];
        [colorLayer runAction:action];
        menu.enabled = YES;
    }
    
}

-(void) toTop {
    
    NSLog(@"toTop");
    if (bonus) {
        
        [self afterBonus];
        return;
    }
    CCAction* action = [CCFadeTo actionWithDuration:0.3f opacity:0];
    [colorLayer runAction:action];
    menu.enabled = YES;
    [inlay runAction:[CCMoveTo actionWithDuration:0.3f position:ccp(1024,0)]];
    [inlay hide];
}

- (void) refreshLabels {

    [labelCoins setString:[NSString stringWithFormat:@"%d", [Common instance].coins]];
    [labelLines setString:[NSString stringWithFormat:@"%d", [Common instance].lines]];
    [lastw setString:[NSString stringWithFormat:@"%d", [Common instance].lastwin]];
    [labelMoney setString:[NSString stringWithFormat:@"%d", [Common instance].money]];
    [labelKeys setString:[NSString stringWithFormat:@"%d", [Common instance].keys]];
    [labelYourLuck setString:[NSString stringWithFormat:@"%d%%", [Common instance].yourluck]];
    [labelBet setString:[NSString stringWithFormat:@"BET: %d", [Common instance].coins * [Common instance].lines]];
    
}

- (void) speedPlus {
    
    [Common instance].speed += 0.001;
    if([Common instance].speed > 0.1)
        [Common instance].speed = 0.1;
    
    [label setString:[NSString stringWithFormat:@"%.3f", [Common instance].speed]];
}

- (void) speedMinus {
    
    [Common instance].speed -= 0.001;
    if([Common instance].speed < 0.01)
        [Common instance].speed = 0.01f;
    
    [label setString:[NSString stringWithFormat:@"%.3f", [Common instance].speed]];
}

- (void) checkLines {
    
//    NSLog(@"---------checkLines");

    BOOL bon2 = ([Common instance].curlevel == 29);// second bonus level
    BOOL bon3 = ([Common instance].curlevel == 39);// third bonus level

    [Common instance].finished = 0;
    int winsum = 0;
    
    for(int i = 0; i < [Common instance].lines; i++) {
//    for(int i = 5; i < 6; i++) {

        for(int fpos = 0; fpos < (bon2?(BARS_CNT - 1):1); fpos++) {

            NSMutableArray* arr = [NSMutableArray array];

//             NSLog(@"--fpos: %d", fpos);

//            int first = [bar[0] getSlideNum:[[[lines objectAtIndex:i] objectAtIndex:0] intValue]];
//            CCSprite* ss = [bar[0] getSprite:[[[lines objectAtIndex:i] objectAtIndex:0] intValue]];
            int first = 0;
            CCSprite* ss = 0;
            if(bon3) {
            
                first = [bar[(BARS_CNT - 1)] getSlideNum:[[[lines objectAtIndex:i] objectAtIndex:(BARS_CNT - 1)] intValue]];
                ss = [bar[(BARS_CNT - 1)] getSprite:[[[lines objectAtIndex:i] objectAtIndex:(BARS_CNT - 1)] intValue]];
            }
            else {

                first = [bar[fpos] getSlideNum:[[[lines objectAtIndex:i] objectAtIndex:fpos] intValue]];
                ss = [bar[fpos] getSprite:[[[lines objectAtIndex:i] objectAtIndex:fpos] intValue]];
                
            }
//            NSLog(@"--- add: %d", ss.tag);
            [arr addObject:ss];
//             NSLog(@"--fpos: %d first at fpos: %d", fpos, first);


            int cnt = 1;

            if (bon3) {//third bonus level
                for(int j = (BARS_CNT - 2); j >= fpos; j--) {
                    
                    int slide1 = [bar[j] getSlideNum:[[[lines objectAtIndex:i] objectAtIndex:j] intValue]];
                    CCSprite* ss = [bar[j] getSprite:[[[lines objectAtIndex:i] objectAtIndex:j] intValue]];

//                    cnt++;
                    if((slide1 == first) || (slide1 == 0 /*WILD*/)) {
                        cnt++;
                        [arr addObject:ss];
                    }
                    else
                        if(first == 0) {
                            cnt++;
                            [arr addObject:ss];
                            first = slide1;
                        }
                        else
                            break;
                }
            }
            else //not third bonus level
            for(int j = (fpos + 1); j < BARS_CNT; j++) {
            
                int slide1 = [bar[j] getSlideNum:[[[lines objectAtIndex:i] objectAtIndex:j] intValue]];
                CCSprite* ss = [bar[j] getSprite:[[[lines objectAtIndex:i] objectAtIndex:j] intValue]];

                if((slide1 == first) || (slide1 == 0 /*WILD*/)) {
                    cnt++;
                    [arr addObject:ss];
                }
                 else
                     if(first == 0) {
                         cnt++;
                         [arr addObject:ss];
                         first = slide1;
                     }
                    else
                        break;
            }
           

            
            int mmoney = 0;

            
            
            
            if(cnt > 1)
                mmoney = [[[values objectAtIndex:first]objectAtIndex:(cnt - 2)] intValue];

            if(mmoney > 0) {

//                NSLog(@"first = %d, cnt = %d, fpos = %d, i = %d", first, cnt, fpos, i);

                [Common instance].money += ( mmoney * [Common instance].coins );
                
                NSLog(@"Coins = %d, money = %d, slide = %d", [Common instance].coins, mmoney, first);
                
                float koeff = 1;
                int n1 = [Common instance].curlevel / 10;
                int n2 = [Common instance].curlevel - n1 * 10;
                
                if (n2 == 9) //bonus level
                    switch (n1) {
                        case 1:
                            koeff = 1.5f;
                            break;
                        case 2:
                            koeff = 2.5f;
                            break;
                        case 3:
                            koeff = 2.0f;
                            break;
                        case 4:
                            koeff = 4.0f;
                            break;
                    }

                int wsum = mmoney * [Common instance].coins;
                int sum = wsum * koeff;
                
                NSLog(@"Winsum = %d, koeff for bonusl level = %f, sum = %d", wsum, koeff, sum);
                winsum += sum;//mmoney * [Common instance].coins;
                
                [Common instance].famepoints += cnt;
                [self refreshLabels];

                
                if(bon3) {
                    
//                    NSLog(@"add object %@", arr);
                    NSMutableArray* arr1 = [NSMutableArray array];
                    for(int u = (arr.count - 1); u >= 0; u--) {
                        
//                        NSLog(@"u = %d, cnt = %d", u, arr.count);
                        [arr1 addObject:[arr objectAtIndex:u]];
                    }
                    
//                    NSLog(@"add object1 %@", arr1);
                    [combinations addObject:[[Combination alloc]initWithLayer:self sprite:lineSprite[i] line:i count:cnt linePos:[lines objectAtIndex:i] sprites:arr1 atIndex:(BARS_CNT - cnt)]];

                }
                else {
                [combinations addObject:[[Combination alloc]initWithLayer:self sprite:lineSprite[i] line:i count:cnt linePos:[lines objectAtIndex:i] sprites:arr atIndex:(fpos)]];
                }
                break;
            }
            
//            break;//ubrat
        }
        
    
    }

    [menu setEnabled:YES];
    [menu1 setEnabled:NO];

    if(combinations.count > 0) {
        
        [Common instance].lastwin = winsum;
        [Common instance].levelwin += winsum;
        [self refreshLabels];
        [self performSelector:@selector(showComb) withObject:nil afterDelay:0];
    }
    
    if(combinations.count > 3) {

        [dropped_lab setString:[NSString stringWithFormat:@"Dropped %d Combinations", combinations.count]];
        dropped_lab.visible = YES;
        droppedcomp.visible = YES;
    }
    

    bon = !bon;
    
    if(bon) {
//        colorLayer.opacity = 0;
//        CCAction* action = [CCFadeTo actionWithDuration:0.1f opacity:180];
//        [colorLayer runAction:action];
//
//        menu.enabled = NO;
//        
//        bonlay.position = ccp(0, 0);
//        [bonlay show];
//        bonus = YES;
    }
    else {

//        bigwin.opacity = 0;
//        bigwin.visible = YES;
//        [bigwin runAction:[CCFadeIn actionWithDuration:0.5f]];
        
    }
    
    int lmoney = [self getLmoney];
//    if(1) {
    if([Common instance].levelwin >= lmoney) {
        
        
        int j = CCRANDOM_0_1() * 7;
        j = 250 + 50*j;
        
        [ygift setString:[NSString stringWithFormat:@"%d", j]];
        
        [Common instance].money += j;
        [labelMoney setString:[NSString stringWithFormat:@"%d", [Common instance].money]];
        
        complete.visible = YES;
        
        [menu1 setEnabled:YES];
        [menu setEnabled:NO];
        [menu1 setVisible:YES];
        ygift.visible = YES;
        //        [menu setVisible:NO];
        
    }

}

- (void) showComb {
    
//    NSLog(@"showComb %d", combNum);
    
    if([Common instance].finished > 0) {
        
        NSLog(@"Delete combinations");

        for(Combination* comb in combinations)
            [comb release];
        [combinations removeAllObjects];
        prevComb = nil;
        combNum = 0;
        return;
    }
    
    
    if (combNum < combinations.count) {
        if(prevComb != nil)
           [prevComb hide];
        prevComb = [combinations objectAtIndex:combNum];
        [prevComb show];

        if(combNum == 0) {
            NSArray* a = [prevComb getComb];
//            NSLog(@"array comb = %@", a);
            int c = 0;
            if(a != nil)
                for(CCSprite* spr in a) {
                
                    stars[c].position = spr.position;
                    stars[c].opacity = 0;
                    stars[c].scale = STAR_STARTSCALE;
                    id jump = [CCJumpTo actionWithDuration:1.0f position:ccp(52, 126) height:300 jumps:1];
                    id op = [CCSequence actions:[CCFadeIn actionWithDuration:0.05f], [CCDelayTime actionWithDuration:0.8f], [CCFadeOut actionWithDuration:0.15f], nil];
                    id zoom = [CCSequence actions:[CCScaleTo actionWithDuration:0.5f scale:STAR_ENDSCALE], [CCScaleTo actionWithDuration:0.5f scale:STAR_STARTSCALE], [CCCallFunc actionWithTarget:self selector:@selector(starFinished)], nil];
                    [stars[c] runAction:jump];
                    [stars[c] runAction:op];
                    [stars[c] runAction:zoom];
                    c++;
                }
        }

    }
    combNum++;
    if(combNum >= combinations.count)
        combNum = 0;
    [self performSelector:@selector(showComb) withObject:nil afterDelay:1.0f];

}

- (void) luckPlus {
    
    [Common instance].yourluck += 5;
    if([Common instance].yourluck > 110)
        [Common instance].yourluck = 110;
    [self refreshLabels];
}

- (void) luckMinus {
    
    [Common instance].yourluck -= 5;
    if([Common instance].yourluck < 50)
        [Common instance].yourluck = 50;
    [self refreshLabels];
}

- (void)ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {

    if(info) {
       
        info = NO;
        [infoscene runAction:[CCMoveBy actionWithDuration:0.3f position:ccp(-1024,0)]];
        
        for(int i = 0; i < SLIDE_TYPES; i++)
            [slide[i] runAction:[CCMoveBy actionWithDuration:0.3f position:ccp(-1024,0)]];

        CCAction* action = [CCFadeTo actionWithDuration:0.1f opacity:0];
        [colorLayer runAction:action];

    }

if(droppedcomp.visible) {
    dropped_lab.visible = NO;
    droppedcomp.visible = NO;
}

}

- (void) dealloc {
    
    for(Combination* comb in combinations)
        [comb release];
    [combinations removeAllObjects];
    [combinations release];
    
	[super dealloc];
}

@end

