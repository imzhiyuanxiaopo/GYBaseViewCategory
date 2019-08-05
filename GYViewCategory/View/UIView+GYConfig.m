//
//  UIView+GYConfigView.m
//  DJPlatform
//
//  Created by zhiyuan gao on 2019/8/2.
//  Copyright © 2019 点金台. All rights reserved.
//

#import "UIView+GYConfig.h"

@implementation UIView (GYConfig)

- (UIView * _Nonnull (^)(CGFloat))gyBorderWidth{
    return ^(CGFloat bw){
        self.layer.borderWidth = bw;
        return self;
    };
}
- (UIView * _Nonnull (^)(UIColor * _Nonnull))gyBorderColor{
    return ^(UIColor *color){
        self.layer.borderColor = color.CGColor;
        return self;
    };
}
- (UIView * _Nonnull (^)(NSInteger))gyBorderHexColor{
    return ^(NSInteger hex){
        self.layer.borderColor = [self colorWithHex:hex].CGColor;
        return self;
    };
}

- (UIView * _Nonnull (^)(UIColor * _Nonnull))gyBackgroundColor{
    return ^(UIColor *color){
        self.backgroundColor = color;
        return self;
    };
}
- (UIView * _Nonnull (^)(NSInteger))gyBackgroundHexColor{
    return ^(NSInteger color){
        self.backgroundColor = [self colorWithHex:color];
        return self;
    };
}

- (UIView * _Nonnull (^)(CGFloat))gyCornerRadius{
    return ^(CGFloat radius){
        
        return self;
    };
}

/**
 添加圆角
 */
- (void)addCorner{
    
}

/**
 16进制颜色转换为color
 
 @param hexValue hexValue description
 @return return value description
 */
- (UIColor *)colorWithHex:(NSInteger)hexValue{
    return [UIColor colorWithRed:((float)((hexValue & 0xFF0000) >> 16)) / 255.0 green:((float)((hexValue & 0xFF00) >> 8)) / 255.0 blue:((float)(hexValue & 0xFF)) / 255.0 alpha:1.0f];
}

/**
 16进制字符串转16进制数字

 @param hexString hexString description
 @return return value description
 */
- (NSInteger)numberWithHexString:(NSString *)hexString{
    const char *hexChar = [hexString cStringUsingEncoding:NSUTF8StringEncoding];
    int hexNumber;
    sscanf(hexChar, "%x", &hexNumber);
    return (NSInteger)hexNumber;
}

@end
