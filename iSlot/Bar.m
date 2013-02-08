//
//  Bar.m
//  iSlot
//
//  Created by Zul on 2/8/13.
//  Copyright (c) 2013 Zul. All rights reserved.
//

#import "Bar.h"

@implementation Bar

- (id)initWithLayer:(CCLayer *)lay
{
    self = [super init];
    if (self) {
        // Custom initialization
        layer = lay;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
