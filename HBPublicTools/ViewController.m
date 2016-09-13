//
//  ViewController.m
//  HBPublicTools
//
//  Created by alex on 16/9/13.
//  Copyright © 2016年 alex. All rights reserved.
//

#import "ViewController.h"
#import "NSObject+HBPublicTool.h"
@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];


    //1473749494
    NSLog(@"%@",[self bb_changeTimestampToString:@"1473749494" withFormat:nil]);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
