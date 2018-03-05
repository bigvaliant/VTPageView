//
//  AppDelegate.m
//  VTPageView
//
//  Created by  valiant on 2018/3/5.
//  Copyright © 2018年 minvia1990. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "VTPageViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    ViewController *v1 = [ViewController new];
    v1.view.backgroundColor = [UIColor redColor];
    ViewController *v2 = [ViewController new];
    v2.view.backgroundColor = [UIColor blueColor];
    ViewController *v3 = [ViewController new];
    v3.view.backgroundColor = [UIColor purpleColor];
    ViewController *v4 = [ViewController new];
    v4.view.backgroundColor = [UIColor yellowColor];
    
    
    NSArray *images = [NSArray arrayWithObjects:
                       [UIImage imageNamed:@"page_sj"],
                       [UIImage imageNamed:@"page_nz"],
                       [UIImage imageNamed:@"page_djr"],
                       [UIImage imageNamed:@"page_sm"],
                       nil];
    NSArray *viewControllers = @[v1, v2, v3, v4];
    VTPageViewController* mainVC = [[VTPageViewController alloc]
                                    initWithCustom:viewControllers
                                    pageDotImages:images
                                    pageDotWidth:25.0f
                                    pageDotMargin:15.0f
                                ];
    
    [self.window setRootViewController:mainVC];
    [self.window makeKeyAndVisible];
    
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
