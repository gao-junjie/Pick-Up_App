//
//  EventHandlingViewController.m
//  PUK
//
//  Created by 浪极 on 2022/1/22.
//

#import "EventHandlingViewController.h"
#import "Masonry.h"
#define SIZE_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SIZE_HEIGHT ([UIScreen mainScreen].bounds.size.height)

@interface EventHandlingViewController ()

@end

@implementation EventHandlingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notificationSelectedKidNameListTableViewCell:) name:@"SelectedKidNameListTableViewCell" object:nil];
    _eventHandlingView = [[EventHandlingView alloc] initWithFrame:self.view.frame];
    [_eventHandlingView.kidNameListButton addTarget:self action:@selector(pressKidNameListButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_eventHandlingView];
}

- (void)pressKidNameListButton {
    if (_eventHandlingView.kidNameListButton.selected == NO) {
        _eventHandlingView.kidNameListButton.selected = YES;
        _eventHandlingView.kidNameListTableView.scrollEnabled = YES;
        [_eventHandlingView.kidNameListTableView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(@(SIZE_HEIGHT * 0.05 * 5));
        }];
    } else {
        _eventHandlingView.kidNameListButton.selected = NO;
        _eventHandlingView.kidNameListTableView.scrollEnabled = NO;
        [_eventHandlingView.kidNameListTableView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(@(SIZE_HEIGHT * 0.05));
        }];
    }
}

- (void)notificationSelectedKidNameListTableViewCell:(NSNotification *)text {
    _eventHandlingView.kidNameListButton.selected = NO;
    _eventHandlingView.kidNameListTableView.scrollEnabled = NO;
    [_eventHandlingView.kidNameListTableView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@(SIZE_HEIGHT * 0.05));
    }];
    [_eventHandlingView.kidNameListTableView scrollToRowAtIndexPath:text.object atScrollPosition:UITableViewScrollPositionTop animated:NO];
    [_eventHandlingView.mainKidTableView reloadData];
    
 }

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"SelectedKidNameListTableViewCell" object:self];
}


@end
