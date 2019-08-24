//
//  Speak.m
//  GYBaseViewCategory
//
//  Created by zhiyuan gao on 2019/8/19.
//  Copyright © 2019 Zhiyuan Gao. All rights reserved.
//

#import "Speak.h"

@interface Speak ()

@property (copy, nonatomic) NSString *name;

@end

@implementation Speak

- (void)speak{
    NSLog(@"My name is :%@" ,self.name);
}

@end
