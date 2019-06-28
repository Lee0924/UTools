//
//  UILabealTools.m
//  UToolsLee
//
//  Created by iOS on 2019/6/27.
//  Copyright © 2019 Lee. All rights reserved.
//

#import "UILabealTools.h"

@implementation UILabealTools
+(instancetype _Nullable)shareUITolls
{
    static UILabealTools *instance;
    static dispatch_once_t onceToken;
    dispatch_once (&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}
- (UILabel *)createLableWithFrame:(CGRect)frame text:(NSString *)text textColor:(UIColor *)textColor textFontOfSize:(CGFloat)size superView:(UIView *)superView
{
    UILabel * lab = [[UILabel alloc]initWithFrame:frame];
    if (textColor) {
        lab.textColor = textColor;
    }else {
        lab.textColor = [UIColor blackColor];
    }
    
    if (text) {
        lab.text = text;
    }
    lab.backgroundColor = [UIColor clearColor];
    lab.font = [UIFont systemFontOfSize:size];
    [superView addSubview:lab];
    return lab;
}

- (UILabel *)createLableWithText:(NSString *)text textColor:(UIColor *)textColor textFontOfSize:(CGFloat)size superView:(UIView *)superView
{
    UILabel * lab = [[UILabel alloc]init];
    if (textColor) {
        lab.textColor = textColor;
    }else {
        lab.textColor = [UIColor blackColor];
    }
    
    if (text) {
        lab.text = text;
    }
    lab.backgroundColor = [UIColor clearColor];
    lab.font = [UIFont systemFontOfSize:size];
    [superView addSubview:lab];
    return lab;
}

@end
