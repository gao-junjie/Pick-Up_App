//
//  AccountManagementView.m
//  PUK
//
//  Created by mac on 2022/3/11.
//

#import "AccountManagementView.h"
#import "Masonry.h"
#define SIZE_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SIZE_HEIGHT ([UIScreen mainScreen].bounds.size.height)

@implementation AccountManagementView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    self.backgroundColor = [UIColor whiteColor];
    
    _settingArray = @[@"更换绑定手机号", @"修改密码", @"注销账号", @"退出登录"];
    
    _pickerSettingTableView = [[UITableView alloc] init];
    _pickerSettingTableView.backgroundColor = [UIColor grayColor];
    _pickerSettingTableView.delegate = self;
    _pickerSettingTableView.dataSource = self;
    _pickerSettingTableView.scrollEnabled = NO;
    [_pickerSettingTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"SettingCell"];
    [_pickerSettingTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"normal"];
    [self addSubview:_pickerSettingTableView];
    [_pickerSettingTableView mas_makeConstraints:^(MASConstraintMaker* make) {
        make.top.equalTo(self.mas_top).offset(0);
        make.height.equalTo(@(SIZE_HEIGHT * 0.28));
        make.left.equalTo(self.mas_left).offset(0);
        make.width.equalTo(@(SIZE_WIDTH));
    }];
    return self;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return SIZE_HEIGHT * 0.07;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    UITableViewCell* normalCell = [_pickerSettingTableView dequeueReusableCellWithIdentifier:@"normal" forIndexPath:indexPath];
    normalCell.textLabel.text = _settingArray[indexPath.row];
    return normalCell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}
@end
