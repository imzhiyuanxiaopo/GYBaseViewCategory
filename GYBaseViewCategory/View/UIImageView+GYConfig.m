//
//  UIImageView+GYConfig.m
//  GYBaseViewCategory
//
//  Created by zhiyuan gao on 2019/8/6.
//  Copyright © 2019 Zhiyuan Gao. All rights reserved.
//

#import "UIImageView+GYConfig.h"

@implementation UIImageView (GYConfig)

- (UIImageView * _Nonnull (^)(NSString * _Nonnull))gyImage{
    return ^(NSString *imageName){
        self.image = [UIImage imageNamed:imageName];
        return self;
    };
}

@end
