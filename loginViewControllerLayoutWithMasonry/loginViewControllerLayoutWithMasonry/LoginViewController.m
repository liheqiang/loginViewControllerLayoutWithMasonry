//
//  LoginViewController.m
//  loginViewControllerLayoutWithMasonry
//
//  Created by HqLee on 16/3/25.
//  Copyright © 2016年 HqLee. All rights reserved.
//

#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self;

#import "LoginViewController.h"
#import "LoginView.h"
#import <Masonry.h>

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    LoginView *loginView = [[LoginView alloc]init];
    
    [self.view addSubview:loginView];
    
    WS(weakSelf)
    
    [loginView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.edges.equalTo(weakSelf.view).offset(0);
        
    }];
    
    NSLog(@"%@",NSStringFromCGRect(self.view.bounds));
}
@end
