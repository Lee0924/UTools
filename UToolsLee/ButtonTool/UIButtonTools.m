//
//  UITools.m
//  QRTProject
//
//  Created by 石文文 on 2017/10/19.
//  Copyright © 2017年 lfm. All rights reserved.
//

#import "UIButtonTools.h"
@implementation UIButtonTools
+(instancetype _Nullable)shareUITolls
{
    static UIButtonTools *instance;
    static dispatch_once_t onceToken;
    dispatch_once (&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

- (UIButton *)createButtonWithImageName:(NSString *)imageName addTarget:(id)target action:(SEL)action
{
    UIButton * btn = [[UIButton alloc] init];
    [btn setImage:[UIImage imageNamed:imageName] forState:(UIControlStateNormal)];
    if (target && action) {
        [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    }
    return btn;
}

- (UIButton *)createButtonWithTitle:(NSString *)title titleColor:(UIColor *)titleColor titleFont:(UIFont *)font addTarget:(id)target action:(SEL)action superView:(UIView *)superView
{
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    if (target && action) {
        [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    }
    
    [btn setTitle:title forState:UIControlStateNormal];
    btn.titleLabel.font = font;
    if (titleColor) {
        [btn setTitleColor:titleColor forState:UIControlStateNormal];
    }else {
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    [btn sizeToFit];
    [superView addSubview:btn];
    return btn;
}


- (BlockButton *)createButtonWithImageName:(NSString *)imageName block:(void(^)(UIButton *button))block{
    BlockButton * btn = [BlockButton buttonWithType:UIButtonTypeCustom];
    btn.buttonBlock = block;
    [btn setImage:[UIImage imageNamed:imageName] forState:(UIControlStateNormal)];
    return btn;
}

- (UIButton *)createButtonWithBGImageName:(NSString *)bgImageName addTarget:(id)target action:(SEL)action
{
    UIButton * btn = [[UIButton alloc] init];
    if (target && action) {
        [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    }
    [btn setBackgroundImage:[UIImage imageNamed:bgImageName] forState:UIControlStateNormal];
    return btn;
}

- (UIButton *)createButtonWithBGImageName:(NSString *)bgImageName addTarget:(id)target action:(SEL)action title:(NSString *)title titleColor:(UIColor *)titleColor titleFont:(UIFont *)font isSizeToFit:(BOOL)isSizeToFit superView:(UIView *)superView
{
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    if (target && action) {
        [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    }
    [btn setBackgroundImage:[UIImage imageNamed:bgImageName] forState:UIControlStateNormal];
    [btn setTitle:title forState:UIControlStateNormal];
    btn.titleLabel.font = font;
    if (titleColor) {
        [btn setTitleColor:titleColor forState:UIControlStateNormal];
    }else {
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    if (isSizeToFit) {
        [btn sizeToFit];
    }
    [superView addSubview:btn];
    return btn;
}

- (UIButton *)createButtonWithImageName:(NSString *)imageName title:(NSString *)title titleColor:(UIColor *)titleColor titleFont:(UIFont *)font addTarget:(id)target action:(SEL)action superView:(UIView *)superView
{
    UIButton *btn = [self createButtonWithTitle:title titleColor:titleColor titleFont:font addTarget:target action:action superView:superView];
    [btn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    return btn;
}


- (BlockButton *)createBlockButtonWithTitle:(NSString *)title titleColor:(UIColor *)titleColor titleFont:(UIFont *)font block:(void(^)(UIButton *button))block{
    BlockButton * btn = [BlockButton buttonWithType:UIButtonTypeCustom];
    btn.buttonBlock = block;
    [btn setTitle:title forState:UIControlStateNormal];
    btn.titleLabel.font = font;
    if (titleColor) {
        [btn setTitleColor:titleColor forState:UIControlStateNormal];
    }else {
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    [btn sizeToFit];
    return btn;
    
}

- (UIButton *)createButtonWithBGNormalImageName:(NSString *)bgImageName hightImageName:(NSString *)hightImageName addTarget:(id)target action:(SEL)action isSizeToFit:(BOOL)isSizeToFit
{
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    if (target && action) {
        [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    }
    [btn setBackgroundImage:[UIImage imageNamed:bgImageName] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:hightImageName] forState:UIControlStateHighlighted];
    if (isSizeToFit) {
        [btn sizeToFit];
    }
    return btn;
}


@end

#pragma mark - <BlockButton>
@implementation BlockButton

-(void)setButtonBlock:(void (^)(UIButton *))buttonBlock{
    _buttonBlock = buttonBlock;
    [self addTarget:self action:@selector(deleteAction) forControlEvents:UIControlEventTouchUpInside];
}
- (void)deleteAction{
    __weak typeof(self) weakSelf = self;
    if (_buttonBlock) {
        __strong typeof(self) strongSelf = weakSelf;
        _buttonBlock(strongSelf);
    }
}


@end


