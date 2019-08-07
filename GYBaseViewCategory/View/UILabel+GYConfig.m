//
//  UILabel+DJConfigLabel.m
//  DJPlatform
//
//  Created by zhiyuan gao on 2019/8/2.
//  Copyright © 2019 点金台. All rights reserved.
//

#import "UILabel+GYConfig.h"
#import "UIView+GYConfig.h"

@implementation UILabel (GYConfig)

- (UILabel * _Nonnull (^)(NSString * _Nonnull))gyText{
    return ^(NSString *text){
        self.text = text;
        return self;
    };
}
- (UILabel * _Nonnull (^)(NSAttributedString * _Nonnull))gyAttributer{
    return ^(NSAttributedString *attributed){
        self.attributedText = attributed;
        return self;
    };
}

- (UILabel * _Nonnull (^)(UIColor * _Nonnull))gyLabelBackgroundColor{
    return ^(UIColor *color){
        self.backgroundColor = color;
        return self;
    };
}
- (UILabel * _Nonnull (^)(NSInteger))gyLabelBackgroundHexColor{
    return ^(NSInteger color){
        self.backgroundColor = [self colorWithHex:color];
        return self;
    };
}

- (UILabel * _Nonnull (^)(UIColor * _Nonnull))gyTextColor{
    return ^(UIColor *color){
        self.textColor = color;
        return self;
    };
}

- (UILabel * _Nonnull (^)(NSInteger))gyTextHexColor{
    return ^(NSInteger colorHex){
        self.textColor = [self colorWithHex:colorHex];
        return self;
    };
}

- (UILabel * _Nonnull (^)(NSInteger))gyNumberOfLine{
    return ^(NSInteger number){
        self.numberOfLines = number;
        return self;
    };
}

- (UILabel * _Nonnull (^)(UIFont * _Nonnull))gyFont{
    return ^(UIFont *font){
        self.font = font;
        return self;
    };
}

- (UILabel * _Nonnull (^)(NSInteger))gySystemFontSize{
    return ^(NSInteger fontSize){
        self.font = [UIFont systemFontOfSize:fontSize];
        return self;
    };
}

- (UILabel * _Nonnull (^)(NSTextAlignment))gyAlignment{
    return ^(NSTextAlignment alignment){
        self.textAlignment = alignment;
        return self;
    };
}

@end
