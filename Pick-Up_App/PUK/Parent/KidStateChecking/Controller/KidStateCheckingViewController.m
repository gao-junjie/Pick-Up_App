//
//  KidStateCheckingViewController.m
//  PUK
//
//  Created by 浪极 on 2022/1/22.
//

#import "KidStateCheckingViewController.h"
#import "Masonry.h"
#define SIZE_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SIZE_HEIGHT ([UIScreen mainScreen].bounds.size.height)

@interface KidStateCheckingViewController ()

@end

@implementation KidStateCheckingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notificationSelectedParentKidNameListTableViewCell:) name:@"SelectedParentKidNameListTableViewCell" object:nil];
    
    _kidStateCheckingView = [[KidStateCheckingView alloc] initWithFrame:self.view.frame];
    [_kidStateCheckingView.kidNameListButton addTarget:self action:@selector(pressKidNameListButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_kidStateCheckingView];
}

- (void)pressKidNameListButton {
    if (_kidStateCheckingView.kidNameListButton.selected == NO) {
        _kidStateCheckingView.kidNameListButton.selected = YES;
        _kidStateCheckingView.kidNameListTableView.scrollEnabled = YES;
        [_kidStateCheckingView.kidNameListTableView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(@(SIZE_HEIGHT * 0.05 * 5));
        }];
    } else {
        _kidStateCheckingView.kidNameListButton.selected = NO;
        _kidStateCheckingView.kidNameListTableView.scrollEnabled = NO;
        [_kidStateCheckingView.kidNameListTableView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(@(SIZE_HEIGHT * 0.05));
        }];
    }
}

- (void)notificationSelectedParentKidNameListTableViewCell:(NSNotification *)text {
    _kidStateCheckingView.kidNameListButton.selected = NO;
    _kidStateCheckingView.kidNameListTableView.scrollEnabled = NO;
    [_kidStateCheckingView.kidNameListTableView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@(SIZE_HEIGHT * 0.05));
    }];
    [UIView animateWithDuration:0 animations:^{
        [self->_kidStateCheckingView.kidNameListTableView layoutIfNeeded];
    }];
    [_kidStateCheckingView.kidNameListTableView scrollToRowAtIndexPath:text.object atScrollPosition:UITableViewScrollPositionTop animated:NO];
    [_kidStateCheckingView.mainKidTableView reloadData];
    
 }

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"SelectedParentKidNameListTableViewCell" object:self];
}

@end
