//
//  ViewController.m
//  ViewCatagory
//
//  Created by zhiyuan gao on 2019/8/4.
//  Copyright © 2019 Zhiyuan Gao. All rights reserved.
//

#import "ViewController.h"
#import "ViewCategoryHeader.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UILabel *label = (UILabel *)UILabel.new.gyText(@"测试一下分类写的怎么样").gySystemFontSize(15).gyTextColorHex(0x36126d).gyAlignment(NSTextAlignmentCenter).gyBackgroundColor(UIColor.yellowColor);
    label.frame = self.view.bounds;
    [self.view addSubview:label];
}


@end
