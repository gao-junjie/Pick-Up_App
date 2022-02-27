//
//  RetrievePasswordView.h
//  PUK
//
//  Created by mac on 2022/2/26.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface RetrievePasswordView : UIView
@property (nonatomic, strong) UIView *changePasswordView;
@property (nonatomic, strong) UIButton *retrievePasswordReturnButton;
@property (nonatomic, strong) UIButton *verificationCodeButton;
@property (nonatomic, strong) UIButton *retrievePasswordNextButton;
@property (nonatomic, strong) UIButton *retrievePasswordCompleteButton;
@property (nonatomic, strong) UIImageView* retrievePasswordImageView;
@property (nonatomic, strong) UIImageView* backgroundImageView;
@property (nonatomic, strong) UIImageView* logoImageView;
@property (nonatomic, strong) UIImageView* logoTitleImageView;
@property (nonatomic, strong) UITextField *phoneNumberTextField;
@property (nonatomic, strong) UITextField *validationTextField;
@property (nonatomic, strong) UITextField *changePasswordTextField;
@property (nonatomic, strong) UITextField *changePasswordAgainTextField;
@property (nonatomic, strong) UILabel *phoneNumberLabel;
@property (nonatomic, strong) UILabel *validationLabel;
@property (nonatomic, strong) UILabel *passwordBigTitleLabel;
@property (nonatomic, strong) UILabel *passwordBigTitleAgainLabel;
@property (nonatomic, strong) UILabel *changePasswordLabel;
@property (nonatomic, strong) UILabel *changePasswordAgainLabel;
@property (nonatomic, assign) NSUInteger countTimerNumberDown;
@property (nonatomic, retain) NSTimer* countDownTimer;


- (void)addChangePasswordView;
@end

NS_ASSUME_NONNULL_END
