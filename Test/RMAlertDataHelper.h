//
//  RMAlertDataHelper.h
//  Test
//
//  Created by Ruslan Mansurov on 1/30/17.
//  Copyright © 2017 Akvelon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RMAlertDetailData.h"
#import "RMAlertNextStepData.h"

@protocol RMAlertDataHelper <NSObject>

@property (nonatomic, copy, readonly) NSString *title;
@property (nonatomic, copy, readonly) NSString *iconName;
@property (nonatomic, copy, readonly) NSString *description;
@property (nonatomic, copy, readonly) NSArray <RMAlertDetailData *> *details;
@property (nonatomic, copy, readonly) NSArray <NSString *> *risks;
@property (nonatomic, copy, readonly) NSArray <RMAlertNextStepData *> *nextSteps;

@end
