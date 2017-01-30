//
//  RMAlertNextStepView.m
//  Test
//
//  Created by Ruslan Mansurov on 1/30/17.
//  Copyright © 2017 Akvelon. All rights reserved.
//

#import "RMAlertNextStepView.h"

@interface RMAlertNextStepView ()

@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UILabel *label;

@end

@implementation RMAlertNextStepView

- (void)configureWithData:(RMAlertNextStepData *)data {
    self.imageView.image = [UIImage imageNamed:data.iconName];
    self.label.text = data.title;
}

@end
