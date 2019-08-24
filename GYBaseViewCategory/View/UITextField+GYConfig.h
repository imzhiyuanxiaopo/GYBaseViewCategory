//
//  UITextField+GYConfig.h
//  ViewCatagory
//
//  Created by zhiyuan gao on 2019/8/4.
//  Copyright © 2019 Zhiyuan Gao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITextField (GYConfig)

/** 设置textfield文字*/
- (UITextField * (^)(NSString * _Nonnull))gyText;

#pragma mark - 占位符设置
/** 占位符文字*/
- (UITextField * (^)(NSString * _Nonnull))gyPlaceHolder;
/** 占位符文字颜色*/
- (UITextField * (^)(UIColor * _Nonnull))gyPlaceHolderColor;
/** 占位符16进制文字颜色*/
- (UITextField * (^)(NSInteger))gyPlaceHolderHexColor;
/** 文字颜色*/
- (UITextField * (^)(UIColor * _Nonnull))gyTextColor;
/** 16进制文字颜色*/
- (UITextField * (^)(NSInteger))gyTextHexColor;
/** 字体*/
- (UITextField * (^)(UIFont * _Nonnull))gyFont;
/** 文字位置*/
- (UITextField * (^)(NSTextAlignment))gyTextAligment;
#pragma mark - 设置左右侧视图时  如果是imageView会显示适合的大小V  自定义视图的话需要设置frame
/** 左侧视图*/
- (UITextField * (^)(UIView * _Nonnull))gyLeftView;
/** 右侧视图*/
- (UITextField * (^)(UIView * _Nonnull))gyRightView;
/** j键盘设置*/
- (UITextField * (^)(UIKeyboardType))gyKeyboardType;


/** 设置背景色*/
- (UITextField * _Nonnull (^)(UIColor * _Nonnull))gyTextFieldBackgroundColor;
/** 16进制背景色*/
- (UITextField * _Nonnull (^)(NSInteger))gyTextFieldBackgroundHexColor;

@end

NS_ASSUME_NONNULL_END
