//
//  Common.h
//  iUnRewards
//
//  Created by вадим on 11/26/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#define SPEED1 0.062f
#define SLIDE_TYPES 11
#define SLIDE_CNT 4
#define BARS_CNT 5
#define SLIDE_HEIGHT 144

#define DELAY1 2.0f
#define DELAY2 2.5f
#define DELAY3 3.0f
#define DELAY4 3.5f
#define DELAY5 4.0f

#define LINES_CNT 5

#define RND0 2 //%
#define RND1 4 //%
#define RND2 12 //%
#define RND3 12 //%
#define RND4 10 //%
#define RND5 10 //%
#define RND6 9 //%
#define RND7 8 //%
#define RND8 7 //%
#define RND9 13 //%
#define RND10 13 //%

#define RND110_0 4 //%
#define RND110_1 6 //%
#define RND110_2 11 //%
#define RND110_3 11 //%
#define RND110_4 9 //%
#define RND110_5 9 //%
#define RND110_6 9 //%
#define RND110_7 9 //%
#define RND110_8 8 //%
#define RND110_9 12 //%
#define RND110_10 12 //%

#define CCCA(x) [[x copy] autorelease]

@interface Common : NSObject {

    float rnd[SLIDE_TYPES];
    float rnd50[SLIDE_TYPES];
    float rnd110[SLIDE_TYPES];
}

+ (Common*) instance;

- (void) validateRnd;
- (int) getRnd;

@property (readwrite, assign) int coins;
@property (readwrite, assign) int money;
@property (readwrite, assign) int lines;
@property (readwrite, assign) int lastwin;
@property (readwrite, assign) int levelwin;
@property (readwrite, assign) int levelfame;
@property (readwrite, assign) int yourluck;

@property (readwrite, assign) int finished;
@property (readwrite, assign) float speed;

@end
