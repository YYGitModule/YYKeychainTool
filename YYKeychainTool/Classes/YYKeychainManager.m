//
//  YYKeychainManager.m
//  YYKeychainTool_Example
//
//  Created by yesdgq on 2020/7/24.
//  Copyright © 2020 yesdgq@yahoo.com. All rights reserved.
//

#import "YYKeychainManager.h"

@implementation YYKeychainManager

+ (NSMutableDictionary *)getKeychainQuery:(NSString *)service
{
    return [NSMutableDictionary dictionaryWithObjectsAndKeys:
            (id)kSecClassGenericPassword,(id)kSecClass,
            service,(id)kSecAttrService,
            service,(id)kSecAttrAccount,
            (id)kSecAttrAccessibleWhenUnlocked,(id)kSecAttrAccessible,
            nil];
}

+ (BOOL)save:(NSString *)service data:(id)data
{
    NSMutableDictionary *keychainQuery = [NSMutableDictionary dictionaryWithDictionary:[self getKeychainQuery:service]];
    //添加新item之前先删除旧item
    SecItemDelete((CFDictionaryRef)keychainQuery);
    
    //在字典中添加新的键值对
    [keychainQuery setObject:[NSKeyedArchiver archivedDataWithRootObject:data] forKey:(id)kSecValueData];
    
    //在keychain中添加新的item
    return SecItemAdd((CFDictionaryRef)keychainQuery, NULL) == noErr;;
}

+ (id)load:(NSString *)service
{
    id uniFlag = nil;
    
    NSMutableDictionary *keychainQuery = [NSMutableDictionary dictionaryWithDictionary:[self getKeychainQuery:service]];
    
    [keychainQuery setObject:(id)kCFBooleanTrue forKey:(id)kSecReturnData];
    [keychainQuery setObject:(id)kSecMatchLimitOne forKey:(id)kSecMatchLimit];
    
    CFDataRef keyData = NULL;
    
    if (SecItemCopyMatching((CFDictionaryRef)keychainQuery,(CFTypeRef *)&keyData) == noErr) {
        
        uniFlag = [NSKeyedUnarchiver unarchiveObjectWithData:(__bridge NSData*)keyData];
        CFRelease(keyData);
    }
    
    return uniFlag;
}

+ (void)deleteKeyData:(NSString *)service
{
    NSMutableDictionary *keychainQuery = [NSMutableDictionary dictionaryWithDictionary:[self getKeychainQuery:service]];
    
    SecItemDelete((CFDictionaryRef )keychainQuery);
}


@end
