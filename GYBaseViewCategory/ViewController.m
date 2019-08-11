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

    UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(0, 0, 300, 40)];
    textView
    .gyPlaceHolder(@"adsfasdfasdf")
    .gyPlaceHolderColor(UIColor.darkGrayColor)
    .gyBorderWidth(5)
    .gyBorderColor(UIColor.redColor);
    [self.view addSubview:textView];
    UITextView *textView1 = (UITextView *)UITextView.new
    .gyPlaceHolder(@"中文中文中文")
    .gyPlaceHolderColor(UIColor.darkGrayColor)
    .gyBorderWidth(5)
    .gyBorderColor(UIColor.orangeColor);
    textView1.frame = CGRectMake(0, 100, 300, 40);
    [self.view addSubview:textView1];
    
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
