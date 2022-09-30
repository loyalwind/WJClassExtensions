//
//  NSString+Extension.h
//  WJClassExtensions
//
//  Created by loyalwind on 16/3/17.
//  Copyright © 2016年 loyalwind. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (UTF8)
- (NSString *)encodingByAddingPercent;
@end

// MD5加密
@interface NSString (MD5)
/**
 *  MD5加密
 *
 *  @return 加密后的MD5字符串
 */
- (NSString *)md5;

/**
 *  获取随机6位数字字符串
 *
 *  @return 随机数字字符串
 */
+ (NSString *)randomNum;
@end

// 3DES加密
@interface NSString (TripleDES)

#pragma mark - 字符串加密
#pragma mark - 字符串加密成base64字符串
/**
 *  普通字符串经3DES加密后生成 base64 字符串
 *
 *  @param key (字符节数组)密钥
 *  @return 加密后的base64字符串
 */
- (NSString *)des3EncryptWithByteKey:(const void *)key;

/**
 *  普通字符串经3DES加密后生成 base64 字符串
 *
 *  @param key NSString * 密钥
 *  @return 加密后的base64字符串
 */
- (NSString *)des3EncryptWithKey:(NSString *)key;

#pragma mark - 字符串加密成十六进制字符串
/**
 *  普通字符串经3DES加密后生成十六进制字符串
 *
 *  @param key (字符节数组)密钥
 *  @return 加密后的十六进制
 */
- (NSString *)des3EncryptHexWithByteKey:(const char *)key;

/**
 *  字符串经3DES加密后生成16进制字符串
 *
 *  @param key 密钥
 *  @return 加密后的16进制字符串
 */
- (NSString *)des3EncryptHexWithKey:(NSString *)key;

#pragma mark - 字符串解密
#pragma mark - base64字符串解密成普通字符串
/**
 *  base64 字符串 经3DES加密后生成普通字符串
 *
 *  @param key (字符节数组)密钥
 *  @return 解密后的普通字符串
 */
- (NSString *)des3DecryptWithByteKey:(const void *)key;

/**
 *  base64 字符串经3DES解密后返回 普通字符串
 *
 *  @param key NSString * 密钥
 *  @return 解密后的普通字符串
 */
- (NSString *)des3DecryptWithKey:(NSString *)key;

#pragma mark - 十六进制字符串解密成普通字符串
/**
 *  十六进制 经3DES加密后生成普通字符串
 *
 *  @param key (字符节数组)密钥
 *  @return 解密后的普通字符串
 */
- (NSString *)des3DecryptHexWithByteKey:(const char *)key;

/**
 *  16进制字符串经3DES解密后返回字符串
 *
 *  @param key 密钥
 *  @return 解密后的原始字符串
 */
- (NSString *)des3DecryptHexWithKey:(NSString *)key;
@end
