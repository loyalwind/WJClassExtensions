# WJClassExtensions
常用系统类扩展
包含了下面系统类扩展
  'WJClassExtensions/NSObject+WJExtension'
  'WJClassExtensions/NSString+WJExtension'
  'WJClassExtensions/UIDevice+WJExtension'
  'WJClassExtensions/UIImage+WJExtension'
  'WJClassExtensions/UIView+WJExtension'
  'WJClassExtensions/UIViewController+WJExtension'

+ 集成全部类扩展
```ruby
pod 'WJClassExtensions', '~> 0.0.2'
代码中使用 
#import <WJClassExtensions/WJClassExtensions.h>
```

+ 或者只集成需要的类扩展

```ruby
pod 'WJClassExtensions/NSObject+WJExtension', '~> 0.0.2'
pod 'WJClassExtensions/UIDevice+WJExtension', '~> 0.0.2'
代码中使用
#import <WJClassExtensions/UIDevice+WJExtension.h>
```