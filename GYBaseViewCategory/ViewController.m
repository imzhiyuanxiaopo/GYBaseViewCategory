//
//  ViewController.m
//  ViewCatagory
//
//  Created by zhiyuan gao on 2019/8/4.
//  Copyright © 2019 Zhiyuan Gao. All rights reserved.
//

#import "ViewController.h"
#import "GYBaseViewHeader.h"

#import "Speak.h"

#import "AViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(0, 50, 300, 40)];
    textView
    .gyPlaceHolder(@"adsfasdfasdf")
    .gyPlaceHolderColor(UIColor.darkGrayColor)
    .gyBorderWidth(5)
    .gyBorderColor(UIColor.redColor);
    [self.view addSubview:textView];
    UITextView *textView1 = (UITextView *)UITextView.new
    .gyPlaceHolder(@"中文中文中文")
    .gyPlaceHolderHexColor(0x43ab92)
    .gyAlignment(NSTextAlignmentRight)
    .gyBorderWidth(5)
    .gyBorderColor(UIColor.orangeColor);
    textView1.frame = CGRectMake(0, 100, 300, 40);
    [self.view addSubview:textView1];

    UITextField *textField = UITextField.new
    .gyPlaceHolder(@"测试用的textfield")
    .gyLeftView(UIImageView.new
                .gyImage(@"aaa"));
    textField.frame = CGRectMake(0, 200, 300, 40);
    [self.view addSubview:textField];
    
    __weak typeof(self) weakSelf = self;
    UIButton *button = (UIButton *)UIButton.new
    .gyNormalText(@"我是按钮") // 设置normal状态文字
    .gySelectedText(@"我不是按钮了") // 设置选中状态的文字
    .gyHighlightedText(@"我又特么是按钮了") // 高亮状态文字
    .gyNormalTextHexColor(0x518369) // 设置文字16进制颜色（通过color设置颜色另有方法）
    .gySelectedTextHexColor(0x53ab11)
    .gyHighlightedTextColor(UIColor.purpleColor)
    .gyTouchInside(^(UIButton *button){ // 添加UIControlEventTouchUpInside的点击方法
        __strong typeof(weakSelf) storngSelf = weakSelf;
        NSLog(@"点击了按钮");
        AViewController *viewController = AViewController.new;
        viewController.view.gyBackgroundColor(UIColor.whiteColor);
//        [storngSelf presentViewController:viewController animated:YES completion:nil];
        button.gyButtonState(UIControlStateSelected);
    })
    .gyTouchOutside(^(UIButton *button){ // 添加UIControlEventTouchUpOutside的点击方法
        __strong typeof(weakSelf) storngSelf = weakSelf;
        NSLog(@"点击了按钮  如果点击超出边界");
        AViewController *viewController = AViewController.new;
        viewController.view.gyBackgroundColor(UIColor.whiteColor);
        [storngSelf presentViewController:viewController animated:YES completion:nil];
    })
    .gyBackgroundColor(UIColor.yellowColor); // 修改背景色（uiview分类 返回的是uiview  所以初始化时使用了(UIButton *)强行转换  取消警告  button分类后添加了设置背景色的方法）
    button.frame = CGRectMake(0, 300, 300, 40);
    [self.view addSubview:button];
    
    UILabel *label = (UILabel *)UILabel.new
    .gyText(@"asdfasdf")
    .gyTextColor(UIColor.greenColor)
    .gyBackgroundColor(UIColor.purpleColor)
    .gyGestureTap(^(UITapGestureRecognizer *gesture){
        NSLog(@"点击了label%@" ,weakSelf);
    });
    label.frame = CGRectMake(0, 400, 300, 40);
    [self.view addSubview:label];
}

- (void)clickView{
    NSLog(@"sdf");
}

- (Speak *)speak1{
    return Speak.new;
}

- (void)dealloc{
    NSLog(@"adfasdfasdfasdfasfa");
}

- (void)injected{
    self.view.backgroundColor = [UIColor whiteColor];
    UILabel *label = [UILabel new].gyText(@"asdfkjhasjldfkasdfjasf");
    label.frame = self.view.bounds;
    [self.view addSubview:label];
}


@end
