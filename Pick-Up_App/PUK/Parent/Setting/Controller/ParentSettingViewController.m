//
//  ParentSettingViewController.m
//  PUK
//
//  Created by 浪极 on 2022/1/22.
//

#import "ParentSettingViewController.h"
#import "AccountManagementViewController.h"

@interface ParentSettingViewController ()

@end

@implementation ParentSettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.translucent = NO;
    self.navigationItem.title = @"我的";
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.7 green:0.5 blue:0.2 alpha:1];
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,nil]];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(parentSettingNotificationCenter:)name:@"ParentSetting" object:nil];
    
    _parentSettingView = [[ParentSettingView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:_parentSettingView];
}

- (void)parentSettingNotificationCenter:(NSNotification *)text {
    if ([text.object isEqualToString:@"0"]) {
        
    } else if ([text.object isEqualToString:@"1"]) {
        AccountManagementViewController* accountManagementViewController = [[AccountManagementViewController alloc] init];
        [self.navigationController pushViewController:accountManagementViewController animated:YES];
    } else if ([text.object isEqualToString:@"2"]) {

    } else if ([text.object isEqualToString:@"3"]) {

    }
    
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"PickerSetting" object:self];
}

@end
