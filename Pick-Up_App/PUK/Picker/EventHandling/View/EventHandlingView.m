//
//  EventHandlingView.m
//  PUK
//
//  Created by 浪极 on 2022/1/22.
//

#import "EventHandlingView.h"
#import "Masonry.h"
#import "KidPhotoTableViewCell.h"
#import "PickerNameTableViewCell.h"

#define SIZE_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SIZE_HEIGHT ([UIScreen mainScreen].bounds.size.height)

@implementation EventHandlingView


- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    self.backgroundColor = [UIColor colorWithRed:0 green:0.5 blue:0.71 alpha:1];
    
    _kidNameListArray = @[@"赵一", @"钱二", @"孙三", @"李四", @"周五", @"吴六", @"郑七", @"王八"];
    _kidNegativeEmotionListArray = @[@"难过", @"痛苦"];
    _kidPositiveEmotionListArray = @[@"开心", @"成绩好"];
    _selectedArrayNumber = 0;
    
    _mainKidTableView = [[UITableView alloc] init];
    _mainKidTableView.backgroundColor = [UIColor whiteColor];
    _mainKidTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _mainKidTableView.delegate = self;
    _mainKidTableView.dataSource = self;
    _mainKidTableView.tag = 402;
    [_mainKidTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"normal"];
    [_mainKidTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"EmotionCell"];
    [_mainKidTableView registerClass:[KidPhotoTableViewCell class] forCellReuseIdentifier:@"KidPhoto"];
    [_mainKidTableView registerClass:[PickerNameTableViewCell class] forCellReuseIdentifier:@"KidPickerInfomation"];
    [self addSubview:_mainKidTableView];
    [_mainKidTableView mas_makeConstraints:^(MASConstraintMaker* make) {
        make.top.equalTo(self.mas_top).offset(SIZE_HEIGHT * 0.12);
        make.height.equalTo(@(SIZE_HEIGHT * 0.88));
        make.left.equalTo(self.mas_left).offset(0);
        make.width.equalTo(@(SIZE_WIDTH));
    }];
    
    _kidNameListTableView = [[UITableView alloc] init];
    _kidNameListTableView.backgroundColor = [UIColor whiteColor];
    _kidNameListTableView.delegate = self;
    _kidNameListTableView.dataSource = self;
    _kidNameListTableView.showsVerticalScrollIndicator = NO;
    _kidNameListTableView.bounces = NO;
    _kidNameListTableView.scrollEnabled = NO;
    _kidNameListTableView.tag = 401;
    [_kidNameListTableView.layer setMasksToBounds:YES];
    [_kidNameListTableView.layer setCornerRadius:10];
    [_kidNameListTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"KidNameListNormalCell"];
    [self addSubview:_kidNameListTableView];
    [_kidNameListTableView mas_makeConstraints:^(MASConstraintMaker* make) {
        make.top.equalTo(self.mas_top).offset(SIZE_HEIGHT * 0.06);
        make.height.equalTo(@(SIZE_HEIGHT * 0.05));
        make.left.equalTo(self.mas_left).offset(SIZE_WIDTH * 0.2);
        make.width.equalTo(@(SIZE_WIDTH * 0.6));
    }];
    
    _kidNameListButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_kidNameListButton setImage:[UIImage imageNamed:@"shouqi.png"] forState:UIControlStateNormal];
    [_kidNameListButton setImage:[UIImage imageNamed:@"zhankai.png"] forState:UIControlStateSelected];
    [self addSubview:_kidNameListButton];
    [_kidNameListButton mas_makeConstraints:^(MASConstraintMaker* make) {
        make.top.equalTo(_kidNameListTableView.mas_top).offset(SIZE_HEIGHT * 0.013);
        make.height.equalTo(@(SIZE_WIDTH * 0.06));
        make.right.equalTo(_kidNameListTableView.mas_right).offset(-SIZE_WIDTH * 0.02);
        make.width.equalTo(@(SIZE_WIDTH * 0.06));
    }];
    
    _mainEmotionLabel = [[UILabel alloc] init];
    _mainEmotionLabel.textColor = [UIColor redColor];
    _mainEmotionLabel.font = [UIFont systemFontOfSize:30];
    _mainEmotionLabel.textAlignment = NSTextAlignmentCenter;
    _mainEmotionLabel.numberOfLines = 0;
    
    _startLabel = [[UILabel alloc] init];
    _startLabel.text = @"出发";
    _startLabel.textAlignment = NSTextAlignmentCenter;
    _startLabel.hidden = NO;
    _startLabel.textColor = [UIColor grayColor];
    _startLabel.font = [UIFont systemFontOfSize:22];
    
    _movingSchoolLabel = [[UILabel alloc] init];
    _movingSchoolLabel.text = @"正在前往学校";
    _movingSchoolLabel.hidden = YES;
    _movingSchoolLabel.textAlignment = NSTextAlignmentCenter;
    _movingSchoolLabel.textColor = [UIColor grayColor];
    _movingSchoolLabel.font = [UIFont systemFontOfSize:22];
    
    _arriveSchoolLabel = [[UILabel alloc] init];
    _arriveSchoolLabel.text = @"已到达学校";
    _arriveSchoolLabel.hidden = YES;
    _arriveSchoolLabel.textAlignment = NSTextAlignmentCenter;
    _arriveSchoolLabel.textColor = [UIColor grayColor];
    _arriveSchoolLabel.font = [UIFont systemFontOfSize:22];
    
    _movingHomeLabel = [[UILabel alloc] init];
    _movingHomeLabel.text = @"正在前往最终位置";
    _movingHomeLabel.hidden = YES;
    _movingHomeLabel.textAlignment = NSTextAlignmentCenter;
    _movingHomeLabel.textColor = [UIColor grayColor];
    _movingHomeLabel.font = [UIFont systemFontOfSize:22];
    
    _arriveHomeLabel = [[UILabel alloc] init];
    _arriveHomeLabel.text = @"已到达最终位置";
    _arriveHomeLabel.hidden = YES;
    _arriveHomeLabel.textAlignment = NSTextAlignmentCenter;
    _arriveHomeLabel.textColor = [UIColor grayColor];
    _arriveHomeLabel.font = [UIFont systemFontOfSize:22];
    
    _firstLineLabel = [[UILabel alloc] init];
    _firstLineLabel.hidden = NO;
    _firstLineLabel.backgroundColor = [UIColor grayColor];
    
    _secondLineLabel = [[UILabel alloc] init];
    _secondLineLabel.hidden = YES;
    _secondLineLabel.backgroundColor = [UIColor grayColor];
    
    _scanQRCodesButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_scanQRCodesButton setImage:[UIImage imageNamed:@"daodiansaomaqueren.png"] forState:UIControlStateNormal];
    
    
    return self;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (tableView.tag == 401) {
        return _kidNameListArray.count;
    } else return 4;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (tableView.tag == 401) {
        return SIZE_HEIGHT * 0.05;
    }
    if (indexPath.row == 0) {
        return SIZE_HEIGHT * 0.25;
    } else if (indexPath.row == 1) {
        return SIZE_HEIGHT * 0.14;
    } else if (indexPath.row == 2) {
        return SIZE_HEIGHT * 0.18;
    } else {
        return SIZE_HEIGHT * 0.22;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (tableView.tag == 401) {
        UITableViewCell* KidNameListCell = [_kidNameListTableView dequeueReusableCellWithIdentifier:@"KidNameListNormalCell" forIndexPath:indexPath];
        KidNameListCell.textLabel.text = _kidNameListArray[indexPath.row];
        return KidNameListCell;
    }
    if (indexPath.row == 0) {
        KidPhotoTableViewCell* kidPhotoCell = [_mainKidTableView dequeueReusableCellWithIdentifier:@"KidPhoto" forIndexPath:indexPath];
        kidPhotoCell.backgroundColor = [UIColor colorWithWhite:0.95 alpha:1];
        kidPhotoCell.kidPhotoImageView.image = [UIImage imageNamed:@"pic10.jpg"];
        kidPhotoCell.schollNameLabel.text = @"学校：西安邮电小学";
        kidPhotoCell.gradeLabel.text = @"班级：三年二班";
        kidPhotoCell.kidNumberLabel.text = @"学号：1111111";
        kidPhotoCell.teacherNameLabel.text = @"班主任：xxx老师";
        kidPhotoCell.guardianNameLabel.text = @"监护人：xxx家长";
        
        return kidPhotoCell;
    } else if (indexPath.row == 1) {
        UITableViewCell* emotionCell = [_mainKidTableView dequeueReusableCellWithIdentifier:@"EmotionCell" forIndexPath:indexPath];
        emotionCell.selectionStyle = UITableViewCellSelectionStyleNone;
        [emotionCell.layer setMasksToBounds:YES];
        [emotionCell.layer setCornerRadius:10];
        _mainEmotionLabel.text = [NSString stringWithFormat:@"About\n%@", _kidNameListArray[_selectedArrayNumber]];
        [emotionCell addSubview:_mainEmotionLabel];
        [_mainEmotionLabel mas_makeConstraints:^(MASConstraintMaker* make) {
            make.top.equalTo(emotionCell.mas_top).offset(0);
            make.bottom.equalTo(emotionCell.mas_bottom).offset(0);
            make.left.equalTo(emotionCell.mas_left).offset(SIZE_WIDTH * 0.1);
            make.width.equalTo(@(SIZE_WIDTH * 0.2));
        }];

        for (int i = 0; i < 2; i++) {
            for (int j = 0; j < 2 && i * 2 + j < _kidNegativeEmotionListArray.count + _kidPositiveEmotionListArray.count; j++) {
                if (i*2 + j == _kidNegativeEmotionListArray.count + _kidPositiveEmotionListArray.count) {
                    break;
                }
                UILabel* emotionLabel = [[UILabel alloc] init];
                emotionLabel.textColor = [UIColor blackColor];
                emotionLabel.font = [UIFont systemFontOfSize:20];
                emotionLabel.textAlignment = NSTextAlignmentCenter;
                [emotionLabel.layer setMasksToBounds:YES];
                [emotionLabel.layer setCornerRadius:8];
                [emotionCell addSubview:emotionLabel];
                [emotionLabel mas_makeConstraints:^(MASConstraintMaker* make) {
                    if (i == 0) {
                        make.top.equalTo(emotionCell.mas_top).offset(SIZE_HEIGHT * 0.015);
                        make.bottom.equalTo(emotionCell.mas_centerY).offset(-SIZE_HEIGHT * 0.015);
                    } else {
                        make.top.equalTo(emotionCell.mas_centerY).offset(SIZE_HEIGHT * 0.015);
                        make.bottom.equalTo(emotionCell.mas_bottom).offset(-SIZE_HEIGHT * 0.015);
                    }
                    make.left.equalTo(_mainEmotionLabel.mas_right).offset(SIZE_WIDTH * 0.15 + (SIZE_WIDTH * 0.26 * j));
                    make.width.equalTo(@(SIZE_WIDTH * 0.2));
                }];

                if (i*2 + j < _kidNegativeEmotionListArray.count) {
                    emotionLabel.text = _kidNegativeEmotionListArray[i * 2 + j];
                    emotionLabel.backgroundColor = [UIColor blueColor];
                } else if (i*2 + j < _kidNegativeEmotionListArray.count + _kidPositiveEmotionListArray.count) {
                    emotionLabel.text = _kidPositiveEmotionListArray[i * 2 + j - _kidNegativeEmotionListArray.count];
                    emotionLabel.backgroundColor = [UIColor greenColor];
                }
            }
        }
        return emotionCell;
    } else if (indexPath.row == 2) {
        PickerNameTableViewCell* pickerInfomationCell = [_mainKidTableView dequeueReusableCellWithIdentifier:@"KidPickerInfomation" forIndexPath:indexPath];
        pickerInfomationCell.pickerLocationLabel.text = @"位置：子午大道";
        pickerInfomationCell.pickerNameLabel.text = @"Picker：接送者";
        pickerInfomationCell.pickerTimeLabel.text = @"到达时间：15:20";
        pickerInfomationCell.pickerPhotoImageView.image = [UIImage imageNamed:@"pic10.jpg"];

        return pickerInfomationCell;
    }

    UITableViewCell* pickerProcessCell = [_mainKidTableView dequeueReusableCellWithIdentifier:@"normal" forIndexPath:indexPath];
    pickerProcessCell.selectionStyle = UITableViewCellSelectionStyleNone;
    [pickerProcessCell addSubview:_startLabel];
    [_startLabel mas_makeConstraints:^(MASConstraintMaker* make) {
        make.top.equalTo(pickerProcessCell.mas_top).offset(SIZE_HEIGHT * 0.02);
        make.height.equalTo(@(SIZE_HEIGHT * 0.02));
        make.left.equalTo(pickerProcessCell.mas_left).offset(0);
        make.width.equalTo(@(SIZE_WIDTH * 0.5));
    }];
    
    [pickerProcessCell addSubview:_firstLineLabel];
    [_firstLineLabel mas_makeConstraints:^(MASConstraintMaker* make) {
        make.top.equalTo(_startLabel.mas_bottom).offset(SIZE_HEIGHT * 0.01);
        make.height.equalTo(@(SIZE_HEIGHT * 0.04));
        make.centerX.equalTo(_startLabel.mas_centerX).offset(0);
        make.width.equalTo(@(1));
    }];
    
    
    [pickerProcessCell addSubview:_movingSchoolLabel];
    [_movingSchoolLabel mas_makeConstraints:^(MASConstraintMaker* make) {
        make.top.equalTo(_firstLineLabel.mas_bottom).offset(SIZE_HEIGHT * 0.01);
        make.height.equalTo(@(SIZE_HEIGHT * 0.02));
        make.centerX.equalTo(_startLabel.mas_centerX).offset(0);
        make.width.equalTo(@(SIZE_WIDTH * 0.5));
    }];
    
    [pickerProcessCell addSubview:_arriveSchoolLabel];
    [_arriveSchoolLabel mas_makeConstraints:^(MASConstraintMaker* make) {
        make.top.equalTo(_firstLineLabel.mas_bottom).offset(SIZE_HEIGHT * 0.01);
        make.height.equalTo(@(SIZE_HEIGHT * 0.02));
        make.centerX.equalTo(_startLabel.mas_centerX).offset(0);
        make.width.equalTo(@(SIZE_WIDTH * 0.5));
    }];
    
    [pickerProcessCell addSubview:_secondLineLabel];
    [_secondLineLabel mas_makeConstraints:^(MASConstraintMaker* make) {
        make.top.equalTo(_movingSchoolLabel.mas_bottom).offset(SIZE_HEIGHT * 0.01);
        make.height.equalTo(@(SIZE_HEIGHT * 0.04));
        make.centerX.equalTo(_startLabel.mas_centerX).offset(0);
        make.width.equalTo(@(1));
    }];
    
    
    [pickerProcessCell addSubview:_movingHomeLabel];
    [_movingHomeLabel mas_makeConstraints:^(MASConstraintMaker* make) {
        make.top.equalTo(_secondLineLabel.mas_bottom).offset(SIZE_HEIGHT * 0.01);
        make.height.equalTo(@(SIZE_HEIGHT * 0.02));
        make.centerX.equalTo(_startLabel.mas_centerX).offset(0);
        make.width.equalTo(@(SIZE_WIDTH * 0.5));
    }];
    
    [pickerProcessCell addSubview:_arriveHomeLabel];
    [_arriveHomeLabel mas_makeConstraints:^(MASConstraintMaker* make) {
        make.top.equalTo(_secondLineLabel.mas_bottom).offset(SIZE_HEIGHT * 0.01);
        make.height.equalTo(@(SIZE_HEIGHT * 0.02));
        make.centerX.equalTo(_startLabel.mas_centerX).offset(0);
        make.width.equalTo(@(SIZE_WIDTH * 0.5));
    }];
    
    [pickerProcessCell addSubview:_scanQRCodesButton];
    [_scanQRCodesButton mas_makeConstraints:^(MASConstraintMaker* make) {
        make.centerY.equalTo(pickerProcessCell.mas_centerY).offset(0);
        make.height.equalTo(@(SIZE_HEIGHT * 0.15));
        make.right.equalTo(pickerProcessCell.mas_right).offset(-SIZE_WIDTH * 0.03);
        make.width.equalTo(@(SIZE_HEIGHT * 0.15));
    }];
    
    return pickerProcessCell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (tableView.tag == 401) {
        _selectedArrayNumber = indexPath.row;
        //创建通知
        NSNotification *notification = [NSNotification notificationWithName:@"SelectedKidNameListTableViewCell" object:indexPath userInfo:nil];
        //通过通知中心发送通知
        [[NSNotificationCenter defaultCenter] postNotification:notification];
        
//    } else if (indexPath.row == 3) {
//        [[NSNotificationCenter defaultCenter] postNotificationName:@"eventHandlingCell" object:nil];
    }
}

//判断正在接送的kid的状态
- (void)judgeKidsPickingState:(NSString*)state {
    if ([state isEqualToString:@"schooling"]) {
        _movingSchoolLabel.hidden = NO;
        _movingHomeLabel.hidden = YES;
        _arriveSchoolLabel.hidden = YES;
        _arriveHomeLabel.hidden = YES;
        _secondLineLabel.hidden = YES;
        _movingSchoolLabel.textColor = [UIColor redColor];
        _movingHomeLabel.textColor = [UIColor grayColor];
    } else if ([state isEqualToString:@"homing"]){
        _movingSchoolLabel.hidden = YES;
        _movingHomeLabel.hidden = NO;
        _arriveSchoolLabel.hidden = NO;
        _arriveHomeLabel.hidden = YES;
        _secondLineLabel.hidden = NO;
        _movingHomeLabel.textColor = [UIColor redColor];
        _movingSchoolLabel.textColor = [UIColor grayColor];
    } else if ([state isEqualToString:@"arrive"]){
        _movingSchoolLabel.hidden = YES;
        _movingHomeLabel.hidden = YES;
        _arriveSchoolLabel.hidden = NO;
        _arriveHomeLabel.hidden = NO;
        _secondLineLabel.hidden = NO;
        _movingHomeLabel.textColor = [UIColor grayColor];
        _movingSchoolLabel.textColor = [UIColor grayColor];
    }
}

@end
