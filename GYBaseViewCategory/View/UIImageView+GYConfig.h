//
//  UIImageView+GYConfig.h
//  GYBaseViewCategory
//
//  Created by zhiyuan gao on 2019/8/6.
//  Copyright © 2019 Zhiyuan Gao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImageView (GYConfig)

/** 设置图片（图片名称）*/
- (UIImageView *(^)(NSString * _Nonnull imageNamed))gyImage;

///** 设置图片背景色（也可用uiview父类的方法）*/
//- (UIImageView *(^)(UIColor * _Nonnull backgroundColor))gyImgViewBackgroundColor;

@end

NS_ASSUME_NONNULL_END
