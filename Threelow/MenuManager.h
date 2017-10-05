//
//  MenuManager.h
//  Threelow
//
//  Created by Andrew on 2017-10-04.
//  Copyright © 2017 Andrew. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "InputCollector.h"

@interface MenuManager : NSObject

@property (nonatomic) NSArray *menuItems;

- (instancetype)initWithMenuItems:(NSArray *)menuItems;
- (int)getMenuChoice;


@end
