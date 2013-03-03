//
//  Common.m
//  iUnRewards
//
//  Created by вадим on 11/26/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "Common.h"
#import "cocos2d.h"

@implementation Common

+ (Common*) instance  {
	
	static Common* instance;
	
	@synchronized(self) {
		
		if(!instance) {
			
			instance = [[Common alloc] init];
		}
	}
	return instance;
}

- (id) init {	
	
	self = [super init];
	if(self !=nil) {
        
        rnd50[0] = RND0;
        rnd50[1] = RND1;
        rnd50[2] = RND2;
        rnd50[3] = RND3;
        rnd50[4] = RND4;
        rnd50[5] = RND5;
        rnd50[6] = RND6;
        rnd50[7] = RND7;
        rnd50[8] = RND8;
        rnd50[9] = RND9;
        rnd50[10] = RND10;

        rnd110[0] = RND110_0;
        rnd110[1] = RND110_1;
        rnd110[2] = RND110_2;
        rnd110[3] = RND110_3;
        rnd110[4] = RND110_4;
        rnd110[5] = RND110_5;
        rnd110[6] = RND110_6;
        rnd110[7] = RND110_7;
        rnd110[8] = RND110_8;
        rnd110[9] = RND110_9;
        rnd110[10] = RND110_10;

        fames[0] = FAME_POINTS1;
        fames[1] = FAME_POINTS2;
        fames[2] = FAME_POINTS3;
        fames[3] = FAME_POINTS4;
        fames[4] = FAME_POINTS5;
        fames[5] = FAME_POINTS6;
        fames[6] = FAME_POINTS7;
        fames[7] = FAME_POINTS8;
        fames[8] = FAME_POINTS9;
        fames[9] = FAME_POINTS10;

        
        self.yourluck = 50;

        self.money = 1000;
        self.speed = SPEED1;
        self.coins = 1;
        self.lines = 5;
        self.famelevel1 = 1;

        [self validateRnd];
        

	}
	return self;	
}

- (int) getFames:(int) t {
    
    return fames[t];
}

- (void) validateRnd {

//    NSLog(@"self.yourluck %d", self.yourluck);

    int k = self.yourluck - 50;
    for(int i = 0; i < SLIDE_TYPES; i++)
        rnd[i] = rnd50[i] + k * (rnd110[i] - rnd50[i])/(110 - 50);

//    for(int i = 0; i < SLIDE_TYPES; i++)
//        NSLog(@"Random [%d] = %f", i, rnd[i]);

    for(int i = 1; i < SLIDE_TYPES; i++)
        rnd[i] = rnd[i] + rnd[i - 1];

//    for(int i = 0; i < SLIDE_TYPES; i++)
//        NSLog(@"Random interval [%d] = %f", i, rnd[i]);

}

- (int) getRnd {

    int j = CCRANDOM_0_1() * 100;//%

    for(int i = 0; i < SLIDE_TYPES; i++)
        if(j < rnd[i])
            return i;

    NSLog(@"No random interval found!!!!");
    return 0;
}

@end
