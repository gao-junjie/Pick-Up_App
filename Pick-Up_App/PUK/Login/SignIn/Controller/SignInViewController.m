//
//  SignInViewController.m
//  PUK
//
//  Created by 浪极 on 2022/1/22.
//

#import "SignInViewController.h"
#import "SignUpViewController.h"

#import "EventCheckingViewController.h"
#import "EventHandlingViewController.h"
#import "PickerSettingViewController.h"

#import "KidStateCheckingViewController.h"
#import "EditingMenuViewController.h"
#import "SchoolInformationViewController.h"
#import "ParentSettingViewController.h"

#import "KidStateEditingViewController.h"
#import "EventConfirmViewController.h"
#import "SchoolInformationEditingViewController.h"
#import "TeacherSettingViewController.h"

#import "Masonry.h"
#define SIZE_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SIZE_HEIGHT ([UIScreen mainScreen].bounds.size.height)
@interface SignInViewController ()

@end

@implementation SignInViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _signInView = [[SignInView alloc] initWithFrame:self.view.frame];
    [_signInView.registerButton addTarget:self action:@selector(pressRegisterButton) forControlEvents:UIControlEventTouchUpInside];
    [_signInView.recoverPasswordButton addTarget:self action:@selector(pressRecoverPasswordButton) forControlEvents:UIControlEventTouchUpInside];
    [_signInView.tapGesturRecognizer addTarget:self action:@selector(pressLoginButton:)];
    _signInView.loginButtonTimer = [NSTimer scheduledTimerWithTimeInterval:8 target:self selector:@selector(loginButtonTimerAutoRepeat) userInfo:nil repeats:YES];
    _signInView.loginArrowTimer = [NSTimer scheduledTimerWithTimeInterval:4 target:self selector:@selector(loginArrowTimerAutoRepeat) userInfo:nil repeats:YES];
    //_loginTimer = [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(loginAnimation) userInfo:nil repeats:NO];
    [self.view addSubview:_signInView];
    [self loginAnimation];

}

- (void)loginAnimation {
    [UIView animateWithDuration:0.5 animations: ^{
        [self.signInView.usernameLabel mas_updateConstraints:^(MASConstraintMaker* make) {
            make.centerX.equalTo(self.signInView.mas_centerX).offset(0);
        }];
        [self.signInView.usernameTextField mas_updateConstraints:^(MASConstraintMaker* make) {
            make.centerX.equalTo(self.signInView.mas_centerX).offset(0);
        }];
        [self.signInView.usernameLabel.superview layoutIfNeeded];
        [self.signInView.usernameTextField.superview layoutIfNeeded];
    }];
    
    [UIView animateWithDuration:0.5 delay:0.2 options: UIViewAnimationOptionCurveEaseInOut animations: ^{
        [self.signInView.passwordLabel mas_updateConstraints:^(MASConstraintMaker* make) {
            make.centerX.equalTo(self.signInView.mas_centerX).offset(0);
        }];
        [self.signInView.passwordTextField mas_updateConstraints:^(MASConstraintMaker* make) {
            make.centerX.equalTo(self.signInView.mas_centerX).offset(0);
        }];
        [self.signInView.passwordLabel.superview layoutIfNeeded];
        [self.signInView.passwordTextField.superview layoutIfNeeded];
    } completion: ^(BOOL finished) {
        [UIView animateWithDuration:1 animations: ^{
            [self.signInView.loginArrowImageView mas_updateConstraints:^(MASConstraintMaker* make) {
                make.centerX.equalTo(self.signInView.mas_centerX).offset(0);
            }];
            [self.signInView.loginArrowImageView.superview layoutIfNeeded];
        }];
        [UIView animateWithDuration:2.5 animations: ^{
            self.signInView.loginButtonImageView.alpha = 0.95;
        }];
    }];
}



- (void)pressRegisterButton {

    _signUpViewController = [[SignUpViewController alloc] init];
    _signUpViewController.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:_signUpViewController animated:YES completion:nil];
}

- (void)pressRecoverPasswordButton {
    _retrievePasswordViewController = [[RetrievePasswordViewController alloc] init];
    _retrievePasswordViewController.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:_retrievePasswordViewController animated:YES completion:nil];
}

- (void)pressLoginButton:(UITapGestureRecognizer *)gesture {
    [UIView animateWithDuration:0.5 animations:^{
        if (self.signInView.loginArrowImageView.hidden == NO) {
            [self.signInView.loginArrowImageView mas_updateConstraints:^(MASConstraintMaker* make) {
                make.centerX.equalTo(self.signInView.mas_centerX).offset(SIZE_WIDTH * 0.6);
            }];
        }
        [self.signInView.loginArrowImageView.superview layoutIfNeeded];
    } completion:^(BOOL finished) {
        //释放定时器
        [self.signInView.loginArrowTimer invalidate];
        [self.signInView.loginButtonTimer invalidate];
        if ([self.signInView.usernameTextField.text isEqualToString:@"1"]) {
            
            EventHandlingViewController *pickerEventHandlingViewController = [[EventHandlingViewController alloc] init];
            EventCheckingViewController *pickerEventCheckingViewController = [[EventCheckingViewController alloc] init];
            PickerSettingViewController *pickerSettingViewController = [[PickerSettingViewController alloc] init];

            UINavigationController *handle = [[UINavigationController alloc] initWithRootViewController:pickerEventHandlingViewController];
            UINavigationController *check = [[UINavigationController alloc] initWithRootViewController:pickerEventCheckingViewController];
            UINavigationController *setting = [[UINavigationController alloc] initWithRootViewController:pickerSettingViewController];
            
            handle.title = @"处理接送事件";
            check.title = @"查看接送事件";
            setting.title = @"我的";
            handle.navigationBarHidden = YES;
            check.navigationBarHidden = YES;
            setting.navigationBarHidden = NO;

            NSArray* controllerArray = [NSArray arrayWithObjects:handle, check, setting, nil];
            UITabBarController* tabBarController = [[UITabBarController alloc] init];
            tabBarController.viewControllers = controllerArray;
            tabBarController.tabBar.tintColor = [UIColor colorWithRed:0.2 green:0.6 blue:0.9 alpha:1];
            tabBarController.tabBar.barTintColor = [UIColor whiteColor];
            tabBarController.tabBar.translucent = NO;
            
            UIWindow* window = [UIApplication sharedApplication].windows[0];

//            [UIView transitionFromView:self.signInView toView:tabBarController.view duration:0.5f options:UIViewAnimationOptionTransitionCrossDissolve completion:^(BOOL finished) {
                    window.rootViewController = tabBarController;
           // }];
        } else if ([self.signInView.usernameTextField.text isEqualToString:@"2"]) {
            KidStateCheckingViewController *kidStateViewController = [[KidStateCheckingViewController alloc] init];
            EditingMenuViewController *editingMenuViewController = [[EditingMenuViewController alloc] init];
            SchoolInformationViewController *schoolInformationViewController = [[SchoolInformationViewController alloc] init];
            ParentSettingViewController *parentSettingViewController = [[ParentSettingViewController alloc] init];
            
            UINavigationController *kidState = [[UINavigationController alloc] initWithRootViewController:kidStateViewController];
            UINavigationController *eventEditing = [[UINavigationController alloc] initWithRootViewController:editingMenuViewController];
            UINavigationController *schoolInformation = [[UINavigationController alloc] initWithRootViewController:schoolInformationViewController];
            UINavigationController *setting = [[UINavigationController alloc] initWithRootViewController:parentSettingViewController];
            
            kidState.title = @"孩子当前状态";
            eventEditing.title = @"编辑接送事件";
            schoolInformation.title = @"学校信息";
            setting.title = @"我的";
            
            kidState.navigationBar.hidden = YES;
            eventEditing.navigationBar.hidden = YES;
            schoolInformation.navigationBar.hidden = YES;
            setting.navigationBar.hidden = NO;
            
            NSArray* controllerArray = [NSArray arrayWithObjects:kidState, eventEditing, schoolInformation, setting, nil];
            UITabBarController* tabBarController = [[UITabBarController alloc] init];
            tabBarController.viewControllers = controllerArray;
            tabBarController.tabBar.tintColor = [UIColor colorWithRed:0.7 green:0.5 blue:0.2 alpha:1];
            tabBarController.tabBar.barTintColor = [UIColor whiteColor];
            tabBarController.tabBar.translucent = NO;
            
            UIWindow* window = [UIApplication sharedApplication].windows[0];
//            [UIView transitionFromView:self.signInView toView:tabBarController.view duration:0.5f options:UIViewAnimationOptionTransitionCrossDissolve completion:^(BOOL finished) {
                    window.rootViewController = tabBarController;
//            }];
            
        } else if ([self.signInView.usernameTextField.text isEqualToString:@"3"]) {
            KidStateEditingViewController *kidStateEditingViewController = [[KidStateEditingViewController alloc] init];
            EventConfirmViewController *eventConfirmViewController = [[EventConfirmViewController alloc] init];
            SchoolInformationEditingViewController *schoolInformationEditingViewController = [[SchoolInformationEditingViewController alloc] init];
            TeacherSettingViewController *teacherSettingViewController = [[TeacherSettingViewController alloc] init];
            
            UINavigationController *stateEditing = [[UINavigationController alloc] initWithRootViewController:kidStateEditingViewController];
            UINavigationController *eventConfirm = [[UINavigationController alloc] initWithRootViewController:eventConfirmViewController];
            UINavigationController *information = [[UINavigationController alloc] initWithRootViewController:schoolInformationEditingViewController];
            UINavigationController *setting = [[UINavigationController alloc] initWithRootViewController:teacherSettingViewController];
            
            stateEditing.title = @"编辑孩子状态";
            eventConfirm.title = @"管理接送事件";
            information.title = @"编辑学校信息";
            setting.title = @"我的";
            
            eventConfirm.navigationBar.hidden = YES;
            information.navigationBar.hidden = YES;
            setting.navigationBar.hidden = YES;
            
            NSArray* controllerArray = [NSArray arrayWithObjects:setting, eventConfirm, information, setting, nil];
            UITabBarController* tabBarController = [[UITabBarController alloc] init];
            tabBarController.viewControllers = controllerArray;
            tabBarController.tabBar.tintColor = [UIColor colorWithRed:0.2 green:0.6 blue:0.9 alpha:1];
            tabBarController.tabBar.barTintColor = [UIColor whiteColor];
            tabBarController.tabBar.translucent = YES;
            
            UIWindow* window = [UIApplication sharedApplication].windows[0];
            [UIView transitionFromView:self.signInView toView:tabBarController.view duration:0.5f options:UIViewAnimationOptionTransitionCrossDissolve completion:^(BOOL finished) {
                    window.rootViewController = tabBarController;
            }];
        }
    }];
}

- (void)loginButtonTimerAutoRepeat {
    
    [UIView animateWithDuration:4 animations:^{
        self.signInView.loginButtonImageView.backgroundColor = [UIColor colorWithRed:0 green:0.5 blue:0.6 alpha:0.3];
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:4 animations:^{
            self.signInView.loginButtonImageView.backgroundColor = [UIColor colorWithRed:0 green:0.38 blue:0.9 alpha:0.95];
        }];
    }];

}

- (void)loginArrowTimerAutoRepeat {
    [UIView animateWithDuration:2 animations:^{
        //宽高缩放比；
        self.signInView.loginArrowImageView.transform = CGAffineTransformMakeScale(0.5,0.5);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:2 animations:^{
            //宽高缩放比；
            self.signInView.loginArrowImageView.transform = CGAffineTransformIdentity;
        }];
    }];
}

@end
