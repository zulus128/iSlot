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

#define LINES_CNT 21

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

#define FAME_LEVELS 10
#define FAME_POINTS1 50
#define FAME_POINTS2 150
#define FAME_POINTS3 450
#define FAME_POINTS4 600
#define FAME_POINTS5 1000
#define FAME_POINTS6 1700
#define FAME_POINTS7 2300
#define FAME_POINTS8 3200
#define FAME_POINTS9 4500
#define FAME_POINTS10 6000

#define LEVEL_MONEY1 100

#define CCCA(x) [[x copy] autorelease]

@interface Common : NSObject {

    float rnd[SLIDE_TYPES];
    float rnd50[SLIDE_TYPES];
    float rnd110[SLIDE_TYPES];

    int fames[FAME_LEVELS];

}

+ (Common*) instance;

- (void) validateRnd;
- (int) getRnd;
- (int) getFames:(int) t;


@property (readwrite, assign) int coins;
@property (readwrite, assign) int money;
@property (readwrite, assign) int lines;
@property (readwrite, assign) int lastwin;
@property (readwrite, assign) int levelwin;
@property (readwrite, assign) int famepoints;
@property (readwrite, assign) int yourluck;
@property (readwrite, assign) int famelevel1;

@property (readwrite, assign) int finished;
@property (readwrite, assign) float speed;

@end
