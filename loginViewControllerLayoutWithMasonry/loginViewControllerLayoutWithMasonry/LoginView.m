//
//  LoginView.m
//  loginViewControllerLayoutWithMasonry
//
//  Created by HqLee on 16/3/25.
//  Copyright © 2016年 HqLee. All rights reserved.
//

#import "LoginView.h"
#import "LHQVerticalButton.h"
#import <Masonry.h>

@interface LoginView()
@property (nonatomic, weak) UIButton *cancleButton;
@property (nonatomic, weak) UIButton *registerButton;
@property (nonatomic, weak) UIView *loginInputView;
@property (nonatomic, weak) UIView *registerInputView;
@property (nonatomic, strong) MASConstraint *loginViewRightConstraint;
@end

@implementation LoginView

- (instancetype)init{
    return [self initWithFrame:CGRectZero];
}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self initView];
    }
    return self;
}

- (void)initView{
   
    //添加背景图片和顶部两个按钮
    [self setupBackgroundView];
    
    //添加底部分享按钮
    [self setupBottomShareView];
    //添加中部的登录输入框
    [self setupLoginputView];
    //添加注册界面
    [self setupRegisterInputView];
    
}

//添加背景图片和顶部两个按钮
- (void)setupBackgroundView{
    
    WS(weakSelf)
    
    UIImageView *backgroundView = [[UIImageView alloc] init];
    backgroundView.image = [UIImage imageNamed:@"login_register_background"];
    [self addSubview:backgroundView];
    [backgroundView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.edges.equalTo(weakSelf).offset(0);
        
    }];
    
    UIButton *cancleButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [cancleButton setImage:[UIImage imageNamed:@"login_close_icon"] forState:UIControlStateNormal];
    [self addSubview:cancleButton];
    self.cancleButton = cancleButton;
    [cancleButton mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.top.equalTo(weakSelf).offset(20);
        make.left.equalTo(weakSelf).offset(20);
        
    }];
    
    UIButton *registerButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [registerButton setTitle:@"注册账号" forState:UIControlStateNormal];
    [registerButton setTitle:@"已有账号？" forState:UIControlStateSelected];
    [registerButton addTarget:self action:@selector(registerButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [registerButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [registerButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    registerButton.titleLabel.font = [UIFont systemFontOfSize:15];
    [registerButton sizeToFit];
    [self addSubview:registerButton];
    self.registerButton = registerButton;
    [registerButton mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.top.equalTo(weakSelf).offset(20);
        make.right.equalTo(weakSelf).offset(-20);
        
    }];
    
    
}
//添加底部分享按钮
- (void)setupBottomShareView{
    
    WS(weakSelf)
    //添加底部分享按钮的容器
    UIView *shareView = [[UIView alloc] init];
    [self addSubview:shareView];
    [shareView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.equalTo(weakSelf).offset(0);
        make.right.equalTo(weakSelf).offset(0);
        make.bottom.equalTo(weakSelf).offset(0);
        make.height.mas_equalTo(130);
        
    }];
    
    //三个按钮，可以先确定中间按钮的约束，另外两个就可以参照中间的按钮来排布，这样写不好，因为不利于扩展，可是第一次使用masonry，也没有更好的解决办法，暂时这样吧
    
    //微博分享按钮
    LHQVerticalButton *sinaShareButton = [[LHQVerticalButton alloc] init];
    [sinaShareButton setImage:[UIImage imageNamed:@"login_sina_icon"] forState:UIControlStateNormal];
    [sinaShareButton setImage:[UIImage imageNamed:@"login_sina_icon_click"] forState:UIControlStateHighlighted];
    [sinaShareButton setTitle:@"微博登录" forState:UIControlStateNormal];
    [sinaShareButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    sinaShareButton.titleLabel.font = [UIFont systemFontOfSize:15];
    [shareView addSubview:sinaShareButton];
    [sinaShareButton mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.center.equalTo(shareView);
        make.bottom.equalTo(shareView).offset(-20);
        make.width.mas_equalTo(70);
        make.height.mas_equalTo(90);
    
    }];
    
    //QQ分享按钮
    LHQVerticalButton *qqShareButton = [[LHQVerticalButton alloc] init];
    [qqShareButton setImage:[UIImage imageNamed:@"login_QQ_icon"] forState:UIControlStateNormal];
    [qqShareButton setImage:[UIImage imageNamed:@"login_QQ_icon_click"] forState:UIControlStateHighlighted];
    [qqShareButton setTitle:@"QQ登录" forState:UIControlStateNormal];
    [qqShareButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    qqShareButton.titleLabel.font = [UIFont systemFontOfSize:15];
    [shareView addSubview:qqShareButton];
    [qqShareButton mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.equalTo(shareView).offset(20);
        make.bottom.equalTo(shareView).offset(-20);
        make.size.equalTo(sinaShareButton);
        
    }];
    
    //QQ分享按钮
    LHQVerticalButton *tecentShareButton = [[LHQVerticalButton alloc] init];
    [tecentShareButton setImage:[UIImage imageNamed:@"login_tecent_icon"] forState:UIControlStateNormal];
    [tecentShareButton setImage:[UIImage imageNamed:@"login_tecent_icon_click"] forState:UIControlStateHighlighted];
    [tecentShareButton setTitle:@"QQ登录" forState:UIControlStateNormal];
    [tecentShareButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    tecentShareButton.titleLabel.font = [UIFont systemFontOfSize:15];
    [shareView addSubview:tecentShareButton];
    [tecentShareButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.right.equalTo(shareView).offset(-20);
        make.bottom.equalTo(shareView).offset(-20);
        make.size.equalTo(sinaShareButton);
        
    }];
    
    //提示标签
    UILabel *tipLabel = [[UILabel alloc] init];
    tipLabel.textColor = [UIColor whiteColor];
    tipLabel.font = [UIFont systemFontOfSize:15];
    tipLabel.text = @"快速登录";
    [tipLabel sizeToFit];
    [shareView addSubview:tipLabel];
    
    [tipLabel mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.centerX.equalTo(shareView);
        make.top.equalTo(shareView).offset(0);
        
    }];
    
    //左边线
    UIImageView *leftLineView = [[UIImageView alloc] init];
    leftLineView.image = [UIImage imageNamed:@"login_register_left_line"];
    [shareView addSubview:leftLineView];
    
    [leftLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.equalTo(tipLabel).offset(0);
        make.right.equalTo(tipLabel.mas_left).offset(-7);
        
    }];
    
    //右边线
    UIImageView *rightLineView = [[UIImageView alloc] init];
    rightLineView.image = [UIImage imageNamed:@"login_register_right_line"];
    [shareView addSubview:rightLineView];
    
    [rightLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.equalTo(tipLabel).offset(0);
        make.left.equalTo(tipLabel.mas_right).offset(5);
        
    }];
}
//添加中部的登录输入框
- (void)setupLoginputView{
    
    WS(weakSelf)
    UIView *loginInputView = [[UIView alloc] init];
    [self addSubview:loginInputView];
    self.loginInputView = loginInputView;
    [loginInputView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        //这里左边的约束不要，因为要做动画平移出去
//        make.left.right.equalTo(weakSelf).offset(0);
        //改为右边约束和宽度
        weakSelf.loginViewRightConstraint = make.right.equalTo(weakSelf.mas_right);
        make.width.equalTo(weakSelf.mas_width);
        make.top.equalTo(weakSelf.registerButton.mas_bottom).offset(20);
        make.height.equalTo(@180);
    }];
    
    UIImageView *textFieldBg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"login_register_textfield_bg"]];
    [self addSubview:textFieldBg];
    [textFieldBg mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.centerX.equalTo(loginInputView.mas_centerX);
        make.top.equalTo(loginInputView).offset(0);
    }];
    
    UITextField *phoneNumberField = [[UITextField alloc] init];
    phoneNumberField.placeholder = @"手机号";
    [loginInputView addSubview:phoneNumberField];
    [phoneNumberField mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.equalTo(textFieldBg.mas_left).offset(5);
        make.width.equalTo(textFieldBg).offset(10);
        make.height.equalTo(textFieldBg.mas_height).multipliedBy(0.5);
        make.centerX.equalTo(textFieldBg.mas_centerX);
        make.top.equalTo(textFieldBg).offset(0);
    }];

    UITextField *passwordField = [[UITextField alloc] init];
    passwordField.placeholder = @"密码";
    [loginInputView addSubview:passwordField];
    [passwordField  mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.centerX.equalTo(phoneNumberField);
        make.top.equalTo(phoneNumberField.mas_bottom).offset(0);
        make.width.equalTo(phoneNumberField.mas_width);
        make.height.equalTo(phoneNumberField.mas_height);
    }];
    
    UIImage *norImage = [UIImage imageNamed:@"loginBtnBg"];
    UIImage *stretchNorImage = [norImage stretchableImageWithLeftCapWidth:norImage.size.width *0.5 topCapHeight:norImage.size.height *0.5];
    UIImage *hilImage = [UIImage imageNamed:@"loginBtnBgClick"];
    UIImage *strtchHilImage = [hilImage stretchableImageWithLeftCapWidth:hilImage.size.width *0.5 topCapHeight:hilImage.size.height *0.5];
    UIButton *loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [loginButton setTitle:@"登录" forState:UIControlStateNormal];
    [loginButton setBackgroundImage:stretchNorImage forState:UIControlStateNormal];
    [loginButton setBackgroundImage:strtchHilImage forState:UIControlStateNormal];
    [loginInputView addSubview:loginButton];
    [loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.top.equalTo(textFieldBg.mas_bottom).offset(10);
        make.left.equalTo(textFieldBg.mas_left);
        make.width.equalTo(textFieldBg);
        make.height.equalTo(passwordField);
    }];
    
    UIButton *forgetPasswordButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [forgetPasswordButton setTitle:@"忘记密码？" forState:UIControlStateNormal];
    forgetPasswordButton.titleLabel.font = [UIFont systemFontOfSize:15];
    [forgetPasswordButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [forgetPasswordButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    forgetPasswordButton.titleLabel.textAlignment = NSTextAlignmentRight;
    [loginInputView addSubview:forgetPasswordButton];
    [forgetPasswordButton mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.right.equalTo(loginButton);
        make.top.equalTo(loginButton.mas_bottom).offset(10);
        make.height.equalTo(@10);
    }];
    
}
//添加注册界面
- (void)setupRegisterInputView{
    
    WS(weakSelf)
    UIView *registerInputView = [[UIView alloc] init];
    [self addSubview:registerInputView];
    [registerInputView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(weakSelf.loginInputView.mas_right);
        make.top.equalTo(weakSelf.loginInputView.mas_top);
        make.size.equalTo(weakSelf.loginInputView);
    }];
    
    UIImageView *textFieldBg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"login_register_textfield_bg"]];
    [self addSubview:textFieldBg];
    [textFieldBg mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.equalTo(registerInputView.mas_centerX);
        make.top.equalTo(registerInputView).offset(0);
    }];
    
    UITextField *phoneNumberField = [[UITextField alloc] init];
    phoneNumberField.placeholder = @"手机号";
    [registerInputView addSubview:phoneNumberField];
    [phoneNumberField mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(textFieldBg.mas_left).offset(5);
        make.width.equalTo(textFieldBg).offset(10);
        make.height.equalTo(textFieldBg.mas_height).multipliedBy(0.5);
        make.centerX.equalTo(textFieldBg.mas_centerX);
        make.top.equalTo(textFieldBg).offset(0);
    }];
    
    UITextField *passwordField = [[UITextField alloc] init];
    passwordField.placeholder = @"密码";
    [registerInputView addSubview:passwordField];
    [passwordField  mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.equalTo(phoneNumberField);
        make.top.equalTo(phoneNumberField.mas_bottom).offset(0);
        make.width.equalTo(phoneNumberField.mas_width);
        make.height.equalTo(phoneNumberField.mas_height);
    }];
    
    UIImage *norImage = [UIImage imageNamed:@"login_register_button"];
    UIImage *stretchNorImage = [norImage stretchableImageWithLeftCapWidth:norImage.size.width *0.5 topCapHeight:norImage.size.height *0.5];
    UIImage *hilImage = [UIImage imageNamed:@"login_register_button_click"];
    UIImage *strtchHilImage = [hilImage stretchableImageWithLeftCapWidth:hilImage.size.width *0.5 topCapHeight:hilImage.size.height *0.5];
    UIButton *loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [loginButton setTitle:@"注册" forState:UIControlStateNormal];
    [loginButton setBackgroundImage:stretchNorImage forState:UIControlStateNormal];
    [loginButton setBackgroundImage:strtchHilImage forState:UIControlStateNormal];
    [registerInputView addSubview:loginButton];
    [loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(textFieldBg.mas_bottom).offset(10);
        make.left.equalTo(textFieldBg.mas_left);
        make.width.equalTo(textFieldBg);
        make.height.equalTo(passwordField);
    }];
    
}

#pragma mark - event response
- (void)registerButtonClick:(UIButton *)button{
    
    [self endEditing:YES];
    [button sizeToFit];
    button.selected = !button.selected;
    self.loginViewRightConstraint.equalTo(button.selected ? @(- self.frame.size.width) :@0);
    [UIView animateWithDuration:0.25 animations:^{
        [self layoutIfNeeded];
    }];
}
@end
