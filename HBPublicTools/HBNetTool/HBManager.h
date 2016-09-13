//
//  HBManager.h
//  xinfenbaojz
//
//  Created by alex on 16/7/8.
//  Copyright © 2016年 alex. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

@interface HBManager : AFHTTPSessionManager

+ (instancetype)shareManager;

@end
