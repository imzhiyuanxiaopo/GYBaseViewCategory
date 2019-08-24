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

/** 设置textview文字*/
- (UITextView * (^)(NSString * _Nonnull))gyText;

/** 设置textview字体*/
- (UITextView * (^)(UIFont * _Nonnull))gyTextViewFont;
/** 设置字体颜色*/
- (UITextView * (^)(UIColor * _Nonnull))gyTextColor;
/** 16进制字体色*/
- (UITextView * (^)(NSInteger))gyTextHexColor;

/** 设置textview的占位符文本*/
- (UITextView * (^)(NSString * _Nonnull))gyPlaceHolder;
/** 设置占位符字体
    改字体默认跟随文本字体
 */
- (UITextView * (^)(UIFont * _Nonnull))gyPlaceHolderFont;
/** 设置占位符文字颜色*/
- (UITextView * (^)(UIColor * _Nonnull))gyPlaceHolderColor;
/** 设置占位符16进制颜色*/
- (UITextView * (^)(NSInteger))gyPlaceHolderHexColor;
/** 设置键盘*/
- (UITextView * (^)(UIKeyboardType))gyKeyboardType;

/** 设置文字位置*/
- (UITextView * (^)(NSTextAlignment))gyAlignment;

/** 设置背景色*/
- (UITextView * _Nonnull (^)(UIColor * _Nonnull))gyTextViewBackgroundColor;
/** 16进制背景色*/
- (UITextView * _Nonnull (^)(NSInteger))gyTextViewBackgroundHexColor;

@end

NS_ASSUME_NONNULL_END
