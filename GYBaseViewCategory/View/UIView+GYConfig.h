//
//  UIView+GYConfigView.h
//  DJPlatform
//
//  Created by zhiyuan gao on 2019/8/2.
//  Copyright © 2019 点金台. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

//struct GYCorner {
//    BOOL leftTop;
//    BOOL rightTop;
//    BOOL rightBottom;
//    BOOL leftBottom;
//};
//
//typedef struct GYCorner GYCorner;

@interface UIView (GYConfig)

#pragma mark - 设置边线

/**
 边线宽度
 */
- (UIView * _Nonnull (^)(CGFloat))gyBorderWidth;
/**
 设置边线颜色
 */
- (UIView * _Nonnull (^)(UIColor * _Nonnull))gyBorderColor;
/** 边线16进制颜色*/
- (UIView * _Nonnull (^)(NSInteger))gyBorderHexColor;

/**
 设置圆角
 暂时使用mask来设置  textview使用画图绘制圆角会有问题
 */
- (UIView * _Nonnull (^)(CGFloat))gyCornerRadius;

/**
 设置想要位置的圆角
 GYConer看上面
 参数是BOOL值  填写0 1就行
 暂时未添加设置   没想到好的对所有视图控件的解决办法
 */
//- (UIView * _Nonnull (^)(GYCorner ,CGFloat radius))gyCorner;

#pragma mark - 设置背景色    子类也可以使用
/** 设置背景色*/
- (UIView * _Nonnull (^)(UIColor * _Nonnull))gyBackgroundColor;
/** 设置16进制背景色*/
- (UIView * _Nonnull (^)(NSInteger))gyBackgroundHexColor;

/**
 16进制颜色转换为color
 其他分类使用这个设置
 
 @param hexValue hexValue description
 @return return value description
 */
- (UIColor *)colorWithHex:(NSInteger)hexValue;

@end

NS_ASSUME_NONNULL_END
