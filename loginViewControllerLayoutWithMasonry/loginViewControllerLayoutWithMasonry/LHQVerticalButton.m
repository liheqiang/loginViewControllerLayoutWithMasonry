//
//  LHQVerticalButton.m
//  百思不得姐
//
//  Created by HqLee on 16/2/17.
//  Copyright © 2016年 HqLee. All rights reserved.
//

/**
 *  垂直排列的按钮
 */

#import "LHQVerticalButton.h"
#import "UIView+LHQExtension.h"

@implementation LHQVerticalButton

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setup];
    }
    return self;
}

- (void)awakeFromNib{
    [self setup];
}

- (void)setup{
    
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    
}


- (void)layoutSubviews{
    
    [super layoutSubviews];
    
    //调整图片的frame
    self.imageView.x = 0;
    self.imageView.y = 0;
    self.imageView.width = self.width;
    self.imageView.height = self.imageView.width;
    
    //调整文字的frame
    self.titleLabel.x = 0;
    self.titleLabel.y = self.height - self.titleLabel.font.lineHeight;
    self.titleLabel.width = self.width;
    
}

@end
