//
//  NSObject+Extension.h
//  WJClassExtensions
//
//  Created by loyalwind on 2018/12/18.
//
//

#import <Foundation/Foundation.h>

@interface NSObject (WJExtension)

/**
 转成JSON对象， NSDictionary, NSArray
 */
- (id)toJSONObject;
/**
 转成JSON对象， NSDictionary, NSArray
 @param error 如果出现错误，错误信息会放在error里面
 */
- (id)toJSONObjectWithError:(NSError **)error;

/**
 转成Data， NSData *
 */
- (NSData *)toJSONData;
/**
 转成Data， NSData *
 @param error 如果出现错误，错误信息会放在error里面
 */
- (NSData *)toJSONDataWithError:(NSError **)error;

/**
 转成json格式字符串
 */
- (NSString *)toJSONString;
/**
 转成json格式字符串
 @param error 如果出现错误，错误信息会放在error里面
 */
- (NSString *)toJSONStringWithError:(NSError **)error;

@end
