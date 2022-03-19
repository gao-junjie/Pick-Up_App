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
    _phoneValidationString = @"no";
    
    _signUpView = [[SignUpView alloc] initWithFrame:self.view.frame];
    [_signUpView.signUpReturnButton addTarget:self action:@selector(pressSignUpReturnButton) forControlEvents:UIControlEventTouchUpInside];
    [_signUpView.signUpNextButton addTarget:self action:@selector(pressSignUpNextButton) forControlEvents:UIControlEventTouchUpInside];
    [_signUpView.verificationCodeButton addTarget:self action:@selector(pressVerificationCodeButton) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:_signUpView];
}


- (void)pressSignUpReturnButton {
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

//验证码倒计时
- (void)pressVerificationCodeButton {
    _phoneNumberString = _signUpView.phoneNumberTextField.text;
    [self toPostValidationNetWork];
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

//第一次点击下一步
- (void)pressSignUpNextButton {
    _phoneValidationString = _signUpView.validationTextField.text;
    [self toPostJudgeValidationNetwrok];
    
}

- (void)pressSignUpNextTwiceButton {

    if ((self.signUpView.selectPickerButton.selected == NO && self.signUpView.selectTeacherButton.selected == NO && self.signUpView.selectParentButton.selected == NO) || [self.signUpView.nameNextTextField.text isEqualToString:@""] || [self.signUpView.passwordNextTextField.text isEqualToString:@""]) {
        UIAlertController* boomAlert = [UIAlertController alertControllerWithTitle:@"警告" message:@"请完善注册信息" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *boomAction= [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action) {
        }];
        [boomAlert addAction:boomAction];
        [self presentViewController:boomAlert animated:YES completion:nil];
    } else {
        [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
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

//判断字符串是否是全中文
- (BOOL)deptNameInputShouldChinese {
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

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.signUpView.nameNextTextField resignFirstResponder];
    [self.signUpView.validationTextField resignFirstResponder];
    [self.signUpView.phoneNumberTextField resignFirstResponder];
    [self.signUpView.passwordNextTextField resignFirstResponder];
}

//检验短信验证码是否正确
- (void)judgeValidation:(NSString*)judge :(NSString*)phoneNumber {
    if ([judge isEqualToString:@"yes"] && [phoneNumber isEqualToString:_signUpView.phoneNumberTextField.text]) {
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
    } else {
        UIAlertController* boomAlert = [UIAlertController alertControllerWithTitle:@"警告" message:@"验证码错误" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *boomAction= [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action) {
            
        }];
        [boomAlert addAction:boomAction];
        [self presentViewController:boomAlert animated:YES completion:nil];
    }
}

- (void)toPostJudgeValidationNetwrok {
    //1.创建会话对象
    NSURLSession *session = [NSURLSession sharedSession];

        //2.根据会话对象创建task
        NSURL *url = [NSURL URLWithString:@"http://192.168.3.175:8080/judge"];
        
        //3.创建可变的请求对象
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
        
        //4.修改请求方法为POST
        request.HTTPMethod = @"POST";
        // 设置请求头类型 (因为发送给服务器的参数类型已经不是普通数据,而是JSON)
        [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        //5.设置请求体
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        parameters[@"validationString"] = _phoneValidationString;
        NSData *data = [NSJSONSerialization dataWithJSONObject:parameters options:NSJSONWritingPrettyPrinted error:nil];
        NSString *jsonString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        request.HTTPBody = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
        //request.HTTPBody = data;
    
        //6.根据会话对象创建一个Task(发送请求）
        /*
         第一个参数：请求对象
         第二个参数：completionHandler回调（请求完成【成功|失败】的回调）
         data：响应体信息（期望的数据）
         response：响应头信息，主要是对服务器端的描述
         error：错误信息，如果请求失败，则error有值
         */
        
        NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            if (!error) {
                //8.解析数据
                self.phoneJudgeValidationString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
                
                // 异步执行任务创建方法
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self judgeValidation:self.phoneJudgeValidationString :self.phoneNumberString];
                });
            } else {
                //NSLog(@"%@",error);
                //添加网络错误警告
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self addInternetWrongView];
                });
                
                
            }
        }];

        //7.执行任务
        [dataTask resume];
}

- (void)toPostValidationNetWork {
    //1.创建会话对象
        NSURLSession *session = [NSURLSession sharedSession];

        //2.根据会话对象创建task
        NSURL *url = [NSURL URLWithString:@"http://192.168.3.175:8080/phone"];
        
        //3.创建可变的请求对象
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
        
        //4.修改请求方法为POST
        request.HTTPMethod = @"POST";
        // 设置请求头类型 (因为发送给服务器的参数类型已经不是普通数据,而是JSON)
        [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        //5.设置请求体
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        parameters[@"userPhoneNumber"] = _signUpView.phoneNumberTextField.text;
        NSData *data = [NSJSONSerialization dataWithJSONObject:parameters options:NSJSONWritingPrettyPrinted error:nil];
        NSString *jsonString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        request.HTTPBody = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    
        //6.根据会话对象创建一个Task(发送请求）
        /*
         第一个参数：请求对象
         第二个参数：completionHandler回调（请求完成【成功|失败】的回调）
         data：响应体信息（期望的数据）
         response：响应头信息，主要是对服务器端的描述
         error：错误信息，如果请求失败，则error有值
         */
        NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            if (!error) {
                //8.解析数据
                //NSLog(@"%@",dict);
            } else {
                //NSLog(@"%@",error);
                //添加网络错误警告
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self addInternetWrongView];
                });
            }
        }];

        //7.执行任务
        [dataTask resume];
}

- (void)addInternetWrongView {
    NSLog(@"网络错误");
    UIAlertController* boomAlert = [UIAlertController alertControllerWithTitle:@"警告" message:@"网络错误" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *boomAction= [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action) {
        
    }];
    [boomAlert addAction:boomAction];
    [self presentViewController:boomAlert animated:YES completion:nil];
}

@end
