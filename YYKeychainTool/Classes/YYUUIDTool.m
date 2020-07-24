//
//  YYUUIDTool.m
//  YYKeychainTool_Example
//
//  Created by yesdgq on 2020/7/24.
//  Copyright © 2020 yesdgq@yahoo.com. All rights reserved.
//

#import "YYUUIDTool.h"
#import "YYKeychainManager.h"

static NSString *const KEY_YYUUIDTOOL = @"KEY_YYUUIDTOOL";

@implementation YYUUIDTool

+ (NSString *)getUUID
{
    NSString *uuidStr = [YYKeychainManager load:KEY_YYUUIDTOOL];
    
    if ([uuidStr isEqualToString:@""] || !uuidStr) {
        
        CFUUIDRef uuidRef = CFUUIDCreate(kCFAllocatorDefault);
        
        uuidStr = (NSString *)CFBridgingRelease(CFUUIDCreateString(kCFAllocatorDefault, uuidRef));
        
        CFRelease(uuidRef);
        
        [YYKeychainManager save:KEY_YYUUIDTOOL data:uuidStr];
    }
    
    return [uuidStr stringByReplacingOccurrencesOfString:@"-" withString:@""];
}

@end
