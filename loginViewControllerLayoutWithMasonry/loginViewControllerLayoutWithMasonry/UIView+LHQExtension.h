//
//  UIView+LHQExtension.h
//  百思不得姐
//
//  Created by HqLee on 16/2/13.
//  Copyright © 2016年 HqLee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (LHQExtension)
//为分类添加属性只会生出方法名，不会自动生成方法实现喝下划线实例变量

@property (nonatomic, assign) CGFloat x;

@property (nonatomic, assign) CGFloat y;

@property (nonatomic, assign) CGFloat centerX;

@property (nonatomic, assign) CGFloat centerY;

@property (nonatomic, assign) CGFloat width;

@property (nonatomic, assign) CGFloat height;

@property (nonatomic, assign) CGSize size;

- (BOOL)isShowingOnKeyWindow;

+ (instancetype)viewLoadFromXib;
@end
