//
//  NSString+Base64.h
//  
//
//  Created by 郭月辉 on 16/8/2.
//  Copyright © 2016年 Theshy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Base64)

/// 对当前字符串进行 BASE 64 编码，并且返回结果
- (NSString *)yh_base64Encode;

/// 对当前字符串进行 BASE 64 解码，并且返回结果
- (NSString *)yh_base64Decode;

@end
