//
//  ParentSettingView.h
//  PUK
//
//  Created by mac on 2022/3/16.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ParentSettingView : UIView <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView* parentSettingTableView;
@property (nonatomic, strong) UILabel* parentNameLabel;
@property (nonatomic, strong) UIImageView* parentPhotoImage;
@property (nonatomic, strong) NSArray* settingArray;
@end

NS_ASSUME_NONNULL_END
