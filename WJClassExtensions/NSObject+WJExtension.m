//
//  NSObject+Extension.m
//  WJClassExtensions
//
//  Created by boyaa on 2018/12/18.
//
//

#import "NSObject+WJExtension.h"

@implementation NSObject (WJExtension)
#pragma mark - 转换为JSON

- (id)toJSONObject
{
    NSError *error = nil;
    return [self toJSONObjectWithError:&error];
}
- (id)toJSONObjectWithError:(NSError *__autoreleasing *)error
{
    if ([self isKindOfClass:[NSString class]]) {
        NSData *data = [((NSString *)self) dataUsingEncoding:NSUTF8StringEncoding];
        return [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:error];
    } else if ([self isKindOfClass:[NSData class]]) {
        return [NSJSONSerialization JSONObjectWithData:(NSData *)self options:kNilOptions error:error];
    }
    return self;
}

- (NSData *)toJSONData
{
    NSError *error = nil;
    return [self toJSONDataWithError:&error];
}

- (NSData *)toJSONDataWithError:(NSError *__autoreleasing *)error
{
    if ([self isKindOfClass:[NSString class]]) {
        return [((NSString *)self) dataUsingEncoding:NSUTF8StringEncoding];
    } else if ([self isKindOfClass:[NSData class]]) {
        return (NSData *)self;
    }
    
    return [NSJSONSerialization dataWithJSONObject:self.toJSONObject options:kNilOptions error:error];
}

- (NSString *)toJSONString
{
    NSError *error = nil;
    return [self toJSONStringWithError:&error];
}

- (NSString *)toJSONStringWithError:(NSError *__autoreleasing *)error
{
    if ([self isKindOfClass:[NSString class]]) {
        return (NSString *)self;
    } else if ([self isKindOfClass:[NSData class]]) {
        return [[NSString alloc] initWithData:(NSData *)self encoding:NSUTF8StringEncoding];
    }else if ([self isKindOfClass:[NSNumber class]]) {
        return [(NSNumber *)self stringValue];
    }
    NSData *data = [self toJSONDataWithError:error];
    return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
}
@end
