//
//  AccountManagementViewController.h
//  PUK
//
//  Created by mac on 2022/3/11.
//

#import <UIKit/UIKit.h>
#import "AccountManagementView.h"
#import "Masonry.h"
#define SIZE_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SIZE_HEIGHT ([UIScreen mainScreen].bounds.size.height)

NS_ASSUME_NONNULL_BEGIN

@interface AccountManagementViewController : UIViewController
@property (nonatomic, strong) AccountManagementView* accountManagementView;

@end

NS_ASSUME_NONNULL_END
