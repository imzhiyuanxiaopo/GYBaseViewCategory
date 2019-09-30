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

@interface UIButton ()

/** 可能有多种点击事件  因此用多个targets*/
@property (strong, nonatomic) NSMutableArray *targets;
/// 是否可以点击按钮
@property (copy, nonatomic) BOOL(^canClickButton)(void);

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
        if (button.canClickButton && !button.canClickButton()) {
            CAKeyframeAnimation *frameAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
            frameAnimation.values = @[@1.0 ,@1.2 ,@0.8 ,@1.2 ,@0.8 ,@1.2 ,@1.0];
            frameAnimation.duration = 0.55;
            frameAnimation.repeatCount = 1;
            frameAnimation.autoreverses = NO;
            [button.layer addAnimation:frameAnimation forKey:@"scale"];
            return;
        }
        _block(button);
    }
}

@end

static char buttonlimit_key;

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

- (UIButton * _Nonnull (^)(UIControlState))gyButtonState{
    return ^(UIControlState state){
        switch (state) {
            case UIControlStateSelected:
                self.selected = YES;
                break;
            case UIControlStateNormal:
                self.selected = NO;
                self.highlighted = NO;
                break;
            case UIControlStateHighlighted:
                self.highlighted = YES;
                break;
            default:
                break;
        }
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
        GYButtonTarget *target = [[GYButtonTarget alloc] initWithBlock:block];
        [self addTarget:target action:@selector(clickButton:) forControlEvents:event];
        NSMutableArray *targets = [self targets];
        [targets addObject:target];
        return self;
    };
}

- (UIButton * _Nonnull (^)(BOOL (^ _Nonnull)(void)))gyButtonLimit{
    return ^(BOOL(^block)(void)){
        self.canClickButton = block;
        return self;
    };
}

#pragma mark - 为按钮添加一个target属性
- (NSMutableArray *)targets{
    NSMutableArray *targets = objc_getAssociatedObject(self, &observerkey);
    if (!targets) {
        targets = [NSMutableArray array];
        objc_setAssociatedObject(self, &observerkey, targets, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return targets;
}

- (BOOL (^)(void))canClickButton{
    return objc_getAssociatedObject(self, &buttonlimit_key);
}

- (void)setCanClickButton:(BOOL (^)(void))canClickButton{
    objc_setAssociatedObject(self, &buttonlimit_key, canClickButton, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

@end
