//
//  NSObject+HBPublicTool.m
//  HBPublicTools
//
//  Created by alex on 16/9/13.
//  Copyright © 2016年 alex. All rights reserved.
//

#import "NSObject+HBPublicTool.h"
#import <CommonCrypto/CommonDigest.h>

#pragma mark - 字典数组打印
@implementation NSDictionary (Log)
-(NSString *)descriptionWithLocale:(id)locale{
    
    NSMutableString *string = [NSMutableString string];
    // 开头有个{
    [string appendString:@"{\n"];
    
    // 遍历所有的键值对
    [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        [string appendFormat:@"\t%@", key];
        [string appendString:@" : "];
        [string appendFormat:@"%@,\n", obj];
    }];
    // 结尾有个}
    [string appendString:@"}"];
    // 查找最后一个逗号
    NSRange range = [string rangeOfString:@"," options:NSBackwardsSearch];
    if (range.location != NSNotFound)
        [string deleteCharactersInRange:range];
    
    return string;
}
@end

@implementation NSArray (Log)
-(NSString *)descriptionWithLocale:(id)locale{
    
    NSMutableString *string = [NSMutableString string];
    // 开头有个[
    [string appendString:@"[\n"];
    // 遍历所有的元素
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [string appendFormat:@"\t%@,\n", obj];
    }];
    // 结尾有个]
    [string appendString:@"]"];
    
    // 查找最后一个逗号
    NSRange range = [string rangeOfString:@"," options:NSBackwardsSearch];
    if (range.location != NSNotFound)
        [string deleteCharactersInRange:range];
    return string;
}
@end


#pragma mark - MD5加密
@implementation NSString (MyAdditions)
- (NSString *)md5
{
    const char *cStr = [self UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5( cStr, (int)strlen(cStr), result ); // This is the md5 call
    return [NSString stringWithFormat:
            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
}
@end

#pragma mark - NSObject分类
@implementation NSObject (HBPublicTool)

//轻触手势
-(void)bb_addTapGestureWithDestiView:(id)object withSelector:(SEL)selector andTarget:(id)target{
    
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:target action:selector];
    [object addGestureRecognizer:tap];
}

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
