//
//  HBNetTool.h
//  xinfenbaojz
//
//  Created by alex on 16/7/8.
//  Copyright © 2016年 alex. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HBManager.h"

NS_ASSUME_NONNULL_BEGIN

@interface HBNetTool : NSObject

+ (nullable NSURLSessionDataTask *)GET:(NSString *)URLString
                            parameters:(nullable id)parameters
                              progress:(nullable void (^)(NSProgress *downloadProgress))downloadProgress
                               success:(nullable void (^)(NSURLSessionDataTask *task, id _Nullable responseObject))success
                               failure:(nullable void (^)(NSURLSessionDataTask * _Nullable task, NSError *error))failure;


+ (nullable NSURLSessionDataTask *)POST:(NSString *)URLString
                             parameters:(nullable id)parameters
                               progress:(nullable void (^)(NSProgress *uploadProgress))uploadProgress
                                success:(nullable void (^)(NSURLSessionDataTask *task, id _Nullable responseObject))success
                                failure:(nullable void (^)(NSURLSessionDataTask * _Nullable task, NSError *error))failure;



@end

NS_ASSUME_NONNULL_END