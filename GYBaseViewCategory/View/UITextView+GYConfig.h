//
//  UITextView+GYConfig.h
//  ViewCatagory
//
//  Created by zhiyuan gao on 2019/8/4.
//  Copyright © 2019 Zhiyuan Gao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITextView (GYConfig)

/// 设置textview字体
- (UITextView * (^)(UIFont * _Nonnull))gyTextViewFont;
/// 设置字体颜色
- (UITextView * (^)(UIColor * _Nonnull))gyTextColor;
- (UITextView * (^)(NSInteger))gyTextHexColor;

/// 设置textview的占位符文本
- (UITextView * (^)(NSString * _Nonnull))gyPlaceHolder;
/// 设置占位符字体
- (UITextView * (^)(UIFont * _Nonnull))gyPlaceHolderFont;
/// 设置占位符文字颜色
- (UITextView * (^)(UIColor * _Nonnull))gyPlaceHolderColor;
- (UITextView * (^)(NSInteger))gyPlaceHolderHexColor;

@end

NS_ASSUME_NONNULL_END
