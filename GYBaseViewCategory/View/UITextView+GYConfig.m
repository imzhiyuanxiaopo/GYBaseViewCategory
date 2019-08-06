//
//  UITextView+GYConfig.m
//  ViewCatagory
//
//  Created by zhiyuan gao on 2019/8/4.
//  Copyright © 2019 Zhiyuan Gao. All rights reserved.
//

#import "UITextView+GYConfig.h"

#import "UIView+GYConfig.h"

#import <objc/runtime.h>

static char PHKEY;
static char PHFONTKEY;

@interface UITextView ()

/** tv显示的*/
@property (strong, nonatomic) UILabel *placeHolderLabel;

@property (assign, nonatomic) UIFont *placeHolderFont;

@end

@implementation UITextView (GYConfig)

#pragma mark - 获取真实高度
- (void)layoutSubviews{
    [super layoutSubviews];
    self.placeHolderLabel.frame = CGRectMake(self.textContainerInset.left + 5, self.textContainerInset.top, self.frame.size.width - self.textContainerInset.left - self.textContainerInset.right - 10, 0);
    [self.placeHolderLabel sizeToFit];
}

- (UITextView * _Nonnull (^)(UIFont * _Nonnull))gyTextViewFont{
    return ^(UIFont *font){
        self.font = font;
        self.placeHolderLabel.font = font;
        return self;
    };
}
- (UITextView * _Nonnull (^)(UIColor * _Nonnull))gyTextColor{
    return ^(UIColor *color){
        self.textColor = color;
        return self;
    };
}
- (UITextView * _Nonnull (^)(NSInteger))gyTextHexColor{
    return ^(NSInteger hexColor){
        self.textColor = [self colorWithHex:hexColor];
        return self;
    };
}

- (UITextView * _Nonnull (^)(NSString * _Nonnull))gyPlaceHolder{
    return ^(NSString *ph){
        [self initLabel];
        self.placeHolderLabel.text = ph;
        return self;
    };
}

- (UITextView * _Nonnull (^)(UIFont * _Nonnull))gyPlaceHolderFont{
    return ^(UIFont *font){
        [self initLabel];
        self.placeHolderLabel.font = font;
        self.placeHolderFont = font;
        return self;
    };
}

- (UITextView * _Nonnull (^)(UIColor * _Nonnull))gyPlaceHolderColor{
    return ^(UIColor *color){
        [self initLabel];
        self.placeHolderLabel.textColor = color;
        return self;
    };
}
- (UITextView * _Nonnull (^)(NSInteger))gyPlaceHolderHexColor{
    return ^(NSInteger hexColor){
        self.placeHolderLabel.textColor = [self colorWithHex:hexColor];
        return self;
    };
}

#pragma mark - 下面是初始化
- (UILabel *)placeHolderLabel{
    return objc_getAssociatedObject(self, &PHKEY);
}

- (void)setPlaceHolderLabel:(UILabel *)placeHolderLabel{
    objc_setAssociatedObject(self, &PHKEY, placeHolderLabel, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIFont *)placeHolderFont{
    return objc_getAssociatedObject(self, &PHFONTKEY);
}

- (void)setPlaceHolderFont:(UIFont *)placeHolderFont{
    objc_setAssociatedObject(self, &PHFONTKEY, placeHolderFont, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)initLabel{
    if (!self.placeHolderLabel) {
        self.placeHolderLabel = [[UILabel alloc] init];
        self.placeHolderLabel.font = [UIFont systemFontOfSize:12];
        self.placeHolderLabel.numberOfLines = 0;
        [self addSubview:self.placeHolderLabel];
        [self setValue:self.placeHolderLabel forKey:@"_placeholderLabel"];
    }
}

@end
