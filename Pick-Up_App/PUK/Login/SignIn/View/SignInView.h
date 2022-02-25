//
//  SignInView.h
//  PUK
//
//  Created by 浪极 on 2022/1/22.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SignInView : UIView <UITextFieldDelegate>

@property (nonatomic, strong) UITextField *usernameTextField;
@property (nonatomic, strong) UITextField *passwordTextField;
@property (nonatomic, strong) UILabel *usernameLabel;
@property (nonatomic, strong) UILabel *passwordLabel;
@property (nonatomic, strong) UIButton *recoverPasswordButton;
@property (nonatomic, strong) UIButton *registerButton;
@property (nonatomic, strong) UIImageView* backgroundImageView;
@property (nonatomic, strong) UIImageView* logoImageView;
@property (nonatomic, strong) UIImageView* logoTitleImageView;
@property (nonatomic, strong) UIImageView* loginButtonImageView;
@property (nonatomic, strong) UIImageView* loginArrowImageView;
@property (nonatomic, strong) UILabel* lineTipLabel;
@property (nonatomic, retain) NSTimer* loginButtonTimer;
@property (nonatomic, retain) NSTimer* loginArrowTimer;
@property (nonatomic, strong) UITapGestureRecognizer *tapGesturRecognizer;


@end

NS_ASSUME_NONNULL_END
