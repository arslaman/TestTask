//
//  RMAlertNextStepData.h
//  Test
//
//  Created by Ruslan Mansurov on 1/30/17.
//  Copyright © 2017 Akvelon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RMAlertNextStepData : NSObject

@property (nonatomic, copy, readonly) NSString *iconName;
@property (nonatomic, copy, readonly) NSString *title;

- (instancetype)initWithTitle:(NSString *)title
                     iconName:(NSString *)iconName;

@end
