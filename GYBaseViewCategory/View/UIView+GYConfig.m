//
//  UIView+GYConfigView.m
//  DJPlatform
//
//  Created by zhiyuan gao on 2019/8/2.
//  Copyright © 2019 点金台. All rights reserved.
//

#import "UIView+GYConfig.h"

#import <objc/runtime.h>

@interface GYGestureTarget : NSObject

@property (copy ,nonatomic) void(^block)(id sender);

- (void)gestureTap:(id)sender;

@end

@implementation GYGestureTarget

- (instancetype)initWithBlock:(void(^)(id))block{
    if ((self = [super init])) {
        _block = block;
    }
    return self;
}

- (void)gestureTap:(id)sender{
    if (_block) {
        _block(sender);
    }
}

- (void)dealloc{
    NSLog(@"释放了%s" ,__func__);
}

@end

static char const GESTURETARGETKEY;

@interface UIView ()

/// 圆角属性相关
@property (assign, nonatomic) CGFloat radius;
@property (assign, nonatomic) UIRectCorner corner;

@property (strong, nonatomic) NSMutableArray *gyTargets;
/// 贝塞尔路径
@property (strong, nonatomic) UIBezierPath *bezierPath;
/// 边框宽度
@property (assign, nonatomic) CGFloat borderWidth;
/// 边框颜色
@property (strong, nonatomic) UIColor *borderColor;

@end

// 圆角弧度key
static char RADIUSKEY;
// 圆角切图key
static char CORNERKEY;
// 贝塞尔路径key
static char BEZIERPATHKEY;
// 边框颜色key
static char BORDERCOLORKEY;
// 边框宽度key
static char BORDERWIDTHKEY;

@implementation UIView (GYConfig)

- (void)layoutSubviews{
    if (self.corner && self.radius) {
        [self cornerImage:self.radius];
    }else{
        if (!self.corner && self.radius) {
            self.corner = 15;
            [self cornerImage:self.radius];
        }
        if (self.corner && !self.radius) {
            self.radius = MIN(self.gyWidth / 2,self.gyHeight / 2);
            [self cornerImage:self.radius];
        }
        if (!self.corner && !self.radius) {
            if (self.borderWidth) {
                self.layer.borderWidth = self.borderWidth;
            }
            if (self.borderColor) {
                self.layer.borderColor = self.borderColor.CGColor;
            }
        }
    }
}

- (UIView * _Nonnull (^)(CGFloat))gyBorderWidth{
    return ^(CGFloat bw){
        self.borderWidth = bw;
        return self;
    };
}
- (UIView * _Nonnull (^)(UIColor * _Nonnull))gyBorderColor{
    return ^(UIColor *color){
        self.borderColor = color;
        return self;
    };
}
- (UIView * _Nonnull (^)(NSInteger))gyBorderHexColor{
    return ^(NSInteger hex){
        self.borderColor = [self colorWithHex:hex];
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
        //        [self cornerImageView];
        return self;
    };
}

/**
 自己切圆角图片
 
 @param radius radius description
 */
- (void)cornerImage:(CGFloat)radius{
    self.bezierPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:self.corner cornerRadii:CGSizeMake(self.radius, self.radius)];
    NSLog(@"%ld" ,self.corner);
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc]init];
    //设置大小
    maskLayer.frame = self.bounds;
    //设置图形样子
    maskLayer.path = self.bezierPath.CGPath;
    self.layer.mask = maskLayer;
    
    CAShapeLayer *borderLayer=[CAShapeLayer layer];
    borderLayer.path= self.bezierPath.CGPath;
    borderLayer.fillColor  = [UIColor clearColor].CGColor;
    borderLayer.strokeColor= self.borderColor.CGColor;
    borderLayer.lineWidth= self.borderWidth * 2;
    borderLayer.frame=self.bounds;
    [self.layer addSublayer:borderLayer];
}

- (UIView * _Nonnull (^)(UIRectCorner))gyCustomCornerRadius{
    return ^(UIRectCorner corner){
        self.corner = corner;
        NSLog(@"%ld" ,corner);
        //        [self cornerImageView];
        return self;
    };
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

#pragma mark - 添加视图的手势
- (UIView * _Nonnull (^)(void (^ _Nonnull)(id _Nonnull)))gyGestureTap{
    return [self gyGesture:UITapGestureRecognizer.new];
}

- (UIView * _Nonnull (^)(void (^ _Nonnull)(id _Nonnull)))gyGestureLongPress{
    return [self gyGesture:UILongPressGestureRecognizer.new];
}

- (UIView * _Nonnull (^)(NSInteger))gyGestureLongPressDuratime{
    return ^(NSInteger duration){
        NSArray <UIGestureRecognizer *>*gestureArray = self.gestureRecognizers;
        __block UILongPressGestureRecognizer *gesture;
        [gestureArray enumerateObjectsUsingBlock:^(UIGestureRecognizer * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if ([obj isKindOfClass:UILongPressGestureRecognizer.class]) {
                gesture = (UILongPressGestureRecognizer *)obj;
            }
        }];
        gesture.minimumPressDuration = duration;
        return self;
    };
}

- (UIView * _Nonnull (^)(void (^ _Nonnull)(id _Nonnull)))gyGesture:(UIGestureRecognizer *)gesture{
    return ^(void (^block)(id sender)){
        GYGestureTarget *target = [[GYGestureTarget alloc] initWithBlock:block];
        [gesture addTarget:target action:@selector(gestureTap:)];
        if ([gesture isKindOfClass:UILongPressGestureRecognizer.class]) {
            UILongPressGestureRecognizer *longPress = (UILongPressGestureRecognizer *)gesture;
            longPress.minimumPressDuration = 3;
        }
        self.userInteractionEnabled = YES;
        [self addGestureRecognizer:gesture];
        [self.gyTargets addObject:target];
        return self;
    };
}

#pragma mark - 设置属性
- (NSMutableArray *)gyTargets{
    NSMutableArray *array = objc_getAssociatedObject(self, &GESTURETARGETKEY);
    if (!array) {
        array = NSMutableArray.new;
        objc_setAssociatedObject(self, &GESTURETARGETKEY, array, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return array;
}

- (CGFloat)radius{
    return (CGFloat)[objc_getAssociatedObject(self, &RADIUSKEY) floatValue];
}

- (void)setRadius:(CGFloat)radius{
    objc_setAssociatedObject(self, &RADIUSKEY, @(radius), OBJC_ASSOCIATION_ASSIGN);
}

- (UIRectCorner)corner{
    return (NSInteger)[objc_getAssociatedObject(self, &CORNERKEY) integerValue];
}

- (void)setCorner:(UIRectCorner)corner{
    objc_setAssociatedObject(self, &CORNERKEY, @(corner), OBJC_ASSOCIATION_ASSIGN);
}

- (UIBezierPath *)bezierPath{
    return objc_getAssociatedObject(self, &BEZIERPATHKEY);
}

- (void)setBezierPath:(UIBezierPath *)bezierPath{
    objc_setAssociatedObject(self, &BEZIERPATHKEY, bezierPath, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CGFloat)borderWidth{
    return [objc_getAssociatedObject(self, &BORDERWIDTHKEY) floatValue];
}

- (void)setBorderWidth:(CGFloat)borderWidth{
    objc_setAssociatedObject(self, &BORDERWIDTHKEY, @(borderWidth), OBJC_ASSOCIATION_ASSIGN);
}

- (UIColor *)borderColor{
    return objc_getAssociatedObject(self, &BORDERCOLORKEY);
}

- (void)setBorderColor:(UIColor *)borderColor{
    objc_setAssociatedObject(self, &BORDERCOLORKEY, borderColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

#pragma mark - view的frame属性
- (CGFloat)gyX{
    return self.frame.origin.x;
}
- (void)setGyX:(CGFloat)gyX{
    CGRect rect = self.frame;
    rect.origin.x = gyX;
    self.frame = rect;
}

- (CGFloat)gyY{
    return self.frame.origin.y;
}
- (void)setGyY:(CGFloat)gyY{
    CGRect rect = self.frame;
    rect.origin.y = gyY;
    self.frame = rect;
}

- (CGFloat)gyWidth{
    return self.frame.size.width;
}
- (void)setGyWidth:(CGFloat)gyWidth{
    CGRect rect = self.frame;
    rect.size.width = gyWidth;
    self.frame = rect;
}

- (CGFloat)gyHeight{
    return self.frame.size.height;
}
- (void)setGyHeight:(CGFloat)gyHeight{
    CGRect rect = self.frame;
    rect.size.height = gyHeight;
    self.frame = rect;
}

- (CGFloat)gyCenterX{
    return self.frame.size.width / 2;
}

- (void)setGyCenterX:(CGFloat)gyCenterX{
    CGRect rect = self.frame;
    rect.origin.x = gyCenterX - self.frame.size.width / 2;
    self.frame = rect;
}

- (CGFloat)gyCenterY{
    return self.frame.size.height / 2;
}

- (void)setGyCenterY:(CGFloat)gyCenterY{
    CGRect rect = self.frame;
    rect.origin.y = gyCenterY - self.frame.size.width / 2;
    self.frame = rect;
}

@end
