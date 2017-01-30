//
//  RMAlertViewController.h
//  Test
//
//  Created by Ruslan Mansurov on 1/27/17.
//  Copyright © 2017 Akvelon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RMAlertData.h"
#import "RMAlertDataHelperFactory.h"

@interface RMAlertViewController : UIViewController

- (void)configureWithData:(RMAlertData *)alertData
            helperFactory:(id<RMAlertDataHelperFactory>)helperFactory;

@end
