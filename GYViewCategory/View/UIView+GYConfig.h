//
//  UIView+GYConfigView.h
//  DJPlatform
//
//  Created by zhiyuan gao on 2019/8/2.
//  Copyright © 2019 点金台. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (GYConfig)

#pragma mark - 设置边线
- (UIView * _Nonnull (^)(CGFloat))gyBorderWidth;
/**
 设置边线颜色
 */
- (UIView * _Nonnull (^)(UIColor * _Nonnull))gyBorderColor;
- (UIView * _Nonnull (^)(NSInteger))gyBorderHexColor;

- (UIView * _Nonnull (^)(CGFloat))gyCornerRadius;

/**
 设置背景色
 */
- (UIView * _Nonnull (^)(UIColor * _Nonnull))gyBackgroundColor;
- (UIView * _Nonnull (^)(NSInteger))gyBackgroundHexColor;

/**
 16进制颜色转换为color
 
 @param hexValue hexValue description
 @return return value description
 */
- (UIColor *)colorWithHex:(NSInteger)hexValue;

@end

NS_ASSUME_NONNULL_END
