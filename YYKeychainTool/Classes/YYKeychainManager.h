//
//  YYKeychainManager.h
//  YYKeychainTool_Example
//
//  Created by yesdgq on 2020/7/24.
//  Copyright © 2020 yesdgq@yahoo.com. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface YYKeychainManager : NSObject

+ (BOOL)save:(NSString *)service data:(id )data;

+ (id)load:(NSString *)service;

+ (void)deleteKeyData:(NSString *)service;

@end

NS_ASSUME_NONNULL_END
