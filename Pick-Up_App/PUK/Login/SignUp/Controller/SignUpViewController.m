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
    self.signUpView.nameNextTextField.delegate = self;
    [_signUpView.selectPickerButton addTarget:self action:@selector(pressSelectPickerButton) forControlEvents:UIControlEventTouchUpInside];
    [_signUpView.selectParentButton addTarget:self action:@selector(pressSelectParentButton) forControlEvents:UIControlEventTouchUpInside];
    [_signUpView.selectTeacherButton addTarget:self action:@selector(pressSelectTeacherButton) forControlEvents:UIControlEventTouchUpInside];
    [_signUpView.signUpNextTwiceButton addTarget:self action:@selector(pressSignUpNextTwiceButton) forControlEvents:UIControlEventTouchUpInside];
}

- (void)pressSignUpNextTwiceButton {

    if ((self.signUpView.selectPickerButton.selected == NO && self.signUpView.selectTeacherButton.selected == NO && self.signUpView.selectParentButton.selected == NO) || [self.signUpView.nameNextTextField.text isEqualToString:@""] || [self.signUpView.passwordNextTextField.text isEqualToString:@""]) {
        UIAlertController* boomAlert = [UIAlertController alertControllerWithTitle:@"警告" message:@"请完善注册信息" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *boomAction= [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action) {
        }];
        [boomAlert addAction:boomAction];
        [self presentViewController:boomAlert animated:YES completion:nil];
    } else {
        [self.presentingViewController dismissViewControllerAnimated:NO completion:nil];
    }
    
    
}

- (void)pressSelectPickerButton {
    if (self.signUpView.selectPickerButton.selected == NO) {
        self.signUpView.selectPickerButton.selected = YES;
        self.signUpView.selectParentButton.selected = NO;
        self.signUpView.selectTeacherButton.selected = NO;
        self.signUpView.selectPickerButton.backgroundColor = [UIColor colorWithRed:0 green:0.38 blue:0.7 alpha:1];
        self.signUpView.selectParentButton.backgroundColor = [UIColor colorWithWhite:0.7 alpha:1];
        self.signUpView.selectTeacherButton.backgroundColor = [UIColor colorWithWhite:0.7 alpha:1];
    }
}

- (void)pressSelectParentButton {
    if (self.signUpView.selectParentButton.selected == NO) {
        self.signUpView.selectParentButton.selected = YES;
        self.signUpView.selectPickerButton.selected = NO;
        self.signUpView.selectTeacherButton.selected = NO;
        self.signUpView.selectParentButton.backgroundColor = [UIColor colorWithRed:0 green:0.38 blue:0.7 alpha:1];
        self.signUpView.selectPickerButton.backgroundColor = [UIColor colorWithWhite:0.7 alpha:1];
        self.signUpView.selectTeacherButton.backgroundColor = [UIColor colorWithWhite:0.7 alpha:1];
    }
}

- (void)pressSelectTeacherButton {
    if (self.signUpView.selectTeacherButton.selected == NO) {
        self.signUpView.selectTeacherButton.selected = YES;
        self.signUpView.selectPickerButton.selected = NO;
        self.signUpView.selectParentButton.selected = NO;
        self.signUpView.selectTeacherButton.backgroundColor = [UIColor colorWithRed:0 green:0.38 blue:0.7 alpha:1];
        self.signUpView.selectPickerButton.backgroundColor = [UIColor colorWithWhite:0.7 alpha:1];
        self.signUpView.selectParentButton.backgroundColor = [UIColor colorWithWhite:0.7 alpha:1];
    }
}

- (BOOL) deptNameInputShouldChinese {
    NSString *regex = @"[\u4e00-\u9fa5]+";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    if (![pred evaluateWithObject:self.signUpView.nameNextTextField.text]) {
        return NO;
    }
    return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    if (textField == self.signUpView.nameNextTextField) {
        self.signUpView.wrongNameAlertLabel.hidden = YES;
    }
}


- (void)textFieldDidEndEditing:(UITextField *)textField {
    if (textField == self.signUpView.nameNextTextField) {
        if (![self deptNameInputShouldChinese] && ![self.signUpView.nameNextTextField.text isEqualToString:@""]) {
            self.signUpView.wrongNameAlertLabel.hidden = NO;
        }
    }
    

}


@end
