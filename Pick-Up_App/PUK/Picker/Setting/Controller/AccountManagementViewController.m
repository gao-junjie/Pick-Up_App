//
//  AccountManagementViewController.m
//  PUK
//
//  Created by mac on 2022/3/11.
//

#import "AccountManagementViewController.h"

@interface AccountManagementViewController ()

@end

@implementation AccountManagementViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"帐号管理";
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    _accountManagementView = [[AccountManagementView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:_accountManagementView];
}



@end
