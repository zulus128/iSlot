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

		// ask director for the window size
		CGSize size = [[CCDirector sharedDirector] winSize];

//		CCSprite *background;
//		
//		if( UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone ) {
//			background = [CCSprite spriteWithFile:@"Default.png"];
//			background.rotation = 90;
//		} else {
//			background = [CCSprite spriteWithFile:@"Default-Landscape~ipad.png"];
//		}
//		background.position = ccp(size.width/2, size.height/2);
//
//		// add the label as a child to this Layer
//		[self addChild: background];
        
/*		CCMenuItemSprite *horizontalTestItem =
		[CCMenuItemSprite itemFromNormalSprite: [CCSprite spriteWithFile: @"PresentButton.png"]
								selectedSprite: [CCSprite spriteWithFile: @"PresentButton.png"]
										target: self
									  selector: @selector(itemPressed:)];
		
		CCMenuItemSprite *priorityTestItem =
		[CCMenuItemSprite itemFromNormalSprite: [CCSprite spriteWithFile: @"FutureButton.png"]
								selectedSprite: [CCSprite spriteWithFile: @"FutureButton.png"]
										target: self
									  selector: @selector(itemPressed:)];
		
		// Distinguish Normal/Selected State of Menu Items.
		[horizontalTestItem.selectedImage setColor:ccGRAY];
		[priorityTestItem.selectedImage setColor:ccGRAY];

        
        
        
        CCMenuAdvanced *menu = [CCMenuAdvanced menuWithItems:horizontalTestItem, priorityTestItem, nil];
//		[menu alignItemsHorizontallyWithPadding: 0.33 * horizontalTestItem.contentSize.width ];
        [menu alignItemsHorizontally]; //< also sets contentSize and keyBindings on Mac

		[self addChild: menu z:30];
 */
	}
	
	return self;
}

//-(void) onEnter
//{
//	[super onEnter];
//	[[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[GameLayer scene] ]];
//}
@end
