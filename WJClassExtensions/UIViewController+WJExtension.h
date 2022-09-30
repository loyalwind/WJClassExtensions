//
//  UIImagePickerController+Extension.h
//  WJClassExtensions
//
//  Created by loyalwind on 2020/12/31.
//  控制器旋转问题

#import <UIKit/UIKit.h>
#import <StoreKit/StoreKit.h>

NS_ASSUME_NONNULL_BEGIN

//  为了适配iPad 使用相册奔溃问题及，竖屏显示问题
@interface UIImagePickerController (WJExtension)

@end


// 应用内打开 appstore 商城，避免旋转
@interface SKStoreProductViewController (WJExtension)

@end

NS_ASSUME_NONNULL_END
