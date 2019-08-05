//
//  UIButton+DJConfigButton.h
//  DJPlatform
//
//  Created by zhiyuan gao on 2019/8/2.
//  Copyright © 2019 点金台. All rights reserved.
//

#import <UIKit/UIKit.h>
/*
 这个分类为了减少链长度  将部分英文缩写了   正常写代码的话我估计也没有多少人会normal拼完的
 */

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (GYConfig)

#pragma mark - 设置各状态文字
- (UIButton * _Nonnull (^)(NSString * _Nonnull))gyNorlText;
- (UIButton * _Nonnull (^)(NSString * _Nonnull))gyHiltText;
- (UIButton * _Nonnull (^)(NSString * _Nonnull))gySelText;

#pragma mark - 设置各状态文字颜色
- (UIButton * _Nonnull (^)(UIColor * _Nonnull))gyNorlTextColor;
- (UIButton * _Nonnull (^)(UIColor * _Nonnull))gyHiltTextColor;
- (UIButton * _Nonnull (^)(UIColor * _Nonnull))gySelTextColor;

/** 设置文字颜色十六进制数字(为了减少依赖  在.m文件里定义一个转换16进制颜色方法)*/
- (UIButton * _Nonnull (^)(NSInteger))gyNorTextHex;
- (UIButton * _Nonnull (^)(NSInteger))gyHiltTextHex;
- (UIButton * _Nonnull (^)(NSInteger))gySelTextHex;

/**
 设置背景色
 */
- (UIButton * _Nonnull (^)(UIColor * _Nonnull))gyButtonBackgroundColor;
- (UIButton * _Nonnull (^)(NSInteger))gyButtonBackgroundHexColor;

/** 设置字体*/
- (UIButton * _Nonnull (^)(UIFont * _Nonnull))gyFont;
/** 设置系统字体 只传入文字大小*/
- (UIButton * _Nonnull (^)(NSInteger))gySystemFontSize;

@end

NS_ASSUME_NONNULL_END
