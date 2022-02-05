//
//  ParentSettingViewController.m
//  PUK
//
//  Created by 浪极 on 2022/1/22.
//

#import "ParentSettingViewController.h"

@interface ParentSettingViewController ()

@end

@implementation ParentSettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _parentSettingView = [[ParentSettingView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:_parentSettingView];
}


@end
