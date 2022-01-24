//
//  PickerSettingView.h
//  PUK
//
//  Created by mac on 2022/1/24.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PickerSettingView : UIView <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView* pickerSettingTableView;
@property (nonatomic, strong) UILabel* pickerNameLabel;
@property (nonatomic ,strong) UIImageView* pickerPhotoImage;


@end

NS_ASSUME_NONNULL_END
