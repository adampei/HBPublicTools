//
//  HBToast.m
//  HBLabelAlert
//
//  Created by alex on 16/8/24.
//  Copyright © 2016年 alex. All rights reserved.
//

#import "HBToast.h"
#define kScreenB [UIScreen mainScreen].bounds
#define kScreenH [UIScreen mainScreen].bounds.size.height
#define kScreenW [UIScreen mainScreen].bounds.size.width
@implementation HBToast

//创建单例是为了判断当前是否在显示lbl提示框.isShowing
+(instancetype)sharedTost{

    static HBToast * instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [self new];
    });
    return instance;
}

+(void)bb_showStatus:(NSString *)status withTime:(CGFloat)time{

    HBToast * toast = [HBToast sharedTost];
    if (!toast.isShowing) {
        
        toast.isShowing = YES;
        
        UIWindow * keyWindow = [UIApplication sharedApplication].keyWindow;
        UILabel * lbl = [UILabel new];
        lbl.text = status;
        lbl.backgroundColor = [UIColor blackColor];
        lbl.alpha = 0.7;
        lbl.layer.cornerRadius = 3.0;
        lbl.layer.masksToBounds = YES;
        lbl.textColor = [UIColor whiteColor];
        lbl.font = [UIFont systemFontOfSize:16];
        lbl.textAlignment = NSTextAlignmentCenter;
        CGFloat lblH = 27;
        CGFloat lblW = 250;
        CGFloat lblY = kScreenH - lblH - 60;
        CGFloat lblX = (kScreenW - lblW) * 0.5;
        lbl.frame = CGRectMake(lblX, lblY, lblW, lblH);
        [keyWindow addSubview:lbl];
        NSLog(@"显示");
        //通过GCD方式延迟执行 移除lbl
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(time * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            NSLog(@"隐藏");
            toast.isShowing = NO;
            [lbl removeFromSuperview];
        });
        
    }

}


+(void)bb_showWarning:(NSString *)warnging{

    HBToast * toast = [HBToast sharedTost];
    if (!toast.isShowing) {
        
        toast.isShowing = YES;
        
        UIWindow * keyWindow = [UIApplication sharedApplication].keyWindow;
        UILabel * lbl = [UILabel new];
        lbl.text = warnging;
        lbl.backgroundColor = [UIColor blackColor];
        lbl.alpha = 0.7;
        lbl.layer.cornerRadius = 3.0;
        lbl.layer.masksToBounds = YES;
        lbl.textColor = [UIColor whiteColor];
        lbl.font = [UIFont systemFontOfSize:16];
        lbl.textAlignment = NSTextAlignmentCenter;
        lbl.numberOfLines = 0;
        CGFloat lblH = 70;
        CGFloat lblW = 300;
        CGFloat lblY = kScreenH - lblH - 60;
        CGFloat lblX = (kScreenW - lblW) * 0.5;
        lbl.frame = CGRectMake(lblX, lblY, lblW, lblH);
        [keyWindow addSubview:lbl];
        NSLog(@"显示");
        //通过GCD方式延迟执行 移除lbl
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            NSLog(@"隐藏");
            toast.isShowing = NO;
            [lbl removeFromSuperview];
        });
        
    }

}



+(void)bb_showStatus:(NSString *)status{
    
    HBToast * toast = [HBToast sharedTost];
    if (!toast.isShowing) {
        
    toast.isShowing = YES;
    
    UIWindow * keyWindow = [UIApplication sharedApplication].keyWindow;
    UILabel * lbl = [UILabel new];
    lbl.text = status;
    lbl.backgroundColor = [UIColor blackColor];
    lbl.alpha = 0.7;
    lbl.layer.cornerRadius = 3.0;
    lbl.layer.masksToBounds = YES;
    lbl.textColor = [UIColor whiteColor];
    lbl.font = [UIFont systemFontOfSize:16];
    lbl.textAlignment = NSTextAlignmentCenter;
    CGFloat lblH = 27;
    CGFloat lblW = 250;
    CGFloat lblY = kScreenH - lblH - 60;
    CGFloat lblX = (kScreenW - lblW) * 0.5;
    lbl.frame = CGRectMake(lblX, lblY, lblW, lblH);
    [keyWindow addSubview:lbl];
    NSLog(@"显示");
        //通过GCD方式延迟执行 移除lbl
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSLog(@"隐藏");
        toast.isShowing = NO;
        [lbl removeFromSuperview];
    });
        
    }
}


@end
