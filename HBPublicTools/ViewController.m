//
//  ViewController.m
//  HBPublicTools
//
//  Created by alex on 16/9/13.
//  Copyright © 2016年 alex. All rights reserved.
//

#import "ViewController.h"
#import "NSObject+HBPublicTool.h"
#import "HBToast.h"
@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];


}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

    [self bb_setLablesWithArrOfTitle:@[@"1",@"2",@"3"] andLeftDistance:15 andItWidth:40 andItHeight:21 andYcoordinate:150 andDestiView:self.view];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
