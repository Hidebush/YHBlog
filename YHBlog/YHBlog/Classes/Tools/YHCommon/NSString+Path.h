//
//  NSString+Path.h
//  
//
//  Created by 郭月辉 on 16/8/2.
//  Copyright © 2016年 Theshy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Path)

/// 给当前文件追加文档路径
- (NSString *)yh_appendDocumentDir;

/// 给当前文件追加缓存路径
- (NSString *)yh_appendCacheDir;

/// 给当前文件追加临时路径
- (NSString *)yh_appendTempDir;

@end
