//
//  AppDelegate.m
//  PUK
//
//  Created by mac on 2021/12/31.
//

#import <AMapFoundationKit/AMapFoundationKit.h>
#import "AppDelegate.h"
#import "SignInViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //朱方元的key
    //[AMapServices sharedServices].apiKey = @"d3f9d18b24f42592c22b99e52d387557";
    //高俊杰的key
    [AMapServices sharedServices].apiKey = @"a83bec106108a3f73fc116a489f4a6f7";
    
    return YES;
}


#pragma mark - UISceneSession lifecycle


- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}


@end
