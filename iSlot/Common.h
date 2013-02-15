//
//  Common.h
//  iUnRewards
//
//  Created by вадим on 11/26/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#define SPEED1 0.06f
#define SLIDE_TYPES 11
#define CNT 4
#define SLIDE_HEIGHT 144

#define DELAY1 2.0f
#define DELAY2 2.5f
#define DELAY3 3.0f
#define DELAY4 3.5f
#define DELAY5 4.0f


#define CCCA(x) [[x copy] autorelease]

@interface Common : NSObject {

    
}

+ (Common*) instance;

@property (readwrite, assign) int coins;
@property (readwrite, assign) int lines;

@property (readwrite, assign) int finished;
@property (readwrite, assign) float speed;

@end
