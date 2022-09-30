//
//  WJClassExtensions.h
//  WJClassExtensions
//
//  Created by loyalwind on 2022/9/30.
//

#ifndef WJClassExtensions_h
#define WJClassExtensions_h

//#import <FirebaseCore/FirebaseCore.h>

#if !defined(__has_include)
    #error "WJClassExtensions.h won't import anything if your compiler doesn't support __has_include. Please \
          import the headers individually."
#else
    #if __has_include(<WJClassExtensions/NSObject+WJExtension.h>)
        #import <WJClassExtensions/NSObject+WJExtension.h>
    #endif

    #if __has_include(<WJClassExtensions/NSString+WJExtension.h>)
        #import <WJClassExtensions/NSString+WJExtension.h>
    #endif

    #if __has_include(<WJClassExtensions/UIDevice+WJExtension.h>)
        #import <WJClassExtensions/UIDevice+WJExtension.h>
    #endif

    #if __has_include(<WJClassExtensions/UIImage+WJExtension.h>)
        #import <WJClassExtensions/UIImage+WJExtension.h>
    #endif

    #if __has_include(<WJClassExtensions/UIView+WJExtension.h>)
        #import <WJClassExtensions/UIView+WJExtension.h>
    #endif

    #if __has_include(<WJClassExtensions/UIViewController+WJExtension.h>)
        #import <WJClassExtensions/UIViewController+WJExtension.h>
    #endif

    #if __has_include("FirebaseStorage-umbrella.h")
        #import <FirebaseStorage/FirebaseStorage-Swift.h>
    #endif

#endif  // defined(__has_include)

#endif /* WJClassExtensions_h */
