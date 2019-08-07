//
//  ViewController.m
//  ViewCatagory
//
//  Created by zhiyuan gao on 2019/8/4.
//  Copyright © 2019 Zhiyuan Gao. All rights reserved.
//

#import "ViewController.h"
#import "GYBaseViewHeader.h"

@interface ViewController ()

@property (assign ,nonatomic) int i;
@property (assign ,nonatomic) int b;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    UILabel *label = (UILabel *)UILabel.new
//    .gyText(@"测试一下分类写的怎么样")
//    .gySystemFontSize(15)
//    .gyTextHexColor(0x36126d)
//    .gyAlignment(NSTextAlignmentCenter)
//    .gyBackgroundColor(UIColor.yellowColor)
//    .gyCornerRadius(56)
//    .gyBorderWidth(5)
//    .gyBorderHexColor(0x123456);
//    label.frame = self.view.bounds;
//    [self.view addSubview:label];
    
    UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(0, 0, 300, 40)];
    textView
    .gyPlaceHolder(@"adsfasdfasdf")
    .gyPlaceHolderColor(UIColor.darkGrayColor)
    .gyBorderWidth(5)
    .gyBorderColor(UIColor.redColor);
    [self.view addSubview:textView];
    UITextView *textView1 = [[UITextView alloc] initWithFrame:CGRectMake(0, 100, 300, 40)];
    textView1
    .gyPlaceHolder(@"中文中文中文")
    .gyPlaceHolderColor(UIColor.darkGrayColor)
    .gyBorderWidth(5)
    .gyBorderColor(UIColor.orangeColor);
    [self.view addSubview:textView1];
}


@end
