//
//  NSObject+HBPublicTool.m
//  HBPublicTools
//
//  Created by alex on 16/9/13.
//  Copyright © 2016年 alex. All rights reserved.
//

#import "NSObject+HBPublicTool.h"

@implementation NSObject (HBPublicTool)

-(NSString *)bb_changeTimestampToString:(NSString *)timestamp withFormat:(NSString *)format{

    NSDate * lastTime = [NSDate dateWithTimeIntervalSince1970:[timestamp integerValue]];
    //实例化一个NSDateFormatter对象
    NSDateFormatter *dateFormatter1 = [[NSDateFormatter alloc] init];
    //设定时间格式,这里可以设置成自己需要的格式
    if (format) {
        
        [dateFormatter1 setDateFormat:format];
    }else{
    
        [dateFormatter1 setDateFormat:@"yyyy年MM月dd日 HH:mm:ss"];
    }
    
    //用[NSDate date]可以获取系统当前时间
    NSString *currentDateStr = [dateFormatter1 stringFromDate:lastTime];
    return currentDateStr;
}

@end
