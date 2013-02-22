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
        
        rnd[0] = RND0;
        rnd[1] = RND1;
        rnd[2] = RND2;
        rnd[3] = RND3;
        rnd[4] = RND4;
        rnd[5] = RND5;
        rnd[6] = RND6;
        rnd[7] = RND7;
        rnd[8] = RND8;
        rnd[9] = RND9;
        rnd[10] = RND10;
        
        for(int i = 1; i < SLIDE_TYPES; i++)
            rnd[i] = rnd[i] + rnd[i - 1];
        
//        for(int i = 0; i < SLIDE_TYPES; i++)
//            NSLog(@"Random interval [%d] = %d", i, rnd[i]);

	}
	return self;	
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
