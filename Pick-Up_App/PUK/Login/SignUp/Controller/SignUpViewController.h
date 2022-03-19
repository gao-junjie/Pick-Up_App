//
//  SignUpViewController.h
//  PUK
//
//  Created by 浪极 on 2022/1/22.
//

#import <UIKit/UIKit.h>
#import "SignUpView.h"
#import "SignInViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface SignUpViewController : UIViewController <UITextFieldDelegate>

@property (nonatomic, strong) SignUpView *signUpView;
@property (nonatomic, strong) SignInViewController *signInViewController;
@property (nonatomic, strong) NSString* phoneValidationString;
@property (nonatomic, strong) NSString* phoneNumberString;
@property (nonatomic, strong) NSString* phoneJudgeValidationString;

@end

NS_ASSUME_NONNULL_END
