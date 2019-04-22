//
//  AppDelegate.m
//  RealmDemo
//
//  Created by Apple on 2019/4/20.
//  Copyright © 2019 lazyloading. All rights reserved.
//

#import "AppDelegate.h"
#import <RLMRealmConfiguration.h>
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    //查看默认数据库路径 通过官方的 Realm Brewser App可查看数据库结构
    //下载链接:https://itunes.apple.com/cn/app/realm-browser/id1007457278?mt=12
    RLMRealmConfiguration * config = [RLMRealmConfiguration defaultConfiguration];
    NSLog(@"%@",config.fileURL);
    //设置数据库版本 后期表字段变更 数据库升级可根据版本进行操作
    config.schemaVersion = 1;

    [RLMRealmConfiguration setDefaultConfiguration:config];
    [RLMRealm defaultRealm];
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
