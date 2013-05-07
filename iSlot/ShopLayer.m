//
//  InfoLayer.m
//  iSlot
//
//  Created by вадим on 2/24/13.
//  Copyright (c) 2013 Zul. All rights reserved.
//

#import "ShopLayer.h"
#import "Common.h"

//static ShopLayer *layer;

@implementation ShopLayer

-(id) init {
    
	if( (self=[super init])) {
        
		// ask director for the window size
		//CGSize size = [[CCDirector sharedDirector] winSize];
        self.touchEnabled = YES;
        
		background = [[CCSprite spriteWithFile:@"FonShopLine.png"] retain];
		background.position = ccp(Xsh, Ysh);
        background.opacity = 0;
		[self addChild: background];
        
        
	}
	
	return self;
}

-(void)show {
    
    menukeys.enabled = YES;
    
    background.opacity = 0;
    [background runAction:[CCFadeIn actionWithDuration:DSdelay]];
}

-(void)hide {
    
    menukeys.enabled = NO;
    
    [background runAction:[CCFadeOut actionWithDuration:DSdelay]];
}

- (void)ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:[touch view]];
    //    NSLog(@"y = %f", point.y);

    y0 = point.y;
    yl0 = self.position.y;

    
    if((point.y < (Ysh - 255 - 108)) || (point.y > (Ysh + 255 - 108))) {

        [self.player afterShop];
        [self hide];
    }
}

-(void) ccTouchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    
    UITouch *touch =[touches anyObject];
    CGPoint point = [touch locationInView:[touch view]];
    point = [[CCDirector sharedDirector]convertToGL:point];
    
    //    NSLog(@"moved x = %f, y = %f", point.x, point.y);
    
    float delta = point.y - y0;
    float yy = yl0 + delta;
    if(yy > 0)
        yy = 0;
    if(yy < -3072)
        yy = -3072;
    //    NSLog(@"xx = %f", xx);
    self.position = ccp(0, yy);
}

-(void) ccTouchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    
    //    NSLog(@"ccTouchesEnded");
    UITouch *touch =[touches anyObject];
    CGPoint point = [touch locationInView:[touch view]];
    point = [[CCDirector sharedDirector]convertToGL:point];
    
    float delta = (point.y - y0) * 2;
    float yy = yl0 + delta;
    if(yy > 0)
        yy = 0;
    if(yy < -3072)
        yy = -3072;
    //    NSLog(@"xx = %f", xx);
    //    self.position = ccp(xx, 0);
    
    [self stopAllActions];
    CCMoveTo *moveTo = [CCMoveTo actionWithDuration:0.6f position:ccp(0, yy)];
   // [self runAction:[CCEaseOut actionWithAction:moveTo rate:1.7f]];
    
}


- (void) dealloc {
    
    [background release];
    
	[super dealloc];
}


@end
