//
//  UIButton+DJConfigButton.h
//  DJPlatform
//
//  Created by zhiyuan gao on 2019/8/2.
//  Copyright © 2019 点金台. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (GYConfig)

#pragma mark - 设置各状态文字
/** 普通状态文字*/
- (UIButton * _Nonnull (^)(NSString * _Nonnull))gyNormalText;
/** 高亮状态文字*/
- (UIButton * _Nonnull (^)(NSString * _Nonnull))gyHighlightedText;
/** 选中状态文字*/
- (UIButton * _Nonnull (^)(NSString * _Nonnull))gySelectedText;

#pragma mark - 设置各状态文字颜色
/** 普通状态文字颜色*/
- (UIButton * _Nonnull (^)(UIColor * _Nonnull))gyNormalTextColor;
/** 高亮状态文字颜色*/
- (UIButton * _Nonnull (^)(UIColor * _Nonnull))gyHighlightedTextColor;
/** 选中状态文字颜色*/
- (UIButton * _Nonnull (^)(UIColor * _Nonnull))gySelectedTextColor;

/** 设置普通状态16进制文字颜色*/
- (UIButton * _Nonnull (^)(NSInteger))gyNormalTextHexColor;
/** 设置高亮状态16进制文字颜色*/
- (UIButton * _Nonnull (^)(NSInteger))gyHighlightedTextHexColor;
/** 设置选中状态16进制文字颜色*/
- (UIButton * _Nonnull (^)(NSInteger))gySelectedTextHexColor;

/** 设置背景色*/
- (UIButton * _Nonnull (^)(UIColor * _Nonnull))gyButtonBackgroundColor;
/** 设置16进制背景色*/
- (UIButton * _Nonnull (^)(NSInteger))gyButtonBackgroundHexColor;

/** 设置字体*/
- (UIButton * _Nonnull (^)(UIFont * _Nonnull))gyFont;
/** 设置系统字体 只传入文字大小*/
- (UIButton * _Nonnull (^)(NSInteger))gySystemFontSize;

/** 按钮普通状态图片*/
- (UIButton * _Nonnull (^)(UIImage * _Nonnull))gyNormalImage;
/** 按钮选中状态图片*/
- (UIButton * _Nonnull (^)(UIImage * _Nonnull))gySelectedImage;
/** 按钮高亮状态图片*/
- (UIButton * _Nonnull (^)(UIImage * _Nonnull))gyHighlightedImage;
/** 按钮普通状态背景图*/
- (UIButton * _Nonnull (^)(UIImage * _Nonnull))gyNormalBackImage;
/** 按钮高亮状态背景图*/
- (UIButton * _Nonnull (^)(UIImage * _Nonnull))gyHighlightedBackImage;
/** 按钮选中状态背景图*/
- (UIButton * _Nonnull (^)(UIImage * _Nonnull))gySelectedBackImage;
/** touchinside点击方法*/
- (UIButton * _Nonnull (^)(void(^)(UIButton *sender)))gyTouchInside;
/** touchoutside点击方法*/
- (UIButton * _Nonnull (^)(void(^)(UIButton *sender)))gyTouchOutside;

@end

NS_ASSUME_NONNULL_END
