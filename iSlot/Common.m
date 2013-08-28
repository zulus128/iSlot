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
        
//        self.inlay = [InappLayer node];
//        self.inlay.position = ccp(1024, 0);

//        srand(time(NULL));
        
        self.lucks = [NSMutableArray array];
//        [self.lucks addObject:[NSNumber numberWithInt:35]];
//        [self.lucks addObject:[NSNumber numberWithInt:5]];
//        [self.lucks addObject:[NSNumber numberWithInt:50]];

        self.lucks = [NSMutableArray arrayWithArray:[[NSUserDefaults standardUserDefaults] objectForKey:@"lucksarray"]];

        NSArray* sp = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString* docpath = [sp objectAtIndex: 0];
        prof_file = [[docpath stringByAppendingPathComponent:@"levels.plist"] retain];
        BOOL fe = [[NSFileManager defaultManager] fileExistsAtPath:prof_file];
        if(!fe) {
            
            NSLog(@"NO levels.plist FILE !!! Creating...");
            NSString *appFile = [[NSBundle mainBundle] pathForResource:@"levels" ofType:@"plist"];
            NSError *error;
            NSFileManager *fileManager = [NSFileManager defaultManager];
            [fileManager copyItemAtPath:appFile toPath:prof_file error:&error];
            
        }
        levels = [[NSMutableDictionary alloc] initWithContentsOfFile:prof_file];

        
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

        
//        self.yourluck = 10;
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        NSNumber* n = [userDefaults valueForKey:@"yourluck"];
        if(n.intValue > 0)
            self.yourluck = n.intValue;
        else {
        
            self.yourluck = 10;

            NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
            [userDefaults setObject:[NSNumber numberWithInt:10] forKey:@"yourluck"];
            [userDefaults synchronize];
        }
        
        self.money = 1000000;
        self.speed = SPEED1;
        self.coins = 1;
        self.lines = 3;
        self.famelevel1 = 1;

        [self validateRnd];
        

//        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        n = [userDefaults valueForKey:@"linesBought"];
        self.linesBought = (n.intValue > 0)?n.intValue:3;
       
        NSNumber* n1 = [userDefaults valueForKey:@"lastLevelPassed"];
        self.lastLevelPassed = n1.intValue;

//        [self timer];
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

- (int) getStarsForLevel:(int) t {

//    BOOL bonus = ((t - (t/10) * 10) == 9);
//    if(bonus)
//        return 0;
    
    NSDictionary* d = [levels objectForKey:[NSString stringWithFormat:@"level%d", t]];
    NSNumber* n = [d objectForKey:@"stars"];
    return [n intValue];
}

- (void) increaseStarsForCurrentLevel {

//    int t = self.curlevel;
//    BOOL bonus = ((t - (t/10) * 10) == 9);
//    if(bonus)
//        return;

    NSDictionary* d = [levels objectForKey:[NSString stringWithFormat:@"level%d", self.curlevel]];
    NSNumber* n = [d objectForKey:@"stars"];
    int r = [n intValue];
    if(r < 3)
        r++;
    [d setValue:[NSNumber numberWithInt:r] forKey:@"stars"];
    [levels writeToFile:prof_file atomically:YES];

}

- (void) increaseLevel {

    int t = self.curlevel;
    BOOL bonus = ((t - (t/10) * 10) == 9);
    if(bonus)
        return;

//    self.lastLevelPassed = 43;

    if(self.lastLevelPassed < self.curlevel)
        self.lastLevelPassed = self.curlevel;
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:[NSNumber numberWithInt:self.lastLevelPassed] forKey:@"lastLevelPassed"];
    [userDefaults synchronize];

}

//- (void) timer {
//    
//    NSLog(@"timer %d", tim++);
//    [self performSelector:@selector(timer) withObject:nil afterDelay:1.0f];
//}


- (BOOL) reduceTimeLuck {
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSNumber* n = [userDefaults valueForKey:@"luck5"];
    BOOL b = NO;
    if(n.intValue > 0) {
        [userDefaults setObject:[NSNumber numberWithInt:(n.intValue - 1)] forKey:@"luck5"];
//        NSLog(@"remain %d sec", n.intValue);
        b = YES;
    }
    n = [userDefaults valueForKey:@"luck10"];
    if(n.intValue > 0) {
        [userDefaults setObject:[NSNumber numberWithInt:(n.intValue - 1)] forKey:@"luck10"];
        b = YES;
    }
    n = [userDefaults valueForKey:@"luck20"];
    if(n.intValue > 0) {
        [userDefaults setObject:[NSNumber numberWithInt:(n.intValue - 1)] forKey:@"luck20"];
        b = YES;
    }
    n = [userDefaults valueForKey:@"luck25"];
    if(n.intValue > 0) {
        [userDefaults setObject:[NSNumber numberWithInt:(n.intValue - 1)] forKey:@"luck25"];
        b = YES;
    }
    n = [userDefaults valueForKey:@"luck35"];
    if(n.intValue > 0) {
        [userDefaults setObject:[NSNumber numberWithInt:(n.intValue - 1)] forKey:@"luck35"];
        b = YES;
    }
    n = [userDefaults valueForKey:@"luck50"];
    if(n.intValue > 0) {
        [userDefaults setObject:[NSNumber numberWithInt:(n.intValue - 1)] forKey:@"luck50"];
        b = YES;
    }
    BOOL bbb = NO;
    if(b) {
    
        [userDefaults synchronize];
        bbb = [self invalidateTimeLuck];
    }

    return bbb;
}

- (void) storeTime {
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    NSDate *date = [NSDate date];
    [userDefaults setObject:date forKey:@"curdate"];

    [userDefaults synchronize];

}

- (void) restoreTime {
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];

    NSDate* d = (NSDate*)[userDefaults objectForKey:@"curdate"];
    if(d == nil)
        return;
    
    NSTimeInterval time = [d timeIntervalSinceNow];
    NSLog(@"inactivity = %f sec.", time);

    NSNumber* n = [userDefaults valueForKey:@"luck5"];
    if(n.intValue > 0)
//        [userDefaults setObject:[NSNumber numberWithInt:(/*n.intValue + time*/20)] forKey:@"luck5"];
        [userDefaults setObject:[NSNumber numberWithInt:(n.intValue + time)] forKey:@"luck5"];
    n = [userDefaults valueForKey:@"luck10"];
    if(n.intValue > 0)
        [userDefaults setObject:[NSNumber numberWithInt:(n.intValue + time)] forKey:@"luck10"];
    n = [userDefaults valueForKey:@"luck20"];
    if(n.intValue > 0)
        [userDefaults setObject:[NSNumber numberWithInt:(n.intValue + time)] forKey:@"luck20"];
    n = [userDefaults valueForKey:@"luck25"];
    if(n.intValue > 0)
        [userDefaults setObject:[NSNumber numberWithInt:(n.intValue + time)] forKey:@"luck25"];
    n = [userDefaults valueForKey:@"luck35"];
    if(n.intValue > 0)
        [userDefaults setObject:[NSNumber numberWithInt:(n.intValue + time)] forKey:@"luck35"];
    n = [userDefaults valueForKey:@"luck50"];
    if(n.intValue > 0)
        [userDefaults setObject:[NSNumber numberWithInt:(n.intValue + time)] forKey:@"luck50"];
    
    [userDefaults synchronize];

//    [self invalidateTimeLuck];
}

- (BOOL) invalidateTimeLuck {
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSNumber* nu;
    NSMutableArray* fordel = [NSMutableArray array];
    for(NSNumber* n in self.lucks) {

        int lu = 0;
        switch (n.intValue) {
            case 5:
                nu = [userDefaults valueForKey:@"luck5"];
                if(nu.intValue <= 0) {
                    [fordel addObject:n];
                    lu = 5;
                }
                break;
            case 10:
                nu = [userDefaults valueForKey:@"luck10"];
                if(nu.intValue <= 0) {
                    [fordel addObject:n];
                    lu = 10;
                }
                break;
            case 20:
                nu = [userDefaults valueForKey:@"luck20"];
                if(nu.intValue <= 0) {
                    [fordel addObject:n];
                    lu = 20;
                }
                break;
            case 25:
                nu = [userDefaults valueForKey:@"luck25"];
                if(nu.intValue <= 0) {
                    [fordel addObject:n];
                    lu = 25;
                }
                break;
            case 35:
                nu = [userDefaults valueForKey:@"luck35"];
                if(nu.intValue <= 0) {
                    [fordel addObject:n];
                    lu = 35;
                }
                break;
            case 50:
                nu = [userDefaults valueForKey:@"luck50"];
                if(nu.intValue <= 0) {
                    [fordel addObject:n];
                    lu = 50;
                }
                break;
        }
    
    self.yourluck -= lu;
    }

    BOOL b = NO;
    if(fordel.count > 0) {
//        NSLog(@"before: %@", self.lucks);
//        NSLog(@"remove lucks: %@", fordel);
        [self.lucks removeObjectsInArray:fordel];
//        NSLog(@"after: %@", self.lucks);
        b = YES;
    }
    
    [userDefaults setObject:[NSNumber numberWithInt:self.yourluck] forKey:@"yourluck"];
    [userDefaults setObject:self.lucks forKey:@"lucksarray"];
    
    [userDefaults synchronize];

    return b;
}

- (void) dealloc {

    [prof_file release];
    
	[super dealloc];
}
@end
