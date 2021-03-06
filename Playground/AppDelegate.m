//
//  AppDelegate.m
//  Playground
//
//  Created by Michael Vilabrera on 4/6/15.
//  Copyright (c) 2015 Giving Tree. All rights reserved.
//

#import "AppDelegate.h"
#import "RootViewController.h"

#import <RXCollections/RXCollection.h>

@interface AppDelegate ()

@property (nonatomic) RootViewController *rootViewController;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.rootViewController = [[RootViewController alloc] initWithNibName:nil bundle:nil];
    self.window.rootViewController = self.rootViewController;
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    NSArray *array = @[@1, @2, @3];
    
    // map (take values and transform them)
//    NSArray *mappedArray = [array rx_mapWithBlock:^id(id each) {
//        return @(pow([each integerValue], 2));
//    }];
//    
//    NSLog(@"array: %@\nmapped array: %@", array, mappedArray);
    
    // filter (take values and filter them)
//    NSArray *filteredArray = [array rx_filterWithBlock:^BOOL(id each) {
//        return ([each integerValue] % 2 == 0);
//    }];
//    
//    NSLog(@"array: %@\nfilteredarray: %@", array, filteredArray);
    
    // fold (take values and combine them)
    NSNumber *sum = [array rx_foldWithBlock:^id(id memo, id each) {
        return @([memo integerValue] + [each integerValue]);
    }];
    
    NSString *combine = [NSString stringWithFormat:@"%@",[[array rx_mapWithBlock:^id(id each) {
        return [each stringValue];
    }] rx_foldInitialValue:@"" block:^id(id memo, id each) {
        return [memo stringByAppendingString:each];
    }]];
    
    NSLog(@"array: %@\nsum: %@\ncombine: %@", array, sum, combine);
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
