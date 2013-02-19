//
//  GameLayer.m
//  iSlot
//
//  Created by Zul on 2/7/13.
//  Copyright (c) 2013 Zul. All rights reserved.
//

#import "GameLayer.h"
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
        
        lines = [[NSArray alloc] initWithObjects:line1, line2, line3, line4, line5, nil];
        

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
        
        
		CGSize size = [[CCDirector sharedDirector] winSize];

        combinations = [[NSMutableArray alloc] init];
        
        [Common instance].money = 1000;
        [Common instance].speed = SPEED1;
        [Common instance].coins = 1;
        [Common instance].lines = 5;

        
		label = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"%.2f", [Common instance].speed] fontName:@"Marker Felt" fontSize:24];
		label.position =  ccp( size.width /2 , 40 );
		[self addChild: label z:100];

        labelCoins = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"%d", [Common instance].coins] fontName:@"Marker Felt" fontSize:44];
        labelCoins.color = ccc3(0, 0, 0);
        labelCoins.position =  ccp( 320 , 90 );
        [self addChild: labelCoins z:10];
        
        labelLines = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"%d", [Common instance].lines] fontName:@"Marker Felt" fontSize:44];
        labelLines.color = ccc3(0, 0, 0);
        labelLines.position =  ccp( 710 , 90 );
        [self addChild: labelLines z:10];

        labelMoney = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"%d", [Common instance].money] fontName:@"Marker Felt" fontSize:44];
        labelMoney.color = ccc3(0, 0, 0);
        labelMoney.position =  ccp( 300 , 730 );
        [self addChild: labelMoney z:10];

        CCSprite* back = [CCSprite spriteWithFile:@"FonSlot01.png"];
        [self addChild:back z:5];
        back.position = ccp( size.width / 2, size.height / 2);

        int y = size.height / 2 - 107;
        int x = size.width / 2 - 299;

        bar[0] = [[Bar alloc] initWithLayer:self X:x Y:y Delay:DELAY1];
        bar[1] = [[Bar alloc] initWithLayer:self X:(x + 150) Y:y Delay:DELAY2];
        bar[2] = [[Bar alloc] initWithLayer:self X:(x + 300) Y:y Delay:DELAY3];
        bar[3] = [[Bar alloc] initWithLayer:self X:(x + 450) Y:y Delay:DELAY4];
        bar[4] = [[Bar alloc] initWithLayer:self X:(x + 600) Y:y Delay:DELAY5];
        
        CCSprite *spriteSpin = [CCSprite spriteWithFile:@"Spin.png"];
        CCSprite *spriteSpinSelected = [CCSprite spriteWithFile:@"TouchSpin.png"];
		CCMenuItemSprite *item1 = [CCMenuItemSprite itemWithNormalSprite:spriteSpin selectedSprite:spriteSpinSelected block:^(id sender) {
            
//            NSLog(@"Spin clicked! finished = %d", [Common instance].finished);
            if([Common instance].finished <= 0) {

                
                
                for(int i = 0; i < LINES_CNT; i++)
                    lineSprite[i].position = ccp(-5000, -5000);

                [Common instance].money -= [Common instance].coins;
                [self refreshLabels];

                
                [Common instance].finished = BARS_CNT * SLIDE_CNT;

                for(int i = 0; i < BARS_CNT; i++)
                    [bar[i] start];

                
                [self performSelector:@selector(checkLines) withObject:nil afterDelay:(DELAY5 + 0.5f)];

            }
            
		}];
        
        [item1 setPosition:ccp(890, 90)];
        
        CCLabelTTF* labelplus = [CCLabelTTF labelWithString:@"++++" fontName:@"Marker Felt" fontSize:35];
        CCMenuItemLabel* item2 = [CCMenuItemLabel itemWithLabel:labelplus target:self selector:@selector(speedPlus)];
        CCLabelTTF* labelminus = [CCLabelTTF labelWithString:@"----" fontName:@"Marker Felt" fontSize:35];
        CCMenuItemLabel* item3 = [CCMenuItemLabel itemWithLabel:labelminus target:self selector:@selector(speedMinus)];

        [item2 setPosition:ccp(size.width / 2 - 70, 40)];
        [item3 setPosition:ccp(size.width / 2 + 70, 40)];
        
        
        CCSprite *spplus1 = [CCSprite spriteWithFile:@"Plas.png"];
        CCSprite *spplus_t1 = [CCSprite spriteWithFile:@"TouchPlas.png"];
		CCMenuItemSprite *itempl1 = [CCMenuItemSprite itemWithNormalSprite:spplus1 selectedSprite:spplus_t1 block:^(id sender) {
            
            if([Common instance].coins < 5)
                [Common instance].coins ++;
            
            [self refreshLabels];
            
		}];
        [itempl1 setPosition:ccp(318, 155)];
        
        CCSprite *spplus2 = [CCSprite spriteWithFile:@"Plas.png"];
        CCSprite *spplus_t2 = [CCSprite spriteWithFile:@"TouchPlas.png"];
		CCMenuItemSprite *itempl2 = [CCMenuItemSprite itemWithNormalSprite:spplus2 selectedSprite:spplus_t2 block:^(id sender) {

            if([Common instance].lines < 5)
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
        [itempl2 setPosition:ccp(706, 155)];
        
        CCSprite *spmnus1 = [CCSprite spriteWithFile:@"Minus.png"];
        CCSprite *spmnus_t1 = [CCSprite spriteWithFile:@"TouchMinus.png"];
		CCMenuItemSprite *itemmn1 = [CCMenuItemSprite itemWithNormalSprite:spmnus1 selectedSprite:spmnus_t1 block:^(id sender) {
           
            if([Common instance].coins > 1)
                [Common instance].coins --;
            
            [self refreshLabels];
            
		}];
        [itemmn1 setPosition:ccp(318, 20)];
        
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
        [itemmn2 setPosition:ccp(706, 20)];
        
        CCMenu *menu = [CCMenu menuWithItems: item1, item2, item3, itempl1, itempl2, itemmn1, itemmn2, nil];
        [self addChild: menu z:7];
		[menu setPosition:ccp(0, 0)];

        
        for(int i = 0; i < LINES_CNT; i++) {
            
            lineSprite[i] = [CCSprite spriteWithFile:[NSString stringWithFormat:@"Line%02d.png", i + 1]];
            lineSprite[i].position = ccp(-5000, -5000);
            [self addChild:lineSprite[i] z:6];
        }
        
        [self refreshLabels];
	}
	return self;
}

- (void) refreshLabels {

    [labelCoins setString:[NSString stringWithFormat:@"%d", [Common instance].coins]];
    [labelLines setString:[NSString stringWithFormat:@"%d", [Common instance].lines]];

    [labelMoney setString:[NSString stringWithFormat:@"%d", [Common instance].money]];

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

    [Common instance].finished = 0;
    
    NSMutableArray* arr = [NSMutableArray array];
    
    for(int i = 0; i < [Common instance].lines; i++) {
    
        int first = [bar[0] getSlideNum:[[[lines objectAtIndex:i] objectAtIndex:0] intValue]];
        [arr addObject:[bar[0] getSprite:[[[lines objectAtIndex:i] objectAtIndex:0] intValue]]];
//        CCSprite* ss = [bar[0] getSprite:[[[lines objectAtIndex:i] objectAtIndex:0] intValue]];
//        ss.visible = NO;

        int cnt = 1;

        for(int j = 1; j < BARS_CNT; j++) {
        
        int slide = [bar[j] getSlideNum:[[[lines objectAtIndex:i] objectAtIndex:j]intValue]];
        [arr addObject:[bar[j] getSprite:[[[lines objectAtIndex:i] objectAtIndex:j] intValue]]];

        if((slide == first) || (slide == 0 /*WILD*/))
            cnt++;
         else
             if(first == 0) {
                 cnt++;
                 first = slide;
             }
//v            else
//v                break;
            
        }
//        NSLog(@"first = %d, cnt = %d", first, cnt);

        int money = 55;//v 0;
        if(cnt > 1)
            money = [[[values objectAtIndex:first]objectAtIndex:(cnt - 2)] intValue];
        
        if(money > 0) {

//            lineSprite[i].position = ccp(513, 418);
            [Common instance].money += ( money * [Common instance].coins );
            [self refreshLabels];
            
            NSLog(@"Coins = %d, money = %d, slide = %d", [Common instance].coins, money, first);
            NSLog(@"Bonus = %d", money * [Common instance].coins);
            cnt = 3;//v
            [combinations addObject:[[Combination alloc]initWithLayer:self sprite:lineSprite[i] line:i count:cnt linePos:[lines objectAtIndex:i] sprites:arr]];
        }
        
    
    }
    
    if(combinations.count > 0)
        [self performSelector:@selector(showComb) withObject:nil afterDelay:0];

    
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
    }
    combNum++;
    if(combNum >= combinations.count)
        combNum = 0;
    [self performSelector:@selector(showComb) withObject:nil afterDelay:0.5f];

}

// on "dealloc" you need to release all your retained objects
- (void) dealloc {
    
	// in case you have something to dealloc, do it in this method
	// in this particular example nothing needs to be released.
	// cocos2d will automatically release all the children (Label)
	
	// don't forget to call "super dealloc"
    
    for(Combination* comb in combinations)
        [comb release];
    [combinations removeAllObjects];
    [combinations release];
    
	[super dealloc];
}

@end

