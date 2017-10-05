//
//  main.m
//  Threelow
//
//  Created by Andrew on 2017-10-04.
//  Copyright © 2017 Andrew. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MenuManager.h"
#import "Dice.h"
#define NSLog(FORMAT, ...) printf("%s\n", [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);





int main(int argc, const char * argv[]) {
    @autoreleasepool {
                
        bool doContinue = true;
        
        MenuManager *menuManager =
        [[MenuManager alloc]
         initWithMenuItems:@[@"Quit",
                             @"Roll"]];
        
        Dice *die1 = [Dice new];
        Dice *die2 = [Dice new];
        Dice *die3 = [Dice new];
        Dice *die4 = [Dice new];
        Dice *die5 = [Dice new];
        
        NSArray *diceStore = [[NSArray alloc] initWithObjects:die1, die2, die3, die4, die5, nil];
        
        while (doContinue) {
            NSLog(@"%@ %@ %@ %@ %@\n", die1, die2, die3, die4, die5);

            int choice = [menuManager getMenuChoice];
            
            switch (choice) {
                
                // quit
                case 0:{
                    NSLog(@"\nThanks for playing!");
                    doContinue = false;
                    break;
                }
                
                // roll
                case 1:{
                    
                    for (Dice *die in diceStore){
                        [die rollDie];
                    }
                   
                    break;
                }
                    
                default:
                    NSLog(@"That's not an option");
                    break;
            }
        }
        
        
        
    }
    return 0;
}
