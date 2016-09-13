//
//  HBManager.m
//  xinfenbaojz
//
//  Created by alex on 16/7/8.
//  Copyright © 2016年 alex. All rights reserved.
//

#import "HBManager.h"

@implementation HBManager

- (instancetype)init
{
    self = [super init];
    if (!self) return nil;
    self.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/plain",@"text/html", nil];
    return self;
}

#pragma mark - Public
+ (instancetype)shareManager
{
    static HBManager *_instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[self alloc] init];
    });
    return _instance;
}

@end
