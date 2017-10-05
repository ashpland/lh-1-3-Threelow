//
//  GameController.h
//  Threelow
//
//  Created by Andrew on 2017-10-04.
//  Copyright © 2017 Andrew. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Dice.h"

@interface GameController : NSObject

@property (nonatomic)NSArray *diceStore;
@property (nonatomic)NSMutableArray *heldDice;

-(void)showDice;
-(void)chooseDie;
-(void)rollDice;
-(void)holdDie:(int)dieNumber;
-(void)resetDice;
-(int)calculateScore;

@end
