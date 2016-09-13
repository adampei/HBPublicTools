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

    if ([self bb_isLegalForMailBox:@"abo.x@163.com"]) {
        
        NSLog(@"YES");
    }else{
    
        NSLog(@"NO");
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
