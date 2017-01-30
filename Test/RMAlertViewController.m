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
@property (nonatomic, weak) id<RMRootWireframe> rootWireframe;
@property (strong, nonatomic) IBOutlet UIImageView *headerImageView;
@property (strong, nonatomic) IBOutlet UILabel *headerTitleLabel;
@property (strong, nonatomic) IBOutlet UILabel *headerDescriptionLabel;
@property (strong, nonatomic) IBOutlet UIView *detailsContainer;
@property (strong, nonatomic) IBOutlet UILabel *risksLabel;
@property (strong, nonatomic) IBOutlet UIView *stepsContainer;
@property (strong, nonatomic) IBOutlet RoundedRectButton *remindMeLaterButton;
@property (strong, nonatomic) IBOutlet RoundedRectButton *markAsResolvedButton;
@property (weak, nonatomic) IBOutlet UILabel *risksTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *stepsTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *needHelpTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *needHelpDescriptionLabel;
@property (weak, nonatomic) IBOutlet UIButton *contactUsButton;

@end

@implementation RMAlertViewController

- (void)configureWithData:(RMAlertData *)alertData
            helperFactory:(id<RMAlertDataHelperFactory>)helperFactory
            rootWireframe:(id<RMRootWireframe>)rootWireframe {
    
    self.dataHelper = [helperFactory helperWithData:alertData];
    self.rootWireframe = rootWireframe;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupTitle];
    [self setupHeader];
    [self setupDetails];
    [self setupRisks];
    [self setupSteps];
    [self setupButtons];
    
    [self setupLocalization];
}

#pragma mark Setup UI

- (void)setupTitle {
    self.title = self.dataHelper.title;
}

- (void)setupHeader {
    self.headerImageView.image = [UIImage imageNamed:self.dataHelper.iconName];
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
    NSString *newLineCharacter = @"\n";
    self.risksLabel.text = [self.dataHelper.risks componentsJoinedByString:newLineCharacter];
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

- (void)setupLocalization {
    self.headerTitleLabel.text = NSLocalizedString(@"alert_detail_controller_header_title", @"Alert's title in header");
    self.risksTitleLabel.text = NSLocalizedString(@"alert_detail_controller_risks_title", @"Title of Risks section");
    self.stepsTitleLabel.text = NSLocalizedString(@"alert_detail_controller_steps_title", @"Title of Next Steps section");
    self.needHelpTitleLabel.text = NSLocalizedString(@"alert_detail_controller_need_help_title", @"Title of Need Help section");
    self.needHelpDescriptionLabel.text = NSLocalizedString(@"alert_detail_controller_need_help_description", @"Description of Need Help section");
    
    [self.contactUsButton setTitle:NSLocalizedString(@"alert_detail_controller_button_contact_us", @"Title of Contact Us button") forState:UIControlStateNormal];
    [self.remindMeLaterButton setTitle:NSLocalizedString(@"alert_detail_controller_button_remind_me_later", @"Title of Remind me later button") forState:UIControlStateNormal];
    [self.markAsResolvedButton setTitle:NSLocalizedString(@"alert_detail_controller_button_mark_as_resolved", @"Title of Mark as resolved button") forState:UIControlStateNormal];
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

#pragma mark Actions

- (IBAction)contactUsAction:(id)sender {
    [self.rootWireframe presentContactUsAlertController];
}

- (IBAction)remindMeLaterAction:(id)sender {
    [self.rootWireframe presentRemindLaterAlertController];
}

- (IBAction)markAsResolvedAction:(id)sender {
    [self.rootWireframe presentMarkAsResolvedAlertController];
}

@end
