//
//  NSObject+HBPublicTool.m
//  HBPublicTools
//
//  Created by alex on 16/9/13.
//  Copyright © 2016年 alex. All rights reserved.
//

#import "NSObject+HBPublicTool.h"
#import <CommonCrypto/CommonDigest.h>

#define kScreenB [UIScreen mainScreen].bounds
#define kScreenH [UIScreen mainScreen].bounds.size.height
#define kScreenW [UIScreen mainScreen].bounds.size.width
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

//多个label控件一个view中居中显示
-(void)bb_setLablesWithArrOfTitle:(NSArray<NSString *> *)arrTitles andLeftDistance:(CGFloat)lDistance andItWidth:(CGFloat)width andItHeight:(CGFloat)height andYcoordinate:(CGFloat) y andDestiView:(UIView *)destiView{
    
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    CGFloat margin = (screenWidth - 2*lDistance - width*arrTitles.count) / (arrTitles.count - 1);
    UILabel * tempLabel = [UILabel new];
    
    for (int i = 0; i< arrTitles.count; i++) {
        
        if (i == 0) {
            
            UILabel * lbl = [[UILabel alloc] initWithFrame:CGRectMake(lDistance, y, width, height)];
            lbl.textAlignment = NSTextAlignmentCenter;
            lbl.text = arrTitles[0];
            [destiView addSubview:lbl];
            tempLabel = lbl;
            continue;
        }
        UILabel * lbl = [[UILabel alloc] initWithFrame:CGRectMake((CGRectGetMaxX(tempLabel.frame)+margin), y, width, height)];
        lbl.textAlignment = NSTextAlignmentCenter;
        lbl.text = arrTitles[i];
        [destiView addSubview:lbl];
        tempLabel = lbl;
    }
}

//是否纯数字
-(BOOL)bb_isLegalForDigital:(NSString *)str{

    NSString * phoneRegex = @"^[0-9]*$";
    NSPredicate * phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    return [phoneTest evaluateWithObject:str];
}



//固话是否合法
- (BOOL)bb_isLegalForGuHua:(NSString *)phoneNumber{

    NSString * phoneRegex = @"^(400|010|02\\d|0[3-9]\\d{2})-?\\d{6,8}$";
    NSPredicate * phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    return [phoneTest evaluateWithObject:phoneNumber];
}

//邮箱是否合法
-(BOOL)bb_isLegalForMailBox:(NSString *)strMailBox{

    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:strMailBox];
}


//手机号是否合法
-(BOOL)bb_isLegalForPhoneNumber:(NSString *)strPhone{

    NSString * phoneRegex = @"^[1]([3][0-9]{1}|34|35|36|37|38|39|47|50|51|52|57|58|59|78|82|83|84|87|88|30|31|32|45|55|56|71|75|76|85|86|33|49|53|73|77|80|81|89|70)[0-9]{8}$";
    NSPredicate * phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    return [phoneTest evaluateWithObject:strPhone];
}


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
