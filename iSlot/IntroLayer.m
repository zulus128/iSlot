//
//  IntroLayer.m
//  iSlot
//
//  Created by Zul on 2/6/13.
//  Copyright Zul 2013. All rights reserved.
//


// Import the interfaces
#import "IntroLayer.h"
#import "GameLayer.h"
//#import "CCMenuAdvanced.h"
#import "CCScrollLayer.h"

#pragma mark - IntroLayer

// HelloWorldLayer implementation
@implementation IntroLayer

// Helper class method that creates a Scene with the HelloWorldLayer as the only child.
+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	IntroLayer *layer = [IntroLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

// 
-(id) init
{
	if( (self=[super init])) {

//		CGSize size = [[CCDirector sharedDirector] winSize];

        CGSize screenSize = [CCDirector sharedDirector].winSize;
        
        
        
//        CCSprite* back = [CCSprite spriteWithFile:@"FonMainMenu.png"];
//        back.position = ccp( screenSize.width / 2, screenSize.height / 2);
//        [self addChild:back z:10];
        
        CCSprite* back1 = [CCSprite spriteWithFile:@"FonBack.png"];
//        back1.position = ccp( 512, 70.5);
        back1.position = ccp( 544, 70.5);
        [self addChild:back1 z:5];

//        polosa = [CCSprite spriteWithFile:@"TimeName.png"];
//        [self addChild:polosa z:6];
//        polosa.position = ccp(848.5, 70.5);
        
        NSMutableArray *layers = [NSMutableArray new];
        CCLayer *layer = [self layerWithChapterNumber:0 screenSize:screenSize];
        [layers addObject:layer];
        CCLayer *layer1 = [self layerWithChapterNumber:1 screenSize:screenSize];
        [layers addObject:layer1];
//        CCLayer *layer2 = [self layerWithChapterNumber:2 screenSize:screenSize];
//        [layers addObject:layer2];
        CCScrollLayer *scroller = [[CCScrollLayer alloc] initWithLayers:layers
                                                            widthOffset:570];
        [scroller selectPage:0];
        scroller.showPagesIndicator = NO;
//        scroller.pagesWidthOffset = 10;
//        scroller.marginOffset = 100;
//        scroller.minimumTouchLengthToChangePage = 50;
//        scroller.minimumTouchLengthToSlide = 50;
        [self addChild:scroller z:12];
        [scroller release];
        [layers release];
        
        labelMoney = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"%d", [Common instance].money] fontName:@"Marker Felt" fontSize:44];
        labelMoney.color = ccc3(0, 0, 0);
        labelMoney.position =  ccp( 300 , 730 );
        [self addChild: labelMoney z:13];

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

        [self refreshLabels];
        
        
        CCSprite *spsett = [CCSprite spriteWithFile:@"Setting.png"];
        CCSprite *spsett_t1 = [CCSprite spriteWithFile:@"Setting.png"];
		CCMenuItemSprite *itemsett = [CCMenuItemSprite itemWithNormalSprite:spsett selectedSprite:spsett_t1 block:^(id sender) {
            
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
        
        CCMenu* menu = [CCMenu menuWithItems: itemsett, itemfb, itemtwit, nil];
        [self addChild: menu z:107];
		[menu setPosition:ccp(0, 0)];

	}
	
	return self;
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
//        [menu alignItemsVertically];
        [layer addChild: menu];
    
    return layer;
}

- (void) refreshLabels {
    
    [labelMoney setString:[NSString stringWithFormat:@"%d", [Common instance].money]];
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
    
   [[CCDirector sharedDirector] pushScene:[GameLayer scene]];

}

- (void) onEnter {
    
    [super onEnter];
    
    [self refreshLabels];
}

@end
