//
//  UITools.m
//  QRTProject
//
//  Created by 石文文 on 2017/10/19.
//  Copyright © 2017年 lfm. All rights reserved.
//

#import "UITools.h"
@implementation UITools
+(instancetype _Nullable)shareUITolls
{
    static UITools *instance;
    static dispatch_once_t onceToken;
    dispatch_once (&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

- (UIButton *)createButtonWithImageName:(NSString *)imageName
                              addTarget:(id)target
                                 action:(SEL)action
{
    UIButton * btn = [[UIButton alloc] init];
    [btn setImage:[UIImage imageNamed:imageName] forState:(UIControlStateNormal)];
    if (target && action) {
        [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    }
    return btn;
}
- (BlockButton *)createButtonWithImageName:(NSString *)imageName
                                     block:(void(^)(UIButton *button))block{
    BlockButton * btn = [BlockButton buttonWithType:UIButtonTypeCustom];
    btn.buttonBlock = block;
    [btn setImage:[UIImage imageNamed:imageName] forState:(UIControlStateNormal)];
    return btn;
}

- (UIButton *)createButtonWithBGImageName:(NSString *)bgImageName
                                addTarget:(id)target
                                   action:(SEL)action
{
    UIButton * btn = [[UIButton alloc] init];
    if (target && action) {
        [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    }
    [btn setBackgroundImage:[UIImage imageNamed:bgImageName] forState:UIControlStateNormal];
    return btn;
}

- (UIButton *)createButtonWithBGImageName:(NSString *)bgImageName
                                addTarget:(id)target
                                   action:(SEL)action
                                    title:(NSString *)title
                               titleColor:(UIColor *)titleColor
{
    return [self createButtonWithBGImageName:bgImageName addTarget:target action:action title:title titleColor:titleColor isSizeToFit:YES];
}

- (UIButton *)createButtonWithBGImageName:(NSString *)bgImageName
                                addTarget:(id)target
                                   action:(SEL)action
                                    title:(NSString *)title
                               titleColor:(UIColor *)titleColor
                              isSizeToFit:(BOOL)isSizeToFit
{
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    if (target && action) {
        [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    }
    [btn setBackgroundImage:[UIImage imageNamed:bgImageName] forState:UIControlStateNormal];
    [btn setTitle:title forState:UIControlStateNormal];
    if (titleColor) {
        [btn setTitleColor:titleColor forState:UIControlStateNormal];
    }else {
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    if (isSizeToFit) {
        [btn sizeToFit];
    }
    return btn;
}

- (UIButton *)createButtonWithBGImageName:(NSString *)bgImageName
                                addTarget:(id)target
                                   action:(SEL)action
                                    title:(NSString *)title
                               titleColor:(UIColor *)titleColor
                                superView:(UIView *)superView
{
    UIButton * btn = [self createButtonWithBGImageName:bgImageName addTarget:target action:action title:title titleColor:titleColor];
    [superView addSubview:btn];
    return btn;
}

- (UIButton *)createButtonWithTitle:(NSString *)title
                         titleColor:(UIColor *)titleColor
                          titleFont:(UIFont *)font
                          addTarget:(id)target
                             action:(SEL)action
                            superView:(UIView *)superView
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

- (BlockButton *)createBlockButtonWithTitle:(NSString *)title
                                 titleColor:(UIColor *)titleColor
                                  titleFont:(UIFont *)font
                                      block:(void(^)(UIButton *button))block{
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

- (void)addTarget:(id)target
           action:(SEL)action
         onButton:(UIButton *)btn
{
    if (target && action) {
        [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    }
}

- (UIButton *)createButtonWithBGNormalImageName:(NSString *)bgImageName
                                 hightImageName:(NSString *)hightImageName
                                      addTarget:(id)target
                                         action:(SEL)action
                                    isSizeToFit:(BOOL)isSizeToFit
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


- (void)setTitle:(NSString *)title
           color:(UIColor *)color
            font:(NSInteger)fontSize
        onButton:(UIButton *)btn
{
    [btn setTitle:title forState:(UIControlStateNormal)];
    [btn setTitleColor:color forState:(UIControlStateNormal)];
    // 设置字体为冬青黑简
    btn.titleLabel.font = [UIFont fontWithName:@"HiraKakuProN-W3" size:fontSize];
}

/*
 改变按钮
 */
//设置按钮圆角
- (void)setBtnCorner:(UIButton *)btn
{
    
    btn.layer.masksToBounds = YES;
    btn.layer.cornerRadius = 5.0;
    //    btn.layer.borderWidth = 0.5;
    //btn.layer.borderColor = [[UIColor lightGrayColor] CGColor];
}

- (UILabel *)createLableWithFrame:(CGRect)frame
                             text:(NSString *)text
                        textColor:(UIColor *)textColor
                   textFontOfSize:(CGFloat)size
                        superView:(UIView *)superView
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


