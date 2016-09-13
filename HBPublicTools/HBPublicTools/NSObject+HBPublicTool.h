//
//  NSObject+HBPublicTool.h
//  HBPublicTools
//
//  Created by alex on 16/9/13.
//  Copyright © 2016年 alex. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSObject (HBPublicTool)

/**
 *  年月日时分秒 
 *
 *  @param timestamp 时间戳字符串
 *  @param format    yyyy年MM月dd日 HH:mm:ss 根据需要随意组合
 *
 *  @return 返回字符串
 */
-(NSString *)bb_changeTimestampToString:(NSString *)timestamp withFormat:(NSString *)format;


@end
