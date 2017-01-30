//
//  RMAlertController.h
//  Test
//
//  Created by Ruslan Mansurov on 31/01/17.
//  Copyright © 2017 Akvelon. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol RMAlertController <NSObject>

- (void)presentInController:(UIViewController *)controller;

@end
