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

#pragma mark - 占位符设置
/** 占位符文字*/
- (UITextField * (^)(NSString * _Nonnull))gyPlaceHolder;
/** 占位符文字颜色*/
- (UITextField * (^)(UIColor * _Nonnull))gyPlaceHolderColor;
/** 文字颜色*/
- (UITextField * (^)(UIColor * _Nonnull))gyTextColor;
/** 16进制文字颜色*/
- (UITextField * (^)(NSInteger))gyTextHexColor;
/** 字体*/
- (UITextField * (^)(UIFont * _Nonnull))gyFont;
/** 文字位置*/
- (UITextField * (^)(NSTextAlignment))gyTextAligment;
/** 左侧视图*/
- (UITextField * (^)(UIView * _Nonnull))gyLeftView;
/** 右侧视图*/
- (UITextField * (^)(UIView * _Nonnull))gyRightView;
/** j键盘设置*/
- (UITextField * (^)(UIKeyboardType))gyKeyboardType;

@end

NS_ASSUME_NONNULL_END
