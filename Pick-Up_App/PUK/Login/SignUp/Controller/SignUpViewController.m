//
//  SignUpViewController.m
//  PUK
//
//  Created by 浪极 on 2022/1/22.
//

#import "SignUpViewController.h"
#import "SignInViewController.h"

@interface SignUpViewController ()

@end

@implementation SignUpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _signUpView = [[SignUpView alloc] initWithFrame:self.view.frame];
    [_signUpView.signUpReturnButton addTarget:self action:@selector(pressSignUpReturnButton) forControlEvents:UIControlEventTouchUpInside];
    [_signUpView.signUpNextButton addTarget:self action:@selector(pressSignUpNextButton) forControlEvents:UIControlEventTouchUpInside];
    [_signUpView.verificationCodeButton addTarget:self action:@selector(pressVerificationCodeButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_signUpView];
}


- (void)pressSignUpReturnButton {
    [self.presentingViewController dismissViewControllerAnimated:NO completion:nil];
}

//验证码倒计时
- (void)pressVerificationCodeButton {
    self.signUpView.countTimerNumberDown = 60;
    self.signUpView.verificationCodeButton.userInteractionEnabled = NO;
    [self.signUpView.verificationCodeButton setTitle:[NSString stringWithFormat:@"%lds后重发",self.signUpView.countTimerNumberDown] forState:UIControlStateNormal];
    self.signUpView.verificationCodeButton.backgroundColor = [UIColor colorWithWhite:0.5 alpha:1];
    self.signUpView.countDownTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timeFireMethod) userInfo:nil repeats:YES];

}

-(void)timeFireMethod {
    //倒计时-1
    self.signUpView.countTimerNumberDown--; //修改倒计时标签现实内容
    [self.signUpView.verificationCodeButton setTitle:[NSString stringWithFormat:@"%lds后重发",self.signUpView.countTimerNumberDown] forState:UIControlStateNormal]; //当倒计时到0时，做需要的操作，比如验证码过期不能提交
    if (self.signUpView.countTimerNumberDown == 0){
        [self.signUpView.countDownTimer invalidate];
        [self.signUpView.verificationCodeButton setTitle:@"重新获取" forState:UIControlStateNormal];
        self.signUpView.countTimerNumberDown = 60;
        self.signUpView.verificationCodeButton.userInteractionEnabled = YES;
        self.signUpView.verificationCodeButton.backgroundColor = [UIColor colorWithRed:0 green:0.38 blue:0.9 alpha:0.95];
    }
    
}

- (void)pressSignUpNextButton {
    [self.signUpView.countDownTimer invalidate];
    self.signUpView.verificationCodeButton.hidden = YES;
    self.signUpView.validationTextField.hidden = YES;
    self.signUpView.phoneNumberTextField.hidden = YES;
    self.signUpView.validationLabel.hidden = YES;
    self.signUpView.phoneNumberLabel.hidden = YES;
    self.signUpView.signUpNextButton.hidden = YES;
    [self.signUpView addNextView];
}



@end
