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
    
    UIButton *button = (UIButton *)UIButton.new
    .gyTouchInside(^(UIButton *button){
        NSLog(@"点击了按钮");
        AViewController *viewController = AViewController.new;
        viewController.view.gyBackgroundColor(UIColor.whiteColor);
        [self presentViewController:viewController animated:YES completion:nil];
    })
    .gyBackgroundColor(UIColor.yellowColor);
    
    button.frame = CGRectMake(0, 300, 300, 40);
    [self.view addSubview:button];
    
    __weak typeof(self) weakSelf = self;
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
