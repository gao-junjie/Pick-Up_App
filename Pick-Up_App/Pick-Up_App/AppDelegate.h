//
//  AppDelegate.h
//  Pick-Up_App
//
//  Created by 浪极 on 2022/1/12.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

