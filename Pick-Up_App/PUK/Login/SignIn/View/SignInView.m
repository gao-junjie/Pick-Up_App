//
//  SignInView.m
//  PUK
//
//  Created by 浪极 on 2022/1/22.
//

#import "SignInView.h"
#import "Masonry.h"
#define SIZE_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SIZE_HEIGHT ([UIScreen mainScreen].bounds.size.height)

@implementation SignInView

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
    
    _usernameLabel = [[UILabel alloc] init];
    _usernameLabel.layer.masksToBounds = YES;
    [_usernameLabel.layer setCornerRadius:SIZE_HEIGHT * 0.026];
    _usernameLabel.backgroundColor = [UIColor colorWithWhite:0.73 alpha:1];
    [self addSubview:_usernameLabel];
    [_usernameLabel mas_makeConstraints:^(MASConstraintMaker* make) {
        make.top.equalTo(self.mas_centerY).offset(-SIZE_HEIGHT * 0.1);
        make.height.equalTo(@(SIZE_HEIGHT * 0.052));
        make.centerX.equalTo(self.mas_centerX).offset(-SIZE_WIDTH*0.85);
        make.width.equalTo(@(SIZE_WIDTH * 0.7));
    }];
    
    _passwordLabel = [[UILabel alloc] init];
    _passwordLabel.layer.masksToBounds = YES;
    [_passwordLabel.layer setCornerRadius:SIZE_HEIGHT * 0.026];
    _passwordLabel.backgroundColor = [UIColor colorWithWhite:0.73 alpha:1];
    [self addSubview:_passwordLabel];
    [_passwordLabel mas_makeConstraints:^(MASConstraintMaker* make) {
        make.top.equalTo(self.usernameLabel.mas_bottom).offset(SIZE_HEIGHT * 0.03);
        make.height.equalTo(@(SIZE_HEIGHT * 0.052));
        make.centerX.equalTo(self.mas_centerX).offset(-SIZE_WIDTH*0.85);
        make.width.equalTo(@(SIZE_WIDTH * 0.7));
    }];
    
    _recoverPasswordButton = [UIButton buttonWithType:UIButtonTypeSystem];
    _recoverPasswordButton.backgroundColor = [UIColor clearColor];
    _recoverPasswordButton.titleLabel.font = [UIFont systemFontOfSize:22];
    [_recoverPasswordButton setTitle:@"找回密码" forState:UIControlStateNormal];
    [_recoverPasswordButton setTitleColor:[UIColor colorWithRed:0 green:0.5 blue:0.71 alpha:1] forState:UIControlStateNormal];
    [self addSubview:_recoverPasswordButton];
    [_recoverPasswordButton mas_makeConstraints:^(MASConstraintMaker* make) {
        make.bottom.equalTo(self.mas_bottom).offset(-SIZE_HEIGHT * 0.1);
        make.height.equalTo(@(SIZE_HEIGHT * 0.04));
        make.right.equalTo(self.mas_centerX).offset(-(SIZE_WIDTH * 0.1));
        make.width.equalTo(@(SIZE_WIDTH * 0.3));
    }];
    
    _registerButton = [UIButton buttonWithType:UIButtonTypeSystem];
    _registerButton.titleLabel.font = [UIFont systemFontOfSize:22];
    _registerButton.backgroundColor = [UIColor clearColor];
    [_registerButton setTitle:@"注册" forState:UIControlStateNormal];
    [_registerButton setTitleColor:[UIColor colorWithRed:0 green:0.5 blue:0.71 alpha:1] forState:UIControlStateNormal];
    [self addSubview:_registerButton];
    [_registerButton mas_makeConstraints:^(MASConstraintMaker* make) {
        make.bottom.equalTo(self.mas_bottom).offset(-SIZE_HEIGHT * 0.1);
        make.height.equalTo(@(SIZE_HEIGHT * 0.04));
        make.left.equalTo(self.mas_centerX).offset((SIZE_WIDTH * 0.1));
        make.width.equalTo(@(SIZE_WIDTH * 0.3));
    }];
    
    _usernameTextField = [[UITextField alloc] init];
    _usernameTextField.backgroundColor = [UIColor clearColor];
    _usernameTextField.placeholder = @"请输入用户名";
    _usernameTextField.textColor = [UIColor blackColor];
    _usernameTextField.keyboardType = UIKeyboardTypeDefault;
    _usernameTextField.font = [UIFont systemFontOfSize:22];
    [self addSubview:_usernameTextField];
    [_usernameTextField mas_makeConstraints:^(MASConstraintMaker* make) {
        make.top.equalTo(self.usernameLabel.mas_top).offset(SIZE_HEIGHT*0.003);
        make.height.equalTo(@(SIZE_HEIGHT * 0.045));
        make.centerX.equalTo(self.mas_centerX).offset(SIZE_WIDTH * 0.81);
        make.width.equalTo(@(SIZE_WIDTH * 0.62));
    }];
    
    _passwordTextField = [[UITextField alloc] init];
    _passwordTextField.backgroundColor = [UIColor clearColor];
    _passwordTextField.placeholder = @"请输入密码";
    _passwordTextField.textColor = [UIColor blackColor];
    _passwordTextField.keyboardType = UIKeyboardTypeDefault;
    _passwordTextField.font = [UIFont systemFontOfSize:22];
    [self addSubview:_passwordTextField];
    [_passwordTextField mas_makeConstraints:^(MASConstraintMaker* make) {
        make.top.equalTo(self.passwordLabel.mas_top).offset(SIZE_HEIGHT * 0.003);
        make.height.equalTo(@(SIZE_HEIGHT * 0.045));
        make.centerX.equalTo(self.mas_centerX).offset(-SIZE_WIDTH * 0.81);
        make.width.equalTo(@(SIZE_WIDTH * 0.62));
    }];
    
    _lineTipLabel = [[UILabel alloc] init];
    _lineTipLabel.backgroundColor = [UIColor grayColor];
    [self addSubview:_lineTipLabel];
    [_lineTipLabel mas_makeConstraints:^(MASConstraintMaker* make) {
        make.bottom.equalTo(self.mas_bottom).offset(-SIZE_HEIGHT * 0.09);
        make.height.equalTo(@(SIZE_HEIGHT * 0.06));
        make.centerX.equalTo(self.mas_centerX).offset(0);
        make.width.equalTo(@(1));
    }];
    
    _loginButtonImageView = [[UIImageView alloc] init];
    _loginButtonImageView.backgroundColor = [UIColor colorWithRed:0 green:0.38 blue:0.9 alpha:0.95];
    _loginButtonImageView.alpha = 0;
    _loginButtonImageView.layer.masksToBounds = YES;
    [_loginButtonImageView.layer setCornerRadius:SIZE_WIDTH * 0.1];
    [self addSubview:_loginButtonImageView];
    [_loginButtonImageView mas_makeConstraints:^(MASConstraintMaker* make) {
        make.top.equalTo(_passwordLabel.mas_bottom).offset(SIZE_HEIGHT * 0.06);
        make.height.equalTo(@(SIZE_WIDTH * 0.2));
        make.centerX.equalTo(self.mas_centerX).offset(0);
        make.width.equalTo(@(SIZE_WIDTH * 0.2));
    }];
    _tapGesturRecognizer = [[UITapGestureRecognizer alloc] init];
    [_loginButtonImageView addGestureRecognizer:_tapGesturRecognizer];
    _loginButtonImageView.userInteractionEnabled = YES;
    
    
    _loginArrowImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"jiantou.png"]];
    [self addSubview:_loginArrowImageView];
    [_loginArrowImageView mas_makeConstraints:^(MASConstraintMaker* make) {
        make.centerY.equalTo(_loginButtonImageView.mas_centerY).offset(0);
        make.height.equalTo(@(SIZE_WIDTH * 0.1));
        make.centerX.equalTo(self.mas_centerX).offset(-SIZE_WIDTH * 0.55);
        make.width.equalTo(@(SIZE_WIDTH * 0.1));
    }];
    

    
    return self;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [_passwordTextField resignFirstResponder];
    [_usernameTextField resignFirstResponder];
}



@end
