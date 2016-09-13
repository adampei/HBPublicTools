//
//  HBToast.h
//  HBLabelAlert
//
//  Created by alex on 16/8/24.
//  Copyright © 2016年 alex. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HBToast : NSObject

@property(nonatomic,assign) BOOL isShowing;



+(void)bb_showStatus:(NSString *)status;
+(void)bb_showStatus:(NSString *)status withTime:(CGFloat)time;
+(void)bb_showWarning:(NSString *)warnging;

@end
