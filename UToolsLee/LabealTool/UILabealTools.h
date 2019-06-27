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
+(instancetype _Nullable)shareUITolls;
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
- (UILabel *)createLableWithFrame:(CGRect)frame text:(NSString *)text textColor:(UIColor *)textColor textFontOfSize:(CGFloat)size superView:(UIView *)superView;


@end

NS_ASSUME_NONNULL_END
