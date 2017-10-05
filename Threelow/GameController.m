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
        _rolls = 1;
    }
    return self;
}

//NSString *scoreOutput = [[NSString alloc] initWithFormat:@"   Total: %d", [self calculateScore]];

-(void)showHead{
    NSLog(@"___________________");
    NSLog(@" Roll: %d Total: %d", self.rolls, [self calculateScore]);
}


-(void)showDice
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
    
    NSLog(@"\n%@", outputString);
}

-(void)chooseDie
{
    [self showDice];
    NSLog(@" 1   2   3   4   5\n");
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
    self.rolls = self.rolls + 1;
}

-(void)holdDie:(int)dieNumber
{
    if ([self.heldDice[dieNumber] isEqual:@false]) {
        self.heldDice[dieNumber] = @true;
    } else {
        self.heldDice[dieNumber] = @false;
    }
}

-(void)resetDice
{
    self.heldDice = [[NSMutableArray alloc] initWithArray:@[@false,@false,@false,@false,@false]];
    self.rolls = 0;
    [self rollDice];
}

-(int)calculateScore
{
    int score = 0;
    for(Dice *die in self.diceStore){
        score = score + die.currentValue;
    }
    return score;
}



@end
