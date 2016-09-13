//
//  NSObject+HBPublicTool.h
//  HBPublicTools
//
//  Created by alex on 16/9/13.
//  Copyright © 2016年 alex. All rights reserved.
//

#import <UIKit/UIKit.h>


#pragma mark - 字典数组打印
@interface NSDictionary (Log)
@end
@interface NSArray (Log)
@end


#pragma mark - MD5加密
@interface NSString (MyAdditions)
- (NSString *)md5;
@end

#pragma mark - NSObject分类
@interface NSObject (HBPublicTool)

/**
 *  验证固话是否合法
 *
 *  @param phoneNumber 固话字符串
 *
 *  @return 返回BOOL值
 */
- (BOOL)bb_isLegalForGuHua:(NSString *)phoneNumber;


/**
 *  验证邮箱合法性
 *
 *  @param strMailBox 邮箱字符串
 *
 *  @return 返回bool值
 */
-(BOOL)bb_isLegalForMailBox:(NSString *)strMailBox;

/**
 *  验证手机号是否合法
 *
 *  @param strPhone 手机号码字符串
 *
 *  @return 返回bool值
 */
-(BOOL)bb_isLegalForPhoneNumber:(NSString *)strPhone;

/** 添加轻触手势 */
-(void)bb_addTapGestureWithDestiView:(id)object withSelector:(SEL)selector andTarget:(id)target;

/**
 *  时间戳转换
 *
 *  @param timestamp 时间戳字符串
 *  @param format    yyyy年MM月dd日 HH:mm:ss 根据需要随意组合
 *
 *  @return 返回字符串
 */
-(NSString *)bb_changeTimestampToString:(NSString *)timestamp withFormat:(NSString *)format;


@end
