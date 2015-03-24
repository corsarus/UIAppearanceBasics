//
//  AppDelegate.m
//  UIAppearanceBasics
//
//  Created by Catalin (iMac) on 15/03/2015.
//  Copyright (c) 2015 corsarus. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    [self updateAppearanceForBarItems];
    
    [self updateAppearanceForLabel];
    
    [self updateAppearanceForSlider];
    
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

#pragma mark - UIAppearance customizations

- (void)updateAppearanceForBarItems
{
 
    NSMutableDictionary *barItemAttributes = [[NSMutableDictionary alloc] init];
    [barItemAttributes setObject:[UIFont fontWithName:@"Thonburi" size:16.0] forKey:NSFontAttributeName];
    [barItemAttributes setObject:@(2.0) forKey:NSKernAttributeName];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setAlignment:NSTextAlignmentCenter];
    [barItemAttributes setObject:paragraphStyle forKey:NSParagraphStyleAttributeName];

    // Set the text color to black in tab bar items
    NSMutableDictionary *tabBarItemTextAttributes = [barItemAttributes mutableCopy];
    [tabBarItemTextAttributes setObject:[UIColor blackColor] forKey:NSForegroundColorAttributeName];
    [[UITabBarItem appearance] setTitleTextAttributes:tabBarItemTextAttributes forState:UIControlStateNormal];

    // Set the text color to black in navigation bar items
    NSMutableDictionary *navBarItemTextAttributes = [barItemAttributes mutableCopy];
    [navBarItemTextAttributes setObject:[UIColor whiteColor] forKey:NSForegroundColorAttributeName];
    [[UIBarButtonItem appearance] setTitleTextAttributes:navBarItemTextAttributes forState:UIControlStateNormal];
    
}

- (void)updateAppearanceForLabel
{
    [[NSClassFromString(@"ScreenTitleLabel") appearanceWhenContainedIn:[UINavigationBar class], nil] setBackgroundColor:[UIColor yellowColor]];
}

- (void)updateAppearanceForSlider
{
    [[UISlider appearance] setMinimumTrackTintColor:[UIColor blueColor]];
    [[UISlider appearance] setMaximumTrackTintColor:[UIColor redColor]];
}

@end
