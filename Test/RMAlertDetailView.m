//
//  RMAlertDetailView.m
//  Test
//
//  Created by Ruslan Mansurov on 1/30/17.
//  Copyright © 2017 Akvelon. All rights reserved.
//

#import "RMAlertDetailView.h"
#import "NSDate+RMFormatter.h"

@interface RMAlertDetailView ()

@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UILabel *subjectLabel;
@property (strong, nonatomic) IBOutlet UILabel *fromLabel;
@property (strong, nonatomic) IBOutlet UILabel *dateLabel;

@end

@implementation RMAlertDetailView

- (void)configureWithData:(RMAlertDetailData *)data {
    self.imageView.image = [UIImage imageNamed:data.iconName];
    self.subjectLabel.text = data.subject;
    self.fromLabel.text = [NSString stringWithFormat:@"From: %@", data.from];
    self.dateLabel.text = [NSString stringWithFormat:@"Date of leak: %@", [data.date formatWithDashedMMDDYYYY]];
}

@end
