//
//  IntroLayer.h
//  iSlot
//
//  Created by Zul on 2/6/13.
//  Copyright Zul 2013. All rights reserved.
//


// When you import this file, you import all the cocos2d classes
#import "cocos2d.h"
#import "CCLayerPanZoom.h"

// HelloWorldLayer
@interface MapLayer : CCLayer <CCLayerPanZoomClickDelegate> {
    
    CCLayerPanZoom* _panZoomLayer;
}

// returns a CCScene that contains the HelloWorldLayer as the only child
+(CCScene *) scene;

@end
