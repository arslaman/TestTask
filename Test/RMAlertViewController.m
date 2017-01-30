//
//  RMAlertViewController.m
//  Test
//
//  Created by Ruslan Mansurov on 1/27/17.
//  Copyright © 2017 Akvelon. All rights reserved.
//

#import "RMAlertViewController.h"
#import "RMAlertNextStepView.h"
#import "RMAlertDetailView.h"
#import <Masonry/Masonry.h>
#import "RoundedRectButton.h"
#import "UIColor+RM.h"

@interface RMAlertViewController ()

@property (nonatomic, strong) id<RMAlertDataHelper> dataHelper;
@property (strong, nonatomic) IBOutlet UIImageView *headerImageView;
@property (strong, nonatomic) IBOutlet UILabel *headerTitleLabel;
@property (strong, nonatomic) IBOutlet UILabel *headerDescriptionLabel;
@property (strong, nonatomic) IBOutlet UIView *detailsContainer;
@property (strong, nonatomic) IBOutlet UILabel *risksLabel;
@property (strong, nonatomic) IBOutlet UIView *stepsContainer;
@property (strong, nonatomic) IBOutlet RoundedRectButton *remindMeLaterButton;
@property (strong, nonatomic) IBOutlet RoundedRectButton *markAsResolvedButton;

@end

@implementation RMAlertViewController

- (void)configureWithData:(RMAlertData *)alertData
            helperFactory:(id<RMAlertDataHelperFactory>)helperFactory {
    
    self.dataHelper = [helperFactory helperWithData:alertData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupTitle];
    [self setupHeader];
    [self setupDetails];
    [self setupRisks];
    [self setupSteps];
    [self setupButtons];
}

- (void)setupTitle {
    self.title = self.dataHelper.title;
}

- (void)setupHeader {
    self.headerImageView.image = [UIImage imageNamed:self.dataHelper.iconName];
    self.headerTitleLabel.text = @"Identity Risk";
    self.headerDescriptionLabel.text = self.dataHelper.description;
}

- (void)setupDetails {
    NSMutableArray *detailsViews = [NSMutableArray new];
    for (RMAlertDetailData *detailData in self.dataHelper.details) {
        RMAlertDetailView *view = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([RMAlertDetailView class])
                                                                  owner:nil
                                                                options:nil].firstObject;
        [view configureWithData:detailData];
        [detailsViews addObject:view];
    }
    
    [self addViews:detailsViews toContainer:self.detailsContainer];
}

- (void)setupRisks {
    self.risksLabel.text = [self.dataHelper.risks componentsJoinedByString:@"\n"];
}

- (void)setupSteps {
    NSMutableArray *stepsViews = [NSMutableArray new];
    for (RMAlertNextStepData *stepData in self.dataHelper.nextSteps) {
        RMAlertNextStepView *view = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([RMAlertNextStepView class])
                                                                  owner:nil
                                                                options:nil].firstObject;
        [view configureWithData:stepData];
        [stepsViews addObject:view];
    }
    
    [self addViews:stepsViews toContainer:self.stepsContainer];
}

- (void)setupButtons {
    CGFloat cornerRadius = 5;
    CGFloat shadowWidth = 3;
    
    [self.remindMeLaterButton setCornerRadius:cornerRadius
                                  shadowColor:[UIColor rm_colorWithHexString:@"0c853f"]
                                  shadowWidth:shadowWidth];
    
    [self.markAsResolvedButton setCornerRadius:cornerRadius
                                  shadowColor:[UIColor blackColor]
                                  shadowWidth:shadowWidth];
}

#pragma mark Private

- (void)addViews:(NSArray <UIView *> *)views toContainer:(UIView *)container {
    
    UIView *previousView;
    for (UIView *view in views) {
        [container addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(container);
            if (previousView != nil) {
                make.top.equalTo(previousView.mas_bottom);
            } else {
                make.top.equalTo(container);
            }
        }];
        previousView = view;
    }
    
    [previousView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(container);
    }];
}

@end
