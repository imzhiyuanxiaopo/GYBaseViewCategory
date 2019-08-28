//
//  AViewController.m
//  GYBaseViewCategory
//
//  Created by zhiyuan gao on 2019/8/7.
//  Copyright © 2019 Zhiyuan Gao. All rights reserved.
//

#import "AViewController.h"

#import "ViewController.h"

#import "GYBaseViewHeader.h"

@interface AViewController ()

@end

@implementation AViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.navigationController pushViewController:ViewController.new animated:YES];
    
    __weak typeof(self) weakself = self;
    UIImageView *label = (UIImageView *)UIImageView.new
    .gyImage(@"Default-568h@2x")
    .gyBackgroundColor(UIColor.purpleColor)
    .gyGestureTap(^(UITapGestureRecognizer *gesture){
        NSLog(@"短按");
    })
    .gyGestureLongPress(^(UILongPressGestureRecognizer *gesture){
        __strong typeof(weakself) strongSelf = weakself;
        NSLog(@"长按");
        [strongSelf dismissViewControllerAnimated:YES completion:nil];
    })
    .gyGestureLongPressDuratime(1.5)
//    .gyCustomCornerRadius(UIRectCornerTopRight | UIRectCornerBottomLeft)
    .gyCornerRadius(30)
    ;
    label.frame = CGRectMake(0, 400, 300, 40);
    self.view.gyBackgroundHexColor(0x348122);
    [self.view addSubview:label];
}

- (void)dealloc{
    NSLog(@"释放了AVIEWCONTROLLER");
}

@end
