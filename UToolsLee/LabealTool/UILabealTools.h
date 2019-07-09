//
//  UILabealTools.h
//  UToolsLee
//
//  Created by iOS on 2019/6/27.
//  Copyright © 2019 Lee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface UILabealTools : NSObject
+(instancetype _Nullable)shareUITools;
/**
 *  创建lable，设置标题颜色（颜色为nil时，为黑色） 文本字体大小
 *
 *  @param frame     frame description
 *  @param text      text
 *  @param textColor textColor description
 *  @param font      size description
 *  @param superView superView
 *  @return lable
 */
- (UILabel *)createLableWithFrame:(CGRect)frame text:(NSString *)text textColor:(UIColor *)textColor textFont:(UIFont *)font superView:(UIView *)superView;

/**
 *  创建lable，设置标题颜色（颜色为nil时，为黑色） 文本字体大小
 *
 *  @param text      text
 *  @param textColor textColor description
 *  @param font      size description
 *  @param superView superView
 *  @return lable
 */
- (UILabel *)createLableWithText:(NSString *)text textColor:(UIColor *)textColor textFont:(UIFont *)font superView:(UIView *)superView;

@end

NS_ASSUME_NONNULL_END
