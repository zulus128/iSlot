//
//  IntroLayer.m
//  iSlot
//
//  Created by Zul on 2/6/13.
//  Copyright Zul 2013. All rights reserved.
//


// Import the interfaces
#import "MapLayer.h"

//#import "CCScrollLayer.h"

@implementation MapLayer

// Helper class method that creates a Scene with the HelloWorldLayer as the only child.
+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
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

        CCSprite* top = [CCSprite spriteWithFile:@"UpBar.png"];
        top.position = ccp( 512, 730.5);
        [self addChild:top z:5];
        
        CCSprite *spback = [CCSprite spriteWithFile:@"SlotBack.png"];
        CCSprite *spback_t1 = [CCSprite spriteWithFile:@"TouchSlotBack.png"];
		CCMenuItemSprite *itemback = [CCMenuItemSprite itemWithNormalSprite:spback selectedSprite:spback_t1 block:^(id sender) {
            
            [[CCDirector sharedDirector] popScene];
            
		}];
        [itemback setPosition:ccp(75, 730)];
        
        CCMenu* menu = [CCMenu menuWithItems: itemback, nil];
        [self addChild: menu z:7];
		[menu setPosition:ccp(0, 0)];
        
/*        NSMutableArray *layers = [NSMutableArray new];
        CCLayer *layer = [[CCLayer alloc] init];
        CCSprite *fon = [CCSprite spriteWithFile:@"FonMapLevel01.png"];
        [layer addChild: fon];
        [layers addObject:layer];
        CCScrollLayer *scroller = [[CCScrollLayer alloc] initWithLayers:layers
                                                            widthOffset:0];
        [self addChild:scroller z:6];
        
        [scroller release];
        [layers release];
 */
        
        
        _panZoomLayer = [[CCLayerPanZoom node] retain];
        [self addChild: _panZoomLayer];
		_panZoomLayer.delegate = self;
        
        // background
        CCSprite *background = [CCSprite spriteWithFile: @"FonMapLevel01.png"];
        background.anchorPoint = ccp(0,0);
		background.scale = CC_CONTENT_SCALE_FACTOR();
        [_panZoomLayer addChild: background
                             z :0
                            tag: 111];
//		// create and initialize a Label
//		CCLabelTTF *label = [CCLabelTTF labelWithString: @"Try panning and zooming using drag and pinch"
//                                               fontName: @"Marker Felt"
//                                               fontSize: 24];
////		label.scale = 0.7f; //< to be visible on iPod Touch screen.
//		label.color = ccWHITE;
//		// add the label as a child to this Layer
//		
//        [_panZoomLayer addChild: label
//                              z: 1
//                            tag: 112];
        
        _panZoomLayer.mode = kCCLayerPanZoomModeSheet;
//        _panZoomLayer.minScale = 1.0f;
        _panZoomLayer.rubberEffectRatio = 0.0f;
//        _panZoomLayer.rubberEffectRecoveryTime = 1.1f;
        
		[self updateForScreenReshape];
	}
	
	return self;
}

- (void) updateForScreenReshape
{
	CGSize winSize = [[CCDirector sharedDirector] winSize];
	CCNode *background = [_panZoomLayer getChildByTag: 111];
	// our bounding rect
	CGRect boundingRect = CGRectMake(0, 0, 0, 0);
	boundingRect.size = [background boundingBox].size;
	[_panZoomLayer setContentSize: boundingRect.size];
    
	_panZoomLayer.anchorPoint = ccp(0.5f, 0.5f);
//	_panZoomLayer.position = ccp(0.5f * winSize.width, 0.5f * winSize.height);
	_panZoomLayer.position = ccp(boundingRect.size.width, 0);
    
    _panZoomLayer.panBoundsRect = CGRectMake(0, 0, winSize.width, winSize.height);
//    _panZoomLayer.panBoundsRect = CGRectMake(0, 0, 500, winSize.height);
    
	// position the label on the center of the bounds
//	CCNode *label = [_panZoomLayer getChildByTag: 112];
//	label.position =  ccp(boundingRect.size.width * 0.5f, boundingRect.size.height * 0.5f);
}

- (void) layerPanZoom: (CCLayerPanZoom *) sender
	   clickedAtPoint: (CGPoint) point
             tapCount: (NSUInteger) tapCount
{
	NSLog(@"CCLayerPanZoomTestLayer#layerPanZoom: %@ clickedAtPoint: { %f, %f }", sender, point.x, point.y);
	NSLog(@"CCLayerPanZoomTestLayer#layerPanZoom: %f", _panZoomLayer.position.x);
}

- (void) layerPanZoom: (CCLayerPanZoom *) sender
 touchPositionUpdated: (CGPoint) newPos
{
    NSLog(@"CCLayerPanZoomTestLayer#layerPanZoom: %@ touchPositionUpdated: { %f, %f }", sender, newPos.x, newPos.y);
}

- (void) layerPanZoom: (CCLayerPanZoom *) sender touchMoveBeganAtPosition: (CGPoint) aPoint
{
    NSLog(@"CCLayerPanZoomTestLayer#layerPanZoom: %@ touchMoveBeganAtPosition: { %f, %f }", sender, aPoint.x, aPoint.y);
}

@end
