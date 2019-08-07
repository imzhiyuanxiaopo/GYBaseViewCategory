//
//  AViewController.m
//  GYBaseViewCategory
//
//  Created by zhiyuan gao on 2019/8/7.
//  Copyright © 2019 Zhiyuan Gao. All rights reserved.
//

#import "AViewController.h"

#import "ViewController.h"

@interface AViewController ()

@end

@implementation AViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.navigationController pushViewController:ViewController.new animated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
