//
//  UITextField+GYConfig.m
//  ViewCatagory
//
//  Created by zhiyuan gao on 2019/8/4.
//  Copyright © 2019 Zhiyuan Gao. All rights reserved.
//

#import "UITextField+GYConfig.h"

#import "UIView+GYConfig.h"

#import <objc/runtime.h>

@interface UITextField ()

/** 占位符文字颜色*/
@property (strong ,nonatomic) UIColor *placeHolderColor;
/** 占位符文字*/
@property (copy ,nonatomic) NSString *placeholderText;

@end

static char PHColor;
static char PHText;

@implementation UITextField (GYConfig)

- (UITextField * _Nonnull (^)(NSString * _Nonnull))gyPlaceHolder{
    return ^(NSString *placeH){
        self.placeholderText = placeH;
        if (!self.placeHolderColor) {
            self.placeholder = placeH;
            return self;
        }else{
            [self initPlaceholder];
            return self;
        }
    };
}
- (UITextField * _Nonnull (^)(UIColor * _Nonnull))gyPlaceHolderColor{
    return ^(UIColor *color){
        self.placeHolderColor = color;
        if (!self.placeholderText) {
            self.placeholderText = @"";
        }
        [self initPlaceholder];
        return self;
    };
}

- (UITextField * _Nonnull (^)(UIColor * _Nonnull))gyTextColor{
    return ^(UIColor *color){
        self.textColor = color;
        return self;
    };
}

- (UITextField * _Nonnull (^)(NSInteger))gyTextHexColor{
    return ^(NSInteger hexColor){
        self.textColor = [self colorWithHex:hexColor];
        return self;
    };
}

- (UITextField * _Nonnull (^)(UIFont * _Nonnull))gyFont{
    return ^(UIFont *font){
        self.font = font;
        return self;
    };
}

- (UITextField * _Nonnull (^)(NSTextAlignment))gyTextAligment{
    return ^(NSTextAlignment align){
        self.textAlignment = align;
        return self;
    };
}

- (UITextField * _Nonnull (^)(UIView * _Nonnull))gyLeftView{
    return ^(UIView *view){
        self.leftView = view;
        return self;
    };
}

- (UITextField * _Nonnull (^)(UIView * _Nonnull))gyRightView{
    return ^(UIView *view){
        self.rightView = view;
        return self;
    };
}

- (UITextField * _Nonnull (^)(UIKeyboardType))gyKeyboardType{
    return ^(UIKeyboardType type){
        self.keyboardType = type;
        return self;
    };
}

- (void)initPlaceholder{
    NSAttributedString *attrString = [[NSAttributedString alloc] initWithString:self.placeholderText attributes:@{NSForegroundColorAttributeName : self.placeHolderColor ,NSFontAttributeName : self.font}];
    self.attributedPlaceholder = attrString;
}

#pragma mark - 下面就是属性的初始化了
- (UIColor *)placeHolderColor{
    return objc_getAssociatedObject(self, &PHColor);
}

- (void)setPlaceHolderColor:(UIColor *)placeHolderColor{
    objc_setAssociatedObject(self, &PHColor, placeHolderColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSString *)placeholderText{
    return objc_getAssociatedObject(self, &PHText);
}

- (void)setPlaceholderText:(NSString *)placeholderText{
    objc_setAssociatedObject(self, &PHText, placeholderText, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

@end
