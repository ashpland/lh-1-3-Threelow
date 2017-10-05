//
//  main.m
//  Threelow
//
//  Created by Andrew on 2017-10-04.
//  Copyright © 2017 Andrew. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MenuManager.h"
#define NSLog(FORMAT, ...) printf("%s\n", [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);


int main(int argc, const char * argv[]) {
    @autoreleasepool {
                
        bool doContinue = true;
        
        MenuManager *menuManager =
        [[MenuManager alloc]
         initWithMenuItems:@[@"Quit",
                             @"New",
                             @"List"]];
        
        while (doContinue) {
            
            int choice = [menuManager getMenuChoice];
            
            switch (choice) {
                    // quit
                case 0:
                    NSLog(@"Adieu!");
                    doContinue = false;
                    break;
                    
                default:
                    NSLog(@"That's not an option");
                    break;
            }
        }
        
        
        
    }
    return 0;
}
