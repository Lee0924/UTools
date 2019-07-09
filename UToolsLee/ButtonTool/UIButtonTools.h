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

@interface UIButtonTools :NSObject

+(instancetype _Nullable)shareUITools;

/**根据传入的图片生成一个button按钮*/
- (UIButton *)createButtonWithImageName:(NSString *)imageName addTarget:(id)target action:(SEL)action;

/**根据传入是文字及文字大小，生成一个button添加上点击事件，并放在视图上*/
- (UIButton *)createButtonWithTitle:(NSString *)title titleColor:(UIColor *)titleColor titleFont:(UIFont *)font addTarget:(id)target action:(SEL)action superView:(UIView *)superView;

/**根据传入的图片生成一个带背景图片的按钮*/
- (UIButton *)createButtonWithBGImageName:(NSString *)bgImageName addTarget:(id)target action:(SEL)action;

/**
 * bgImageName 背景图片名称
 * target      target
 * action      action
 * title       title文字
 * titleColor  文字颜色
 * isSizeToFit 是否支持SizeToFit
 */
- (UIButton *)createButtonWithBGImageName:(NSString *)bgImageName addTarget:(id)target action:(SEL)action title:(NSString *)title titleColor:(UIColor *)titleColor titleFont:(UIFont *)font isSizeToFit:(BOOL)isSizeToFit superView:(UIView *)superView;

/**
 * bgImageName 图片名称
 * target      target
 * action      action
 * title       title文字
 * titleColor  文字颜色
 */
- (UIButton *)createButtonWithImageName:(NSString *)imageName title:(NSString *)title titleColor:(UIColor *)titleColor titleFont:(UIFont *)font addTarget:(id)target action:(SEL)action superView:(UIView *)superView;

- (BlockButton *)createBlockButtonWithTitle:(NSString *)title titleColor:(UIColor *)titleColor titleFont:(UIFont *)font block:(void(^)(UIButton *button))block;

- (BlockButton *)createButtonWithImageName:(NSString *)imageName block:(void(^)(UIButton *button))block;

/**
 * 根据传入的两张图，生成有背景图，且点击会改变背景图的按钮
 * bgImageName      背景图
 * heightImageName  高亮图
 */
- (UIButton *)createButtonWithBGNormalImageName:(NSString *)bgImageName hightImageName:(NSString *)hightImageName addTarget:(id)target action:(SEL)action isSizeToFit:(BOOL)isSizeToFit;

@end

#pragma mark - <BlockButton>
@interface BlockButton : UIButton
@property(nonatomic,copy)void(^buttonBlock)(UIButton*);
@end
