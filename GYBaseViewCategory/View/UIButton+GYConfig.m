//
//  UIButton+DJConfigButton.m
//  DJPlatform
//
//  Created by zhiyuan gao on 2019/8/2.
//  Copyright © 2019 点金台. All rights reserved.
//

#import "UIButton+GYConfig.h"

#import <objc/runtime.h>

#import "UIView+GYConfig.h"

static char observerkey;

@interface GYButtonTarget : NSObject

@property (copy ,nonatomic) void(^block)(UIButton *sender);
- (void)clickButton:(UIButton *)button;

@end

@implementation GYButtonTarget

- (instancetype)initWithBlock:(void(^)(UIButton *))block{
    if ((self = [super init])) {
        _block = [block copy];
    }
    return self;
}

- (void)clickButton:(UIButton *)button{
    if (_block) {
        _block(button);
    }
}

@end

@interface UIButton ()

@property (strong, nonatomic) GYButtonTarget *observer;

@end

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

- (UIButton * _Nonnull (^)(void(^)(UIButton *sender)))gyTouchInside{
    return [self gyTouchWithEvent:UIControlEventTouchUpInside];
}

- (UIButton * _Nonnull (^)(void (^ _Nonnull)(UIButton * _Nonnull)))gyTouchOutside{
    return [self gyTouchWithEvent:UIControlEventTouchUpOutside];
}

/**
 点击按钮时调用的方法

 @param event event description
 */
- (UIButton * _Nonnull (^)(void(^)(UIButton *sender)))gyTouchWithEvent:(UIControlEvents)event{
    return ^(void(^block)(UIButton *sender)){
        self.observer = [[GYButtonTarget alloc] initWithBlock:block];
        [self addTarget:self.observer action:@selector(clickButton:) forControlEvents:event];
        return self;
    };
}

#pragma mark - 为按钮添加一个target属性
- (GYButtonTarget *)observer{
    return objc_getAssociatedObject(self, &observerkey);
}

- (void)setObserver:(GYButtonTarget *)observer{
    objc_setAssociatedObject(self, &observerkey, observer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
