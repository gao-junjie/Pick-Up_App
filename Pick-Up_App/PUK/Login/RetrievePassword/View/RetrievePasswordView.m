//
//  RetrievePasswordView.m
//  PUK
//
//  Created by mac on 2022/2/26.
//

#import "RetrievePasswordView.h"
#import "Masonry.h"
#define SIZE_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SIZE_HEIGHT ([UIScreen mainScreen].bounds.size.height)

@implementation RetrievePasswordView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    self.backgroundColor = [UIColor whiteColor];
    
    _backgroundImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"backgroundImage.jpg"]];
    [self addSubview:_backgroundImageView];
    [_backgroundImageView mas_makeConstraints:^(MASConstraintMaker* make) {
        make.top.equalTo(@0);
        make.height.equalTo(@(SIZE_HEIGHT));
        make.left.equalTo(@0);
        make.width.equalTo(@(SIZE_WIDTH));
    }];
    
    _logoImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"PUKLogo.png"]];
    [self addSubview:_logoImageView];
    [_logoImageView mas_makeConstraints:^(MASConstraintMaker* make) {
        make.top.equalTo(self).offset(SIZE_HEIGHT * 0.08);
        make.height.equalTo(@(SIZE_HEIGHT * 0.15));
        make.centerX.equalTo(self.mas_centerX).offset(0);
        make.width.equalTo(@(SIZE_WIDTH * 0.7));
    }];
    
    _logoTitleImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"PUKTitleLogo.png"]];
    [self addSubview:_logoTitleImageView];
    [_logoTitleImageView mas_makeConstraints:^(MASConstraintMaker* make) {
        make.top.equalTo(_logoImageView.mas_bottom).offset(SIZE_HEIGHT * 0.02);
        make.height.equalTo(@(SIZE_HEIGHT * 0.025));
        make.right.equalTo(self.mas_right).offset(-SIZE_WIDTH * 0.07);
        make.width.equalTo(@(SIZE_WIDTH * 0.6));
    }];
    
    _retrievePasswordImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"retrievePassword.png"]];
    [self addSubview:_retrievePasswordImageView];
    [_retrievePasswordImageView mas_makeConstraints:^(MASConstraintMaker* make) {
        make.top.equalTo(_logoTitleImageView.mas_bottom).offset(SIZE_HEIGHT * 0.04);
        make.height.equalTo(@(SIZE_HEIGHT * 0.05));
        make.centerX.equalTo(self.mas_centerX).offset(0);
        make.width.equalTo(@(SIZE_WIDTH * 0.4));
    }];
    
    _retrievePasswordReturnButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _retrievePasswordReturnButton.backgroundColor = [UIColor clearColor];
    [_retrievePasswordReturnButton setImage:[UIImage imageNamed:@"fanhui.png"] forState:UIControlStateNormal];
    [self addSubview:_retrievePasswordReturnButton];
    [_retrievePasswordReturnButton mas_makeConstraints:^(MASConstraintMaker* make) {
        make.top.equalTo(self.mas_top).offset(SIZE_HEIGHT * 0.05);
        make.height.equalTo(@(SIZE_HEIGHT * 0.03));
        make.left.equalTo(self.mas_left).offset(SIZE_WIDTH * 0.02);
        make.width.equalTo(@(SIZE_HEIGHT * 0.03));
    }];
    
    _phoneNumberLabel = [[UILabel alloc] init];
    _phoneNumberLabel.layer.masksToBounds = YES;
    [_phoneNumberLabel.layer setCornerRadius:SIZE_HEIGHT * 0.026];
    _phoneNumberLabel.backgroundColor = [UIColor colorWithWhite:0.73 alpha:1];
    [self addSubview:_phoneNumberLabel];
    [_phoneNumberLabel mas_makeConstraints:^(MASConstraintMaker* make) {
        make.top.equalTo(self.mas_centerY).offset(-SIZE_HEIGHT * 0.1);
        make.height.equalTo(@(SIZE_HEIGHT * 0.052));
        make.centerX.equalTo(self.mas_centerX).offset(0);
        make.width.equalTo(@(SIZE_WIDTH * 0.7));
    }];
    
    _validationLabel = [[UILabel alloc] init];
    _validationLabel.layer.masksToBounds = YES;
    [_validationLabel.layer setCornerRadius:SIZE_HEIGHT * 0.026];
    _validationLabel.backgroundColor = [UIColor colorWithWhite:0.73 alpha:1];
    [self addSubview:_validationLabel];
    [_validationLabel mas_makeConstraints:^(MASConstraintMaker* make) {
        make.top.equalTo(self.phoneNumberLabel.mas_bottom).offset(SIZE_HEIGHT * 0.03);
        make.height.equalTo(@(SIZE_HEIGHT * 0.052));
        make.centerX.equalTo(self.mas_centerX).offset(0);
        make.width.equalTo(@(SIZE_WIDTH * 0.7));
    }];
    
    _phoneNumberTextField = [[UITextField alloc] init];
    _phoneNumberTextField.backgroundColor = [UIColor clearColor];
    _phoneNumberTextField.placeholder = @"请输入手机号";
    _phoneNumberTextField.textColor = [UIColor blackColor];
    _phoneNumberTextField.keyboardType = UIKeyboardTypeDefault;
    _phoneNumberTextField.font = [UIFont systemFontOfSize:22];
    [self addSubview:_phoneNumberTextField];
    [_phoneNumberTextField mas_makeConstraints:^(MASConstraintMaker* make) {
        make.top.equalTo(self.phoneNumberLabel.mas_top).offset(SIZE_HEIGHT*0.003);
        make.height.equalTo(@(SIZE_HEIGHT * 0.045));
        make.centerX.equalTo(self.mas_centerX).offset(0);
        make.width.equalTo(@(SIZE_WIDTH * 0.62));
    }];
    
    _validationTextField = [[UITextField alloc] init];
    _validationTextField.backgroundColor = [UIColor clearColor];
    _validationTextField.placeholder = @"请输入验证码";
    _validationTextField.textColor = [UIColor blackColor];
    _validationTextField.keyboardType = UIKeyboardTypeDefault;
    _validationTextField.font = [UIFont systemFontOfSize:22];
    [self addSubview:_validationTextField];
    [_validationTextField mas_makeConstraints:^(MASConstraintMaker* make) {
        make.top.equalTo(self.validationLabel.mas_top).offset(SIZE_HEIGHT * 0.003);
        make.height.equalTo(@(SIZE_HEIGHT * 0.045));
        make.left.equalTo(self.validationLabel.mas_left).offset((SIZE_WIDTH * 0.04));
        make.width.equalTo(@(SIZE_WIDTH * 0.4));
    }];
    
    _verificationCodeButton = [UIButton buttonWithType:UIButtonTypeSystem];
    _verificationCodeButton.backgroundColor = [UIColor colorWithRed:0 green:0.38 blue:0.9 alpha:0.95];
    _verificationCodeButton.titleLabel.font = [UIFont systemFontOfSize:18];
    [_verificationCodeButton setTitle:@"发送验证码" forState:UIControlStateNormal];
    [_verificationCodeButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self addSubview:_verificationCodeButton];
    [_verificationCodeButton mas_makeConstraints:^(MASConstraintMaker* make) {
        make.top.equalTo(self.validationLabel.mas_top).offset(0);
        make.bottom.equalTo(self.validationLabel.mas_bottom).offset(0);
        make.right.equalTo(self.validationLabel.mas_right).offset(0);
        make.width.equalTo(@(SIZE_WIDTH * 0.25));
    }];
    [_verificationCodeButton layoutIfNeeded];
    //TODO:uiview 单边圆角或者单边框
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:_verificationCodeButton.bounds byRoundingCorners:(UIRectCornerTopRight | UIRectCornerBottomRight) cornerRadii:CGSizeMake(SIZE_HEIGHT * 0.026,SIZE_HEIGHT * 0.026)];//圆角大小
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = _verificationCodeButton.bounds;
    maskLayer.path = maskPath.CGPath;
    _verificationCodeButton.layer.mask = maskLayer;
    
    _retrievePasswordNextButton = [UIButton buttonWithType:UIButtonTypeSystem];
    _retrievePasswordNextButton.backgroundColor = [UIColor colorWithRed:0 green:0.38 blue:0.7 alpha:1];
    _retrievePasswordNextButton.layer.masksToBounds = YES;
    [_retrievePasswordNextButton.layer setCornerRadius:SIZE_WIDTH * 0.125];
    [_retrievePasswordNextButton setTitle:@"下一步" forState:UIControlStateNormal];
    [_retrievePasswordNextButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _retrievePasswordNextButton.titleLabel.font = [UIFont systemFontOfSize:29];
    [self addSubview:_retrievePasswordNextButton];
    [_retrievePasswordNextButton mas_makeConstraints:^(MASConstraintMaker* make) {
        make.top.equalTo(_validationLabel.mas_bottom).offset(SIZE_HEIGHT * 0.1);
        make.height.equalTo(@(SIZE_WIDTH * 0.25));
        make.centerX.equalTo(self.mas_centerX).offset(0);
        make.width.equalTo(@(SIZE_WIDTH * 0.25));
    }];
    
    return self;
}

- (void)addChangePasswordView {
    _changePasswordView = [[UIView alloc] initWithFrame:CGRectMake(SIZE_WIDTH * 0.05, SIZE_HEIGHT, SIZE_WIDTH * 0.9, SIZE_HEIGHT * 0.62)];
    _changePasswordView.backgroundColor = [UIColor whiteColor];
    //TODO:uiview 单边圆角或者单边框
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:_changePasswordView.bounds byRoundingCorners:(UIRectCornerTopRight | UIRectCornerTopLeft) cornerRadii:CGSizeMake(SIZE_WIDTH * 0.05,SIZE_WIDTH * 0.05)];//圆角大小
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = _changePasswordView.bounds;
    maskLayer.path = maskPath.CGPath;
    _changePasswordView.layer.mask = maskLayer;
    [self addSubview:_changePasswordView];
    
    _passwordBigTitleLabel = [[UILabel alloc] init];
    _passwordBigTitleLabel.text = @"请设置新密码：";
    _passwordBigTitleLabel.textColor = [UIColor blackColor];
    _passwordBigTitleLabel.font = [UIFont systemFontOfSize:21];
    [self.changePasswordView addSubview:_passwordBigTitleLabel];
    [_passwordBigTitleLabel mas_makeConstraints:^(MASConstraintMaker* make) {
        make.top.equalTo(self.changePasswordView.mas_top).offset(SIZE_HEIGHT * 0.04);
        make.height.equalTo(@(SIZE_HEIGHT * 0.052));
        make.centerX.equalTo(self.mas_centerX).offset(0);
        make.width.equalTo(@(SIZE_WIDTH * 0.7));
    }];
    
    _changePasswordLabel = [[UILabel alloc] init];
    _changePasswordLabel.layer.masksToBounds = YES;
    [_changePasswordLabel.layer setCornerRadius:SIZE_HEIGHT * 0.026];
    _changePasswordLabel.backgroundColor = [UIColor colorWithWhite:0.73 alpha:1];
    [self.changePasswordView addSubview:_changePasswordLabel];
    [_changePasswordLabel mas_makeConstraints:^(MASConstraintMaker* make) {
        make.top.equalTo(self.passwordBigTitleLabel.mas_bottom).offset(SIZE_HEIGHT * 0.01);
        make.height.equalTo(@(SIZE_HEIGHT * 0.052));
        make.centerX.equalTo(self.mas_centerX).offset(0);
        make.width.equalTo(@(SIZE_WIDTH * 0.7));
    }];
    
    _changePasswordTextField = [[UITextField alloc] init];
    _changePasswordTextField.backgroundColor = [UIColor clearColor];
    _changePasswordTextField.placeholder = @"请输入新密码";
    _changePasswordTextField.textColor = [UIColor blackColor];
    _changePasswordTextField.keyboardType = UIKeyboardTypeDefault;
    _changePasswordTextField.font = [UIFont systemFontOfSize:22];
    [self.changePasswordView addSubview:_changePasswordTextField];
    [_changePasswordTextField mas_makeConstraints:^(MASConstraintMaker* make) {
        make.top.equalTo(self.changePasswordLabel.mas_top).offset(SIZE_HEIGHT*0.003);
        make.height.equalTo(@(SIZE_HEIGHT * 0.045));
        make.centerX.equalTo(self.mas_centerX).offset(0);
        make.width.equalTo(@(SIZE_WIDTH * 0.62));
    }];
    
    _passwordBigTitleAgainLabel = [[UILabel alloc] init];
    _passwordBigTitleAgainLabel.text = @"确认密码：";
    _passwordBigTitleAgainLabel.textColor = [UIColor blackColor];
    _passwordBigTitleAgainLabel.font = [UIFont systemFontOfSize:21];
    [self.changePasswordView addSubview:_passwordBigTitleAgainLabel];
    [_passwordBigTitleAgainLabel mas_makeConstraints:^(MASConstraintMaker* make) {
        make.top.equalTo(self.changePasswordLabel.mas_bottom).offset(SIZE_HEIGHT * 0.045);
        make.height.equalTo(@(SIZE_HEIGHT * 0.052));
        make.centerX.equalTo(self.mas_centerX).offset(0);
        make.width.equalTo(@(SIZE_WIDTH * 0.7));
    }];
    
    _changePasswordAgainLabel = [[UILabel alloc] init];
    _changePasswordAgainLabel.layer.masksToBounds = YES;
    [_changePasswordAgainLabel.layer setCornerRadius:SIZE_HEIGHT * 0.026];
    _changePasswordAgainLabel.backgroundColor = [UIColor colorWithWhite:0.73 alpha:1];
    [self.changePasswordView addSubview:_changePasswordAgainLabel];
    [_changePasswordAgainLabel mas_makeConstraints:^(MASConstraintMaker* make) {
        make.top.equalTo(self.passwordBigTitleAgainLabel.mas_bottom).offset(SIZE_HEIGHT * 0.01);
        make.height.equalTo(@(SIZE_HEIGHT * 0.052));
        make.centerX.equalTo(self.mas_centerX).offset(0);
        make.width.equalTo(@(SIZE_WIDTH * 0.7));
    }];
    
    _changePasswordAgainTextField = [[UITextField alloc] init];
    _changePasswordAgainTextField.backgroundColor = [UIColor clearColor];
    _changePasswordAgainTextField.placeholder = @"请再输入一遍";
    _changePasswordAgainTextField.textColor = [UIColor blackColor];
    _changePasswordAgainTextField.keyboardType = UIKeyboardTypeDefault;
    _changePasswordAgainTextField.font = [UIFont systemFontOfSize:22];
    [self.changePasswordView addSubview:_changePasswordAgainTextField];
    [_changePasswordAgainTextField mas_makeConstraints:^(MASConstraintMaker* make) {
        make.top.equalTo(self.changePasswordAgainLabel.mas_top).offset(SIZE_HEIGHT*0.003);
        make.height.equalTo(@(SIZE_HEIGHT * 0.045));
        make.centerX.equalTo(self.mas_centerX).offset(0);
        make.width.equalTo(@(SIZE_WIDTH * 0.62));
    }];
    
    _retrievePasswordCompleteButton = [UIButton buttonWithType:UIButtonTypeSystem];
    _retrievePasswordCompleteButton.backgroundColor = [UIColor colorWithRed:0 green:0.38 blue:0.7 alpha:1];
    _retrievePasswordCompleteButton.layer.masksToBounds = YES;
    [_retrievePasswordCompleteButton.layer setCornerRadius:SIZE_WIDTH * 0.125];
    [_retrievePasswordCompleteButton setTitle:@"完成" forState:UIControlStateNormal];
    [_retrievePasswordCompleteButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _retrievePasswordCompleteButton.titleLabel.font = [UIFont systemFontOfSize:29];
    [self.changePasswordView addSubview:_retrievePasswordCompleteButton];
    [_retrievePasswordCompleteButton mas_makeConstraints:^(MASConstraintMaker* make) {
        make.top.equalTo(_changePasswordAgainLabel.mas_bottom).offset(SIZE_HEIGHT * 0.07);
        make.height.equalTo(@(SIZE_WIDTH * 0.25));
        make.centerX.equalTo(self.mas_centerX).offset(0);
        make.width.equalTo(@(SIZE_WIDTH * 0.25));
    }];
}
@end
