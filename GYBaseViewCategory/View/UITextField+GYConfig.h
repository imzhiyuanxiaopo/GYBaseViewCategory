//
//  UITextField+GYConfig.h
//  ViewCatagory
//
//  Created by zhiyuan gao on 2019/8/4.
//  Copyright © 2019 Zhiyuan Gao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITextField (GYConfig)

- (UITextField * (^)(NSString * _Nonnull))gyPlaceHolder;
- (UITextField * (^)(UIColor * _Nonnull))gyPlaceHolderColor;

@end

NS_ASSUME_NONNULL_END
