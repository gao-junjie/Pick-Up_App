//
//  ParentSettingView.m
//  PUK
//
//  Created by mac on 2022/3/16.
//

#import "ParentSettingView.h"
#import "Masonry.h"
#define SIZE_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SIZE_HEIGHT ([UIScreen mainScreen].bounds.size.height)

@implementation ParentSettingView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    self.backgroundColor = [UIColor whiteColor];
    
    _settingArray = @[@"账号管理", @"隐私设置", @"联系客服", @"关于我们"];
    
    _parentSettingTableView = [[UITableView alloc] init];
    _parentSettingTableView.backgroundColor = [UIColor grayColor];
    _parentSettingTableView.delegate = self;
    _parentSettingTableView.dataSource = self;
    _parentSettingTableView.scrollEnabled = NO;
    [_parentSettingTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"SettingCell"];
    [_parentSettingTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"normal"];
    [self addSubview:_parentSettingTableView];
    [_parentSettingTableView mas_makeConstraints:^(MASConstraintMaker* make) {
        make.top.equalTo(self.mas_top).offset(0);
        make.height.equalTo(@(SIZE_HEIGHT* 0.41));
        make.left.equalTo(self.mas_left).offset(0);
        make.width.equalTo(@(SIZE_WIDTH));
    }];
    
    _parentNameLabel = [[UILabel alloc] init];
    _parentNameLabel.text = @"赵一";
    _parentNameLabel.font = [UIFont systemFontOfSize:33];
    _parentNameLabel.textColor = [UIColor blackColor];
    _parentNameLabel.textAlignment = NSTextAlignmentLeft;
    
    
    _parentPhotoImage = [[UIImageView alloc] init];
    _parentPhotoImage.image = [UIImage imageNamed:@"pic10.jpg"];
    [_parentPhotoImage.layer setMasksToBounds:YES];
    [_parentPhotoImage.layer setCornerRadius:8];
    
    return self;
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        return SIZE_HEIGHT* 0.13;
    }
    return SIZE_HEIGHT * 0.07;

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        UITableViewCell* SettingNormalCell = [_parentSettingTableView dequeueReusableCellWithIdentifier:@"SettingCell" forIndexPath:indexPath];
        [SettingNormalCell addSubview:_parentPhotoImage];
        [_parentPhotoImage mas_makeConstraints:^(MASConstraintMaker* make) {
            make.centerY.equalTo(SettingNormalCell.mas_centerY);
            make.height.equalTo(@(SIZE_WIDTH * 0.2));
            make.left.equalTo(@(SIZE_WIDTH * 0.04));
            make.width.equalTo(@(SIZE_WIDTH * 0.2));
        }];
        
        [SettingNormalCell addSubview:_parentNameLabel];
        [_parentNameLabel mas_makeConstraints:^(MASConstraintMaker* make) {
            make.centerY.equalTo(SettingNormalCell.mas_centerY).offset(0);
            make.height.equalTo(@(SIZE_WIDTH * 0.1));
            make.left.equalTo(self.parentPhotoImage.mas_right).offset(SIZE_WIDTH * 0.1);
            make.right.equalTo(SettingNormalCell.mas_right).offset(-SIZE_WIDTH * 0.04);
        }];
        return SettingNormalCell;
    }
    UITableViewCell* normalCell = [_parentSettingTableView dequeueReusableCellWithIdentifier:@"normal" forIndexPath:indexPath];
    normalCell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    normalCell.textLabel.text = _settingArray[indexPath.row-1];
    return normalCell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString* rowNumberString = [NSString stringWithFormat:@"%ld", indexPath.row];
    //创建通知
    NSNotification *notification =[NSNotification notificationWithName:@"ParentSetting" object:rowNumberString userInfo:nil];
    //通过通知中心发送通知
    [[NSNotificationCenter defaultCenter] postNotification:notification];
}

@end
