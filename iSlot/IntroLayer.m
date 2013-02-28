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
        
        
        
        CCSprite* back = [CCSprite spriteWithFile:@"FonMainMenu.png"];
        back.position = ccp( screenSize.width / 2, screenSize.height / 2);
        [self addChild:back];

        
        NSMutableArray *layers = [NSMutableArray new];
        CCLayer *layer = [self layerWithChapterNumber:0 screenSize:screenSize];
        [layers addObject:layer];
        CCLayer *layer1 = [self layerWithChapterNumber:1 screenSize:screenSize];
        [layers addObject:layer1];
        CCScrollLayer *scroller = [[CCScrollLayer alloc] initWithLayers:layers
                                                            widthOffset:500];
        [scroller selectPage:0];
        scroller.showPagesIndicator = NO;
//        scroller.pagesWidthOffset = 10;
//        scroller.marginOffset = 100;
//        scroller.minimumTouchLengthToChangePage = 50;
//        scroller.minimumTouchLengthToSlide = 50;
        [self addChild:scroller];
        [scroller release];
        [layers release];
        
        
        
        
	}
	
	return self;
}
- (CCLayer*)layerWithChapterNumber:(int)chapterNumber
                      screenSize:(CGSize)screenSize {
    
    CCLayer *layer = [[CCLayer alloc] init];
//    [layer setScaleX:0.3f];
    NSString *s = chapterNumber == 0?@"PresentButton.png":@"FutureButton.png";
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

- (void)onSelectChapter:(CCMenuItemImage *)sender {
    
   [[CCDirector sharedDirector] pushScene:[GameLayer scene]];

}

@end
