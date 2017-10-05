//
//  GameController.m
//  Threelow
//
//  Created by Andrew on 2017-10-04.
//  Copyright © 2017 Andrew. All rights reserved.
//

#import "GameController.h"

@implementation GameController

- (instancetype)init
{
    self = [super init];
    if (self) {
        Dice *die1 = [Dice new];
        Dice *die2 = [Dice new];
        Dice *die3 = [Dice new];
        Dice *die4 = [Dice new];
        Dice *die5 = [Dice new];
        
        _diceStore = [[NSArray alloc] initWithObjects:die1, die2, die3, die4, die5, nil];
        _heldDice = [[NSMutableArray alloc] initWithArray:@[@false, @false, @false, @false, @false]];
    }
    return self;
}

- (NSString *)description
{
    NSMutableString *outputString = [NSMutableString new];
    for (Dice *die in self.diceStore){
        NSString *outputDie = [NSString stringWithFormat:@"%@ ", die];
        [outputString appendString:outputDie];
    }
    return outputString;
}

@end
