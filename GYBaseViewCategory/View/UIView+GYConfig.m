//
//  UIView+GYConfigView.m
//  DJPlatform
//
//  Created by zhiyuan gao on 2019/8/2.
//  Copyright © 2019 点金台. All rights reserved.
//

#import "UIView+GYConfig.h"

#import <objc/runtime.h>

@interface UIView ()

@property (assign) CGFloat radius;
//@property (assign ,nonatomic) GYCorner corner;

@property (strong ,nonatomic) UIImageView *cornerImageView;

@end

static char RADIUSKEY;
static char CORNERKEY;

@implementation UIView (GYConfig)

- (UIView * _Nonnull (^)(CGFloat))gyBorderWidth{
    return ^(CGFloat bw){
        self.layer.borderWidth = bw;
        return self;
    };
}
- (UIView * _Nonnull (^)(UIColor * _Nonnull))gyBorderColor{
    return ^(UIColor *color){
        self.layer.borderColor = color.CGColor;
        return self;
    };
}
- (UIView * _Nonnull (^)(NSInteger))gyBorderHexColor{
    return ^(NSInteger hex){
        self.layer.borderColor = [self colorWithHex:hex].CGColor;
        return self;
    };
}

- (UIView * _Nonnull (^)(UIColor * _Nonnull))gyBackgroundColor{
    return ^(UIColor *color){
        self.backgroundColor = color;
        return self;
    };
}
- (UIView * _Nonnull (^)(NSInteger))gyBackgroundHexColor{
    return ^(NSInteger color){
        self.backgroundColor = [self colorWithHex:color];
        return self;
    };
}

- (UIView * _Nonnull (^)(CGFloat))gyCornerRadius{
    return ^(CGFloat radius){
        self.radius = radius;
        self.layer.cornerRadius = radius;
        self.layer.masksToBounds = YES;
//        if ([self isMemberOfClass:[UITextView class]] || [self isMemberOfClass:[UITextField class]]) {
//            self.layer.cornerRadius = radius;
//            self.layer.masksToBounds = YES;
//        }else{
//            [self cornerImage:self.radius];
//        }
        return self;
    };
}
//
//- (UIView * _Nonnull (^)(GYCorner ,CGFloat))gyCorner{
//    return ^(GYCorner corner ,CGFloat radius){
//        self.corner = corner;
//        self.radius = radius;
//        return self;
//    };
//}

- (void)cornerImage:(CGFloat)radius{
    UIGraphicsBeginImageContextWithOptions(self.frame.size, NO, 0);
    CGContextRef cxt = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(cxt, [UIColor whiteColor].CGColor);
    CGContextSetStrokeColorWithColor(cxt, [UIColor whiteColor].CGColor);
    
    CGContextMoveToPoint(cxt, self.frame.size.width, self.frame.size.height-self.radius);
    CGContextAddArcToPoint(cxt, self.frame.size.width, self.frame.size.height, self.frame.size.width-self.radius, self.frame.size.height, self.radius);//右下角
    CGContextAddArcToPoint(cxt, 0, self.frame.size.height, 0, self.frame.size.height-self.radius, self.radius);//左下角
    CGContextAddArcToPoint(cxt, 0, 0, self.radius, 0, self.radius);//左上角
    CGContextAddArcToPoint(cxt, self.frame.size.width, 0, self.frame.size.width, self.radius, self.radius);//右上角
    CGContextClosePath(cxt);
    CGContextDrawPath(cxt, kCGPathFillStroke);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    self.cornerImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    [self.cornerImageView setImage:image];
    self.cornerImageView.gyBackgroundColor(UIColor.whiteColor);
    [self insertSubview:self.cornerImageView atIndex:0];
}

/**
 16进制颜色转换为color
 
 @param hexValue hexValue description
 @return return value description
 */
- (UIColor *)colorWithHex:(NSInteger)hexValue{
    return [UIColor colorWithRed:((float)((hexValue & 0xFF0000) >> 16)) / 255.0 green:((float)((hexValue & 0xFF00) >> 8)) / 255.0 blue:((float)(hexValue & 0xFF)) / 255.0 alpha:1.0f];
}

/**
 16进制字符串转16进制数字

 @param hexString hexString description
 @return return value description
 */
- (NSInteger)numberWithHexString:(NSString *)hexString{
    const char *hexChar = [hexString cStringUsingEncoding:NSUTF8StringEncoding];
    int hexNumber;
    sscanf(hexChar, "%x", &hexNumber);
    return (NSInteger)hexNumber;
}

#pragma mark - 设置属性
- (CGFloat)radius{
    return (CGFloat)[objc_getAssociatedObject(self, &RADIUSKEY) floatValue];
}

- (void)setRadius:(CGFloat)radius{
    objc_setAssociatedObject(self, &RADIUSKEY, @(radius), OBJC_ASSOCIATION_ASSIGN);
}

- (UIImageView *)cornerImageView{
    return objc_getAssociatedObject(self, &CORNERKEY);
}

- (void)setCornerImageView:(UIImageView *)cornerImageView{
    objc_setAssociatedObject(self, &CORNERKEY, cornerImageView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
