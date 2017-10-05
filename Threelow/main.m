//
//  main.m
//  Threelow
//
//  Created by Andrew on 2017-10-04.
//  Copyright © 2017 Andrew. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MenuManager.h"
#import "GameController.h"
#define NSLog(FORMAT, ...) printf("%s\n", [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);





int main(int argc, const char * argv[]) {
    @autoreleasepool {
                
        bool doContinue = true;
        
        GameController *gameController = [GameController new];
        
        MenuManager *menuManager =
        [[MenuManager alloc]
         initWithMenuItems:@[@"Quit",
                             @"Roll",
                             @"Hold",
                             @"Reset"]];
        
        while (doContinue) {
            
            [gameController showDice];

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
                    [gameController rollDice];
                    break;
                }
                    
                // hold
                case 2:{
                    [gameController chooseDie];
                    break;
                }
                    
                // reset
                case 3:{
                    [gameController resetDice];
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
