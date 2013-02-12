//
//  GameLayer.h
//  iSlot
//
//  Created by Zul on 2/7/13.
//  Copyright (c) 2013 Zul. All rights reserved.
//

#import <GameKit/GameKit.h>

// When you import this file, you import all the cocos2d classes
#import "cocos2d.h"



// HelloWorldLayer
@interface GameLayer : CCLayer {
    
    CCLabelTTF *label;
}

// returns a CCScene that contains the HelloWorldLayer as the only child
+(CCScene *) scene;

@end