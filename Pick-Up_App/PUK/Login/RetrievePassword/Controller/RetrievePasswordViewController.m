//
//  RetrievePasswordViewController.m
//  PUK
//
//  Created by mac on 2022/2/26.
//

#import "RetrievePasswordViewController.h"
#import "Masonry.h"
#define SIZE_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SIZE_HEIGHT ([UIScreen mainScreen].bounds.size.height)
@interface RetrievePasswordViewController ()

@end

@implementation RetrievePasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _retrievePasswordView = [[RetrievePasswordView alloc] initWithFrame:self.view.frame];
    [_retrievePasswordView.retrievePasswordReturnButton addTarget:self action:@selector(pressRetrievePasswordReturnButton) forControlEvents:UIControlEventTouchUpInside];
    [_retrievePasswordView.verificationCodeButton addTarget:self action:@selector(pressVerificationCodeButton) forControlEvents:UIControlEventTouchUpInside];
    [_retrievePasswordView.retrievePasswordNextButton addTarget:self action:@selector(pressRetrievePasswordNextButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_retrievePasswordView];
}

- (void)pressRetrievePasswordReturnButton {
    [self dismissViewControllerAnimated:YES completion:nil];
}

//验证码倒计时
- (void)pressVerificationCodeButton {
    self.retrievePasswordView.countTimerNumberDown = 60;
    self.retrievePasswordView.verificationCodeButton.userInteractionEnabled = NO;
    [self.retrievePasswordView.verificationCodeButton setTitle:[NSString stringWithFormat:@"%lds后重发",self.retrievePasswordView.countTimerNumberDown] forState:UIControlStateNormal];
    self.retrievePasswordView.verificationCodeButton.backgroundColor = [UIColor colorWithWhite:0.5 alpha:1];
    self.retrievePasswordView.countDownTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timeFireMethod) userInfo:nil repeats:YES];
}

-(void)timeFireMethod {
    //倒计时-1
    self.retrievePasswordView.countTimerNumberDown--; //修改倒计时标签现实内容
    [self.retrievePasswordView.verificationCodeButton setTitle:[NSString stringWithFormat:@"%lds后重发",self.retrievePasswordView.countTimerNumberDown] forState:UIControlStateNormal]; //当倒计时到0时，做需要的操作，比如验证码过期不能提交
    if (self.retrievePasswordView.countTimerNumberDown == 0){
        [self.retrievePasswordView.countDownTimer invalidate];
        [self.retrievePasswordView.verificationCodeButton setTitle:@"重新获取" forState:UIControlStateNormal];
        self.retrievePasswordView.countTimerNumberDown = 60;
        self.retrievePasswordView.verificationCodeButton.userInteractionEnabled = YES;
        self.retrievePasswordView.verificationCodeButton.backgroundColor = [UIColor colorWithRed:0 green:0.38 blue:0.9 alpha:0.95];
    }
    
}

- (void)pressRetrievePasswordNextButton {
    [self.retrievePasswordView addChangePasswordView];
    self.retrievePasswordView.retrievePasswordNextButton.userInteractionEnabled = NO;
    [UIView animateWithDuration:0.5 animations: ^{
        self.retrievePasswordView.changePasswordView.frame = CGRectMake(SIZE_WIDTH * 0.05, SIZE_HEIGHT * 0.38, SIZE_WIDTH * 0.9, SIZE_HEIGHT * 0.62);
    }];
    [_retrievePasswordView.retrievePasswordCompleteButton addTarget:self action:@selector(pressRetrievePasswordCompleteButton) forControlEvents:UIControlEventTouchUpInside];
}

 - (void) pressRetrievePasswordCompleteButton {
     [self dismissViewControllerAnimated:YES completion:nil];
     
 }
@end
