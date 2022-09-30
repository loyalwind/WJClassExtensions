//
//  NSString+WJExtension.m
//  WJClassExtensions
//
//  Created by loyalwind on 16/3/17.
//  Copyright © 2016年 loyalwind. All rights reserved.
//

#import "NSString+WJExtension.h"
#import <CommonCrypto/CommonDigest.h>
#import <CommonCrypto/CommonCryptor.h>
#import <Security/Security.h>

typedef NS_ENUM(uint32_t, DES3Operation) {
    DES3OperationEncrypt = kCCEncrypt,
    DES3OperationDecrypt = kCCDecrypt
};

typedef NS_ENUM(NSInteger, DES3StringType) {
    DES3StringTypeBase64 = 0,
    DES3StringTypeHex = 1
};

@implementation NSString (UTF8)
- (NSString *)encodingByAddingPercent {
    return [self.stringByRemovingPercentEncoding stringByAddingPercentEncodingWithAllowedCharacters:NSCharacterSet.URLQueryAllowedCharacterSet];
}
@end

@implementation NSString (MD5)

- (NSString *)md5
{
    const char *str = [self UTF8String];
    uint32_t    len = (uint32_t)strlen(str);
    
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    
    CC_MD5(str, len, result);
    NSMutableString *ret = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH];
    for(int i = 0; i<CC_MD5_DIGEST_LENGTH; i++) {
        [ret appendFormat:@"%02X",result[i]];
    }
    return ret;
}
+ (NSString *)randomNum
{
    // 部署用这个
    NSMutableString *random = [NSMutableString string];
    for (NSInteger i = 0; i < 6; i++) {
        random = (NSMutableString *)[random stringByAppendingString:[NSString stringWithFormat:@"%u",arc4random_uniform(10)]];
    }
    return random;
}
@end

//偏移量
#define gIv @"DESede"
#ifdef NEEDOFFSET
#define vinitVec (const void *)[gIv UTF8String]
#else
#define  vinitVec nil
#endif

@implementation NSString (TripleDES)
#pragma mark - 普通字符串加密、解密
//字符串
- (NSString *)des3EncryptWithKey:(NSString *)key
{
    return [self des3EncryptWithByteKey:key.UTF8String];
}
- (NSString *)des3DecryptWithKey:(NSString *)key
{
    return [self des3DecryptWithByteKey:key.UTF8String];
}

- (NSString *)des3EncryptWithByteKey:(const void *)key
{
    return [self _des3Operation:DES3OperationEncrypt key:key type:DES3StringTypeBase64];
}
- (NSString *)des3DecryptWithByteKey:(const void *)key
{
    return [self _des3Operation:DES3OperationDecrypt key:key type:DES3StringTypeBase64];
}

#pragma mark - Hex 字符串加密解密操作
- (NSString *)des3EncryptHexWithKey:(NSString *)key
{
    return [self des3EncryptHexWithByteKey:key.UTF8String];
}
- (NSString *)des3DecryptHexWithKey:(NSString *)key
{
    return [self des3DecryptHexWithByteKey:key.UTF8String];
}

- (NSString *)des3EncryptHexWithByteKey:(const char *)key
{
    return [self _des3Operation:DES3OperationEncrypt key:key type:DES3StringTypeHex];
}
- (NSString *)des3DecryptHexWithByteKey:(const char *)key
{
    return [self _des3Operation:DES3OperationDecrypt key:key type:DES3StringTypeHex];
}

#pragma mark - 公共私有方法
- (NSString *)_des3Operation:(DES3Operation)operation key:(const void *)key type:(DES3StringType)type
{
    if (key == NULL) return nil;
    
    //把string 转NSData
    NSData *data = nil;
    if (operation == kCCEncrypt) { // 加密
        data = [self dataUsingEncoding:NSUTF8StringEncoding];
    }else{ // 解密
        operation = kCCDecrypt;

        if (type == DES3StringTypeBase64) { // base64 字符串 --> NSData
            data = [[NSData alloc] initWithBase64EncodedString:self options:NSDataBase64DecodingIgnoreUnknownCharacters];
        }else { // 十六进制字符串 --> NSData
            long len                  = self.length / 2;
            unsigned char *buf        = malloc(len);
            unsigned char *whole_byte = buf;
            char byte_chars[3]        = {'\0','\0','\0'};
            
            for (int i=0; i < len; i++) {
                byte_chars[0] = [self characterAtIndex:i*2];
                byte_chars[1] = [self characterAtIndex:i*2+1];
                *whole_byte   = strtol(byte_chars, NULL, 16);
                whole_byte++;
            }
            data = [NSData dataWithBytes:buf length:len];
            // 释放内存
            free(buf);
        }
    }
    
    //length
    size_t plainTextBufferSize = [data length];
    const void *vplainText     = [data bytes];
    
    //    CCCryptorStatus ccStatus;
    uint8_t *bufferPtr = NULL;
    size_t bufferPtrSize = 0;
    size_t movedBytes = 0;
    
    bufferPtrSize = (plainTextBufferSize + kCCBlockSize3DES) & ~(kCCBlockSize3DES - 1);
    bufferPtr = malloc( bufferPtrSize * sizeof(uint8_t));
    memset((void *)bufferPtr, 0x0, bufferPtrSize);
    
    const void *vkey = key;
    //偏移量
    //    const void *vinitVec = (const void *) [gIv UTF8String];
    
    //配置CCCrypt
    CCCrypt(operation,
            kCCAlgorithm3DES, //3DES
            kCCOptionECBMode|kCCOptionPKCS7Padding, //设置模式
            vkey,    //key
            kCCKeySize3DES,
            vinitVec,     //偏移量，这里不用，设置为nil;不用的话，必须为nil,不可以为@""
            vplainText,
            plainTextBufferSize,
            (void *)bufferPtr,
            bufferPtrSize,
            &movedBytes);
    
    NSString *result = nil;
    if (operation == kCCEncrypt) {
        NSData *encryptData = [NSData dataWithBytes:(const void *)bufferPtr length:(NSUInteger)movedBytes];
        if (type == DES3StringTypeBase64) {
            result = [encryptData base64EncodedStringWithOptions:NSDataBase64Encoding76CharacterLineLength];
        }else{
            NSUInteger          len    = [encryptData length];
            char *              chars  = (char *)[encryptData bytes];
            NSMutableString *hexString = [NSMutableString string];
            for(NSUInteger i = 0; i < len; i++ ){
                [hexString appendString:[NSString stringWithFormat:@"%0.2hhx", chars[i]]];
            }
            result = hexString;
        }
    }else{
        NSData *decryptData = [NSData dataWithBytes:(const void *)bufferPtr length:(NSUInteger)movedBytes];
        result = [[NSString alloc] initWithData:decryptData encoding:NSUTF8StringEncoding];
    }
    // 释放内存
    free(bufferPtr);
    return result;
}
@end
