//
//  RMAlertViewController.h
//  Test
//
//  Created by Ruslan Mansurov on 1/27/17.
//  Copyright © 2017 Akvelon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RMAlertDataHelperFactory.h"
#import "RMRootWireframe.h"

@interface RMAlertViewController : UIViewController

- (void)configureWithData:(RMAlertData *)alertData
            helperFactory:(id<RMAlertDataHelperFactory>)helperFactory
            rootWireframe:(id<RMRootWireframe>)rootWireframe;

@end
