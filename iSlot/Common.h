//
//  Common.h
//  iUnRewards
//
//  Created by вадим on 11/26/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#define SPEED 0.06f
#define SLIDE_TYPES 11
#define CNT 4
#define SLIDE_HEIGHT 144

#define DELAY1 5.5f
#define DELAY2 3.0f
#define DELAY3 5.0f
#define DELAY4 4.0f
#define DELAY5 4.5f


#define CCCA(x) [[x copy] autorelease]

@interface Common : NSObject {

    
}

+ (Common*) instance;

@property (readwrite, assign) int finished;

@end
