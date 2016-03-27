//
//  UIView+LHQExtension.m
//  百思不得姐
//
//  Created by HqLee on 16/2/13.
//  Copyright © 2016年 HqLee. All rights reserved.
//

#import "UIView+LHQExtension.h"

@implementation UIView (LHQExtension)

-(void)setX:(CGFloat)x{
    
    CGRect frame = self.frame;
    
    frame.origin.x  = x;
    
    self.frame = frame;
}

- (CGFloat)x{
    
    return self.frame.origin.x;
}

-(void)setCenterX:(CGFloat)centerX{
    
    CGPoint center = self.center;
    
    center.x  = centerX;
    
    self.center = center;
}

- (CGFloat)centerX{
    
    return self.center.x;
}

-(void)setCenterY:(CGFloat)centerY{
    
    CGPoint center = self.center;
    
    center.y = centerY;
    
    self.center = center;
}

- (CGFloat)centerY{
    
    return self.center.y;
}

-(void)setY:(CGFloat)y{
    
    CGRect frame = self.frame;
    
    frame.origin.y  = y;
    
    self.frame = frame;
}

- (CGFloat)y{
    
    return self.frame.origin.y;
}

- (void)setWidth:(CGFloat)width{
    
    CGRect frame = self.frame;
    
    frame.size.width = width;
    
    self.frame = frame;
}

- (CGFloat)width{
    
    return self.frame.size.width;
}

- (void)setHeight:(CGFloat)height{
    
    CGRect frame = self.frame;
    
    frame.size.height = height;
    
    self.frame = frame;
}

- (CGFloat)height{
    
    return self.frame.size.height;
}

- (void)setSize:(CGSize)size{
    
    CGRect frame = self.frame;
    
    frame.size = size;
    
    self.frame = frame;
    
}

- (CGSize)size{
    
    return self.frame.size;
}

- (BOOL)isShowingOnKeyWindow{//判断一个视图是否在主窗口显示
    
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    
    // 计算出self在主窗口坐标系上的矩形框
//    CGRect selfRect = [self convertRect:self.bounds toView:keyWindow];
    CGRect selfRect = [keyWindow convertRect:self.frame fromView:self.superview];
    CGRect windowRect = keyWindow.bounds;
    // 判断scrollView的边框是否和window的边框交叉 
    return self.hidden == NO && self.alpha > 0.01 && self.window && CGRectIntersectsRect(selfRect, windowRect);
    
}

+ (instancetype)viewLoadFromXib{
    return [[[NSBundle mainBundle]loadNibNamed:NSStringFromClass(self) owner:nil options:nil]lastObject];
}

@end
