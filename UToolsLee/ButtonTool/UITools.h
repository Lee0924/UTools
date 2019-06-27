//
//  UITools.h
//  QRTProject
//
//  Created by 石文文 on 2017/10/19.
//  Copyright © 2017年 lfm. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class BlockButton;

@interface UITools :NSObject

+(instancetype _Nullable)shareUITolls;

- (UIButton *)createButtonWithImageName:(NSString *)imageName
                              addTarget:(id)target
                                 action:(SEL)action;
- (BlockButton *)createButtonWithImageName:(NSString *)imageName
                                     block:(void(^)(UIButton *button))block;

- (UIButton *)createButtonWithBGImageName:(NSString *)bgImageName
                                addTarget:(id)target
                                   action:(SEL)action;

- (UIButton *)createButtonWithBGImageName:(NSString *)bgImageName
                                addTarget:(id)target
                                   action:(SEL)action
                                    title:(NSString *)title
                               titleColor:(UIColor *)titleColor
                              isSizeToFit:(BOOL)isSizeToFit;

/**根据传入的图片大小生成一个Button*/
- (UIButton *)createButtonWithBGImageName:(NSString *)bgImageName
                                addTarget:(id)target
                                   action:(SEL)action
                                    title:(NSString *)title
                               titleColor:(UIColor *)titleColor;

/**根据传入的图片大小生成一个Button, 并添加到父视图上*/
- (UIButton *)createButtonWithBGImageName:(NSString *)bgImageName
                                addTarget:(id)target
                                   action:(SEL)action
                                    title:(NSString *)title
                               titleColor:(UIColor *)titleColor
                                superView:(UIView *)superView;
/**根据传入是文字，生成一个button*/
- (UIButton *)createButtonWithTitle:(NSString *)title
                         titleColor:(UIColor *)titleColor
                          titleFont:(UIFont *)font
                          addTarget:(id)target
                             action:(SEL)action
                            superView:(UIView *)superView;

- (BlockButton *)createBlockButtonWithTitle:(NSString *)title
                                 titleColor:(UIColor *)titleColor
                                  titleFont:(UIFont *)font
                                      block:(void(^)(UIButton *button))block;

- (void)addTarget:(id)target
           action:(SEL)action
         onButton:(UIButton *)btn;

- (UIButton *)createButtonWithBGNormalImageName:(NSString *)bgImageName
                                 hightImageName:(NSString *)hightImageName
                                      addTarget:(id)target
                                         action:(SEL)action
                                    isSizeToFit:(BOOL)isSizeToFit;

- (void)setTitle:(NSString *)title
           color:(UIColor *)color
            font:(NSInteger)fontSize
        onButton:(UIButton *)btn;
/*
 改变按钮
 */
//设置按钮圆角
- (void)setBtnCorner:(UIButton *)btn;

#pragma mark - <UILabel>
/**
 *  创建lable，设置标题颜色（颜色为nil时，为黑色） 文本字体大小
 *
 *  @param frame     frame description
 *  @param text      text
 *  @param textColor textColor description
 *  @param size      size description
 *  @param superView superView
 *  @return lable
 */
- (UILabel *)createLableWithFrame:(CGRect)frame
                             text:(NSString *)text
                        textColor:(UIColor *)textColor
                   textFontOfSize:(CGFloat)size
                        superView:(UIView *)superView;


@end

#pragma mark - <BlockButton>
@interface BlockButton : UIButton
@property(nonatomic,copy)void(^buttonBlock)(UIButton*);
@end
