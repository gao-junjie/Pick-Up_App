//
//  SignInViewController.h
//  PUK
//
//  Created by 浪极 on 2022/1/22.
//

#import <UIKit/UIKit.h>
#import "SignInView.h"
#import "RetrievePasswordViewController.h"
@class SignUpViewController;

NS_ASSUME_NONNULL_BEGIN

@interface SignInViewController : UIViewController

@property (nonatomic, strong) SignInView *signInView;
@property (nonatomic, strong) SignUpViewController *signUpViewController;
@property (nonatomic, strong) RetrievePasswordViewController *retrievePasswordViewController;
@property (nonatomic, retain) NSTimer* loginTimer;
@end

NS_ASSUME_NONNULL_END
