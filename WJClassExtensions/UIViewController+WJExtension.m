//
//  UIImagePickerController+Extension.m
//  WJClassExtensions
//
//  Created by loyalwind on 2020/12/31.
//

#import "UIViewController+WJExtension.h"

@implementation UIImagePickerController (WJExtension)
- (UIInterfaceOrientationMask)supportedInterfaceOrientations { return UIInterfaceOrientationMaskLandscape;}
- (UIStatusBarStyle)preferredStatusBarStyle { return UIStatusBarStyleLightContent; }
- (BOOL)prefersStatusBarHidden { return YES;}
@end


@implementation SKStoreProductViewController(WJExtension)
- (UIInterfaceOrientationMask)supportedInterfaceOrientations { return UIInterfaceOrientationMaskLandscape;}
- (UIStatusBarStyle)preferredStatusBarStyle { return UIStatusBarStyleLightContent; }
- (BOOL)prefersStatusBarHidden { return YES;}
- (BOOL)shouldAutorotate {return YES;}
@end
