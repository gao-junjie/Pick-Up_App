//
//  AccountManagementView.h
//  PUK
//
//  Created by mac on 2022/3/11.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface AccountManagementView : UIView <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView* pickerSettingTableView;
@property (nonatomic, strong) UILabel* pickerNameLabel;
@property (nonatomic ,strong) UIImageView* pickerPhotoImage;
@property (nonatomic ,strong) NSArray* settingArray;

@end

NS_ASSUME_NONNULL_END
