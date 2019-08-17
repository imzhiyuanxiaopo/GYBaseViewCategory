//
//  UIButton+DJConfigButton.m
//  DJPlatform
//
//  Created by zhiyuan gao on 2019/8/2.
//  Copyright © 2019 点金台. All rights reserved.
//

#import "UIButton+GYConfig.h"

#import "UIView+GYConfig.h"

@implementation UIButton (GYConfig)

#pragma mark - 设置各状态文字
- (UIButton * _Nonnull (^)(NSString * _Nonnull))gyNormalText{
    return ^(NSString *text){
        [self setTitle:text forState:UIControlStateNormal];
        return self;
    };
}
- (UIButton * _Nonnull (^)(NSString * _Nonnull))gySelectedText{
    return ^(NSString *text){
        [self setTitle:text forState:UIControlStateSelected];
        return self;
    };
}
- (UIButton * _Nonnull (^)(NSString * _Nonnull))gyHighlightedText{
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
- (UIButton * _Nonnull (^)(UIColor * _Nonnull))gyNormalTextColor{
    return ^(UIColor *color){
        [self setTitleColor:color forState:UIControlStateNormal];
        return self;
    };
}
- (UIButton * _Nonnull (^)(UIColor * _Nonnull))gySelectedTextColor{
    return ^(UIColor *color){
        [self setTitleColor:color forState:UIControlStateSelected];
        return self;
    };
}
- (UIButton * _Nonnull (^)(UIColor * _Nonnull))gyHighlightedTextColor{
    return ^(UIColor *color){
        [self setTitleColor:color forState:UIControlStateHighlighted];
        return self;
    };
}

- (UIButton * _Nonnull (^)(NSInteger))gyNormalTextHexColor{
    return ^(NSInteger colorHex){
        [self setTitleColor:[self colorWithHex:colorHex] forState:UIControlStateNormal];
        return self;
    };
}
- (UIButton * _Nonnull (^)(NSInteger))gySelectedTextHexColor{
    return ^(NSInteger colorHex){
        [self setTitleColor:[self colorWithHex:colorHex] forState:UIControlStateSelected];
        return self;
    };
}
- (UIButton * _Nonnull (^)(NSInteger))gyHighlightedTextHexColor{
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

#pragma mark - 图片的设置
- (UIButton * _Nonnull (^)(UIImage * _Nonnull))gyNormalImage{
    return ^(UIImage *image){
        [self setImage:image forState:UIControlStateNormal];
        return self;
    };
}

- (UIButton * _Nonnull (^)(UIImage * _Nonnull))gyHighlightedImage{
    return ^(UIImage *image){
        [self setImage:image forState:UIControlStateHighlighted];
        return self;
    };
}

- (UIButton * _Nonnull (^)(UIImage * _Nonnull))gySelectedImage{
    return ^(UIImage *image){
        [self setImage:image forState:UIControlStateSelected];
        return self;
    };
}

- (UIButton * _Nonnull (^)(UIImage * _Nonnull))gyNormalBackImage{
    return ^(UIImage *image){
        [self setBackgroundImage:image forState:UIControlStateNormal];
        return self;
    };
}

- (UIButton * _Nonnull (^)(UIImage * _Nonnull))gyHighlightedBackImage{
    return ^(UIImage *image){
        [self setBackgroundImage:image forState:UIControlStateHighlighted];
        return self;
    };
}

- (UIButton * _Nonnull (^)(UIImage * _Nonnull))gySelectedBackImage{
    return ^(UIImage *image){
        [self setBackgroundImage:image forState:UIControlStateSelected];
        return self;
    };
}

- (UIButton * _Nonnull (^)(SEL _Nonnull ,id _Nonnull))gyTouchInside{
    return ^(SEL selector ,id target){
        [self addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
        return self;
    };
}

@end
