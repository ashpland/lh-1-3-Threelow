//
//  Dice.m
//  Threelow
//
//  Created by Andrew on 2017-10-04.
//  Copyright © 2017 Andrew. All rights reserved.
//

#import "Dice.h"

@implementation Dice

-(void)rollDie
{
    self.currentValue = arc4random_uniform(6);
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self rollDie];
    }
    return self;
}

@end
