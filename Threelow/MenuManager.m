//
//  MenuManager.m
//  Threelow
//
//  Created by Andrew on 2017-10-04.
//  Copyright © 2017 Andrew. All rights reserved.
//

#import "MenuManager.h"
#define NSLog(FORMAT, ...) printf("%s\n", [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);

@implementation MenuManager

- (instancetype)init
{
    return [self initWithMenuItems:@[]];
}

- (instancetype)initWithMenuItems:(NSArray *)menuItems
{
    self = [super init];
    if (self) {
        _menuItems = menuItems;
    }
    return self;
}

- (int)getMenuChoice
{
    NSLog(@"%@", self);
    NSString *menuResponse = [InputCollector inputForPrompt:@"Choice"];
    NSArray *explodedResponse = [menuResponse componentsSeparatedByString:@" "];
    NSString *menuChoice = explodedResponse[0];
    NSUInteger choice = [self.menuItems indexOfObject:menuChoice];
    return (int)choice;
}

- (NSString *)description
{
    NSMutableString *menuOutput = [NSMutableString stringWithString:@"\nMenu:\n"];
    
    for (NSString *menuOption in self.menuItems){
        NSString *menuLine = [NSString stringWithFormat:@"- %@\n", menuOption];
        [menuOutput appendString:menuLine];
    }
    
    return menuOutput;
}





@end
