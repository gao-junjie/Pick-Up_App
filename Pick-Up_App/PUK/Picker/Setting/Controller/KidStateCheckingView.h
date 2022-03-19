//
//  KidStateCheckingView.h
//  PUK
//
//  Created by mac on 2022/3/12.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface KidStateCheckingView : UIView <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView* mainKidTableView;
@property (nonatomic, strong) UITableView* kidNameListTableView;
@property (nonatomic, strong) UIButton* kidNameListButton;
@property (nonatomic, strong) UILabel* mainEmotionLabel;
@property (nonatomic, strong) UILabel* firstPickerNameTipLabel;
@property (nonatomic, strong) UILabel* secondPickerNameTipLabel;
@property (nonatomic, strong) NSArray* kidNameListArray;
@property (nonatomic, strong) NSArray* kidNegativeEmotionListArray;
@property (nonatomic, strong) NSArray* kidPositiveEmotionListArray;
@property (nonatomic, strong) NSArray* pickerNameArray;
@property (nonatomic, strong) NSArray* pickerLocationArray;
@property (nonatomic, assign) NSUInteger selectedArrayNumber;
@end

NS_ASSUME_NONNULL_END
