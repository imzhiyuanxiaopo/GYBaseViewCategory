//
//  UIImageView+GYConfig.m
//  GYBaseViewCategory
//
//  Created by zhiyuan gao on 2019/8/6.
//  Copyright © 2019 Zhiyuan Gao. All rights reserved.
//

#import "UIImageView+GYConfig.h"

#import "UIView+GYConfig.h"

@implementation UIImageView (GYConfig)

- (UIImageView * _Nonnull (^)(NSString * _Nonnull))gyImage{
    return ^(NSString *imageName){
        self.image = [UIImage imageNamed:imageName];
        return self;
    };
}

// 背景色
- (UIImageView * _Nonnull (^)(UIColor * _Nonnull))gyImageViewBackgroundColor{
    return ^(UIColor *color){
        self.backgroundColor = color;
        return self;
    };
}
- (UIImageView * _Nonnull (^)(NSInteger))gyImageViewBackgroundHexColor{
    return ^(NSInteger color){
        self.backgroundColor = [self colorWithHex:color];
        return self;
    };
}

@end
