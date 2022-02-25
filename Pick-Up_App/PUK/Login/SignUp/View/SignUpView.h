//
//  SignUpView.h
//  PUK
//
//  Created by 浪极 on 2022/1/22.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SignUpView : UIView <UITextFieldDelegate>

@property (nonatomic, strong) UIButton *signUpReturnButton;
@property (nonatomic, strong) UIButton *signUpNextButton;
@property (nonatomic, strong) UIButton *verificationCodeButton;
@property (nonatomic, strong) UITextField *phoneNumberTextField;
@property (nonatomic, strong) UITextField *validationTextField;
@property (nonatomic, strong) UITextField *passwordNextTextField;
@property (nonatomic, strong) UITextField *nameNextTextField;
@property (nonatomic, strong) UILabel *phoneNumberLabel;
@property (nonatomic, strong) UILabel *validationLabel;
@property (nonatomic, strong) UILabel *passwordNextLabel;
@property (nonatomic, strong) UILabel *nameNextLabel;
@property (nonatomic, strong) UIImageView* backgroundImageView;
@property (nonatomic, strong) UIImageView* logoImageView;
@property (nonatomic, strong) UIImageView* logoTitleImageView;
@property (nonatomic, assign) NSUInteger countTimerNumberDown;
@property (nonatomic, retain) NSTimer* countDownTimer;

- (void)addNextView;
@end

NS_ASSUME_NONNULL_END
