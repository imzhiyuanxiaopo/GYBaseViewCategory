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

@property (assign) CGFloat radius;
//@property (assign ,nonatomic) GYCorner corner;

@property (strong ,nonatomic) UIImageView *cornerImageView;

@property (strong ,nonatomic) NSMutableArray *gyTargets;

@end

// 圆角弧度key  (暂时没有使用)
static char RADIUSKEY;
// 圆角切图key  (暂时没有使用)
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

- (UIImageView *)cornerImageView{
    return objc_getAssociatedObject(self, &CORNERKEY);
}

- (void)setCornerImageView:(UIImageView *)cornerImageView{
    objc_setAssociatedObject(self, &CORNERKEY, cornerImageView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

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
