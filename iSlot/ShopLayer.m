//
//  InfoLayer.m
//  iSlot
//
//  Created by вадим on 2/24/13.
//  Copyright (c) 2013 Zul. All rights reserved.
//

#import "ShopLayer.h"
#import "Common.h"

@implementation ShopLayer

-(id) init {
    
	if( (self=[super init])) {
        
		// ask director for the window size
		//CGSize size = [[CCDirector sharedDirector] winSize];
        self.touchEnabled = YES;

//        self.contentSize = CGSizeMake(62, 62);

		background = [CCSprite spriteWithFile:@"FonShopLine.png"];
		background.position = ccp(Xsh, Ysh);
        background.opacity = 0;
		[self addChild: background];
        
        ssl = [ShopSubLayer layerWithColor:ccc4(100, 20, 200, 0) width:775 height:1340];
//        ssl = [CAScrollLayer layer];
        ssl.position = ccp(125, -765);//ccpshop(Xsh, Ysh, 400, 300);
        [ssl addContent];
//        ssl.opacity = 0;
        [self addChild:ssl];
        
//        [ssl addChild:background];

	}
	
	return self;
}

//- (void) visit {
//
//    if (!self.visible) {
//        return;
//    }
//    glEnable(GL_SCISSOR_TEST);
//    glScissor(0, 0, 600, 600);
//    [super visit];
//    glDisable(GL_SCISSOR_TEST);
//}

-(void)show {
    
    menukeys.enabled = YES;
    
    background.opacity = 0;
    [background runAction:[CCFadeIn actionWithDuration:DSdelay]];

//    ssl.opacity = 0;
//    [ssl runAction:[CCFadeIn actionWithDuration:DSdelay]];
    
    [ssl show];
    
    ssl.player = self.player;
}

-(void)hide {
    
    menukeys.enabled = NO;
    
    [background runAction:[CCFadeOut actionWithDuration:DSdelay]];

//    [ssl runAction:[CCFadeOut actionWithDuration:DSdelay]];
    
    [ssl hide];
}

- (void)ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:[touch view]];
    //    NSLog(@"y = %f", point.y);

    if((point.y < (Ysh - 255 - 108)) || (point.y > (Ysh + 255 - 108))) {

        [self.player afterShop];
        [self hide];
    }
}



- (void) dealloc {
    
//    [background release];
    
	[super dealloc];
}


@end
