//
//  GameController.m
//  Threelow
//
//  Created by Andrew on 2017-10-04.
//  Copyright © 2017 Andrew. All rights reserved.
//

#import "GameController.h"
#import "InputCollector.h"
#define NSLog(FORMAT, ...) printf("%s\n", [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);


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
        _heldDice = [[NSMutableArray alloc] initWithArray:@[@false,@false,@false,@false,@false]];
    }
    return self;
}

- (NSString *)description
{
    NSMutableString *outputString = [NSMutableString new];
    for (int i = 0; i <= 4; i++) {
        NSString *outputDie;
        if ([self.heldDice[i] isEqual:@true]) {
            outputDie = [NSString stringWithFormat:@"[%@] ", self.diceStore[i]];
        } else {
            outputDie = [NSString stringWithFormat:@" %@  ", self.diceStore[i]];
        }
        [outputString appendString:outputDie];
    }
    
    return outputString;
}

-(void)showDice{
    NSLog(@"\n%@\n", self);
}

-(void)chooseDie{
    NSLog(@"\n%@\n 1   2   3   4   5\n", self);
    NSString *dieChoiceResponse = [InputCollector inputForPrompt:@"Choose a die"];
    int dieNumber = (int)[dieChoiceResponse integerValue]-1;
    if (0 <= dieNumber && dieNumber <= 4) {
        [self holdDie:dieNumber];
    } else {
        NSLog(@"Not a valid choice");
        [self chooseDie];
    }
}



-(void)rollDice
{
    for (int i = 0; i <= 4; i++) {
        if ([self.heldDice[i] isEqual:@false]) {
            [self.diceStore[i] rollDie];
        }
    }
}

-(void)holdDie:(int)dieNumber{
    if ([self.heldDice[dieNumber] isEqual:@false]) {
        self.heldDice[dieNumber] = @true;
    } else {
        self.heldDice[dieNumber] = @false;
    }
}



@end
