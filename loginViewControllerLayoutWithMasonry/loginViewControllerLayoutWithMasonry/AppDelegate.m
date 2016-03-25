//
//  AppDelegate.m
//  loginViewControllerLayoutWithMasonry
//
//  Created by HqLee on 16/3/25.
//  Copyright © 2016年 HqLee. All rights reserved.
//

#import "AppDelegate.h"
#import "LoginViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    self.window.backgroundColor = [UIColor whiteColor];
    
    LoginViewController *loginVc = [[LoginViewController alloc] init];
    
    self.window.rootViewController = loginVc;
    
    [self.window makeKeyAndVisible];
    
    return YES;
}
@end
