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
                             @"Test"]];
        
        Dice *testDie1 = [Dice new];
        Dice *testDie2 = [Dice new];
        Dice *testDie3 = [Dice new];
        Dice *testDie4 = [Dice new];
        Dice *testDie5 = [Dice new];
        
        while (doContinue) {
            
            int choice = [menuManager getMenuChoice];
            
            switch (choice) {
                    // quit
                case 0:{
                    NSLog(@"\nThanks for playing!");
                    doContinue = false;
                    break;
                }
                    
                case 1:{
                    
                    
                    NSLog(@"%@ %@ %@ %@ %@\n", testDie1, testDie2, testDie3, testDie4, testDie5);
                    
                    
                    
                    
                    
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
