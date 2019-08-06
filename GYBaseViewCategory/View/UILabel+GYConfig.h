//
//  UILabel+DJConfigLabel.h
//  DJPlatform
//
//  Created by zhiyuan gao on 2019/8/2.
//  Copyright © 2019 点金台. All rights reserved.
//

/*
 采用链式编程的一个label的分类 使用方法：label.gyText(@"asdf").gyTextColor(UIColor.whiteColor)....
 已经将这个类导入到pch文件方便全局调用
 (ps：后续如果有可能需要的属性可自行添加)
 */

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UILabel (GYConfig)

/** 设置文字*/
- (UILabel * _Nonnull (^)(NSString * _Nonnull))gyText;
/** 设置文字颜色color*/
- (UILabel * _Nonnull (^)(UIColor * _Nonnull))gyTextColor;
/** 设置文字颜色十六进制数字(为了减少依赖  在.m文件里定义一个转换16进制颜色方法)*/
- (UILabel * _Nonnull (^)(NSInteger))gyTextColorHex;
/** 设置字体*/
- (UILabel * _Nonnull (^)(UIFont * _Nonnull))gyFont;
/** 设置系统字体 只传入文字大小*/
- (UILabel * _Nonnull (^)(NSInteger))gySystemFontSize;
/** 设置文字位置*/
- (UILabel * _Nonnull (^)(NSTextAlignment))gyAlignment;
/** 设置文字富文本*/
- (UILabel * _Nonnull (^)(NSAttributedString * _Nonnull))gyAttributer;

/**
 设置背景色
 */
- (UILabel * _Nonnull (^)(UIColor * _Nonnull))gyLabelBackgroundColor;
- (UILabel * _Nonnull (^)(NSInteger))gyLabelBackgroundHexColor;

@end

NS_ASSUME_NONNULL_END
