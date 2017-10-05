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
    self.currentValue = arc4random_uniform(6)+1;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self rollDie];
    }
    return self;
}

- (NSString *)description
{
    switch (self.currentValue) {
        case 1:
            return @"⚀";
            break;
        case 2:
            return @"⚁";
            break;
        case 3:
            return @"⚂";
            break;
        case 4:
            return @"⚃";
            break;
        case 5:
            return @"⚄";
            break;
        case 6:
            return @"⚅";
            break;
        default:
            return @"";
            break;
    }
}

@end
