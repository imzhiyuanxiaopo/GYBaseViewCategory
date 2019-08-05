//
//  UIButton+DJConfigButton.m
//  DJPlatform
//
//  Created by zhiyuan gao on 2019/8/2.
//  Copyright © 2019 点金台. All rights reserved.
//

#import "UIButton+GYConfig.h"

@implementation UIButton (GYConfig)

#pragma mark - 设置各状态文字
- (UIButton * _Nonnull (^)(NSString * _Nonnull))gyNorlText{
    return ^(NSString *text){
        [self setTitle:text forState:UIControlStateNormal];
        return self;
    };
}
- (UIButton * _Nonnull (^)(NSString * _Nonnull))gySelText{
    return ^(NSString *text){
        [self setTitle:text forState:UIControlStateSelected];
        return self;
    };
}
- (UIButton * _Nonnull (^)(NSString * _Nonnull))gyHiltText{
    return ^(NSString *text){
        [self setTitle:text forState:UIControlStateHighlighted];
        return self;
    };
}

- (UIButton * _Nonnull (^)(UIColor * _Nonnull))gyButtonBackgroundColor{
    return ^(UIColor *color){
        self.backgroundColor = color;
        return self;
    };
}
- (UIButton * _Nonnull (^)(NSInteger))gyButtonBackgroundHexColor{
    return ^(NSInteger color){
        self.backgroundColor = [self colorWithHex:color];
        return self;
    };
}

#pragma mark - 各状态文字颜色
- (UIButton * _Nonnull (^)(UIColor * _Nonnull))gyNorlTextColor{
    return ^(UIColor *color){
        [self setTitleColor:color forState:UIControlStateNormal];
        return self;
    };
}
- (UIButton * _Nonnull (^)(UIColor * _Nonnull))gySelTextColor{
    return ^(UIColor *color){
        [self setTitleColor:color forState:UIControlStateSelected];
        return self;
    };
}
- (UIButton * _Nonnull (^)(UIColor * _Nonnull))gyHiltTextColor{
    return ^(UIColor *color){
        [self setTitleColor:color forState:UIControlStateHighlighted];
        return self;
    };
}

- (UIButton * _Nonnull (^)(NSInteger))gyNorTextHex{
    return ^(NSInteger colorHex){
        [self setTitleColor:[self colorWithHex:colorHex] forState:UIControlStateNormal];
        return self;
    };
}
- (UIButton * _Nonnull (^)(NSInteger))gySelTextHex{
    return ^(NSInteger colorHex){
        [self setTitleColor:[self colorWithHex:colorHex] forState:UIControlStateSelected];
        return self;
    };
}
- (UIButton * _Nonnull (^)(NSInteger))gyHiltTextHex{
    return ^(NSInteger colorHex){
        [self setTitleColor:[self colorWithHex:colorHex] forState:UIControlStateHighlighted];
        return self;
    };
}

- (UIButton * _Nonnull (^)(UIFont * _Nonnull))gyFont{
    return ^(UIFont *font){
        self.titleLabel.font = font;
        return self;
    };
}

- (UIButton * _Nonnull (^)(NSInteger))gySystemFontSize{
    return ^(NSInteger fontSize){
        self.titleLabel.font = [UIFont systemFontOfSize:fontSize];
        return self;
    };
}

/**
 16进制颜色转换为color
 
 @param hexValue hexValue description
 @return return value description
 */
- (UIColor *)colorWithHex:(NSInteger)hexValue{
    return [UIColor colorWithRed:((float)((hexValue & 0xFF0000) >> 16)) / 255.0 green:((float)((hexValue & 0xFF00) >> 8)) / 255.0 blue:((float)(hexValue & 0xFF)) / 255.0 alpha:1.0f];
}

@end
