#
#  Be sure to run `pod spec lint WJClassExtensions.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://guides.cocoapods.org/syntax/podspec.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |spec|
  
  spec.name         = "WJClassExtensions"
  spec.version      = "0.0.1"
  spec.summary      = "简单常用的OC系统类扩展"
  spec.description  = <<-DESC "简单常用的OC系统类扩展"
                   DESC
  spec.homepage     = "https://github.com/loyalwind/WJClassExtensions"
  spec.license      = "MIT"
  spec.author       = { "PengWeiJian" => "loyalwind@163.com" }
  spec.platform     = :ios, "8.0"
  spec.requires_arc = true

  #  When using multiple platforms
  # spec.ios.deployment_target = "5.0"
  # spec.osx.deployment_target = "10.7"
  # spec.watchos.deployment_target = "2.0"
  # spec.tvos.deployment_target = "9.0"

  # ――― Source Location ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  spec.source       = { :git => "https://github.com/loyalwind/WJClassExtensions.git", :tag => "#{spec.version}" }


  # ――― Source Code ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  CocoaPods is smart about how it includes source code. For source files
  #  giving a folder will include any swift, h, m, mm, c & cpp files.
  #  For header files it will include any header in the folder.
  #  Not including the public_header_files will make all headers public.
  #

  spec.source_files  = 'WJClassExtensions/WJClassExtensions.h'

  # spec.public_header_files = "Classes/**/*.h"


  # ――― Resources ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  # spec.resource  = "icon.png"
  # spec.resources = "Resources/*.png"

  spec.subspec 'NSObject+WJExtension' do |ss|
    ss.source_files = 'WJClassExtensions/NSObject+WJExtension.{h,m}'
  end

  spec.subspec 'NSString+WJExtension' do |ss|
    ss.source_files = 'WJClassExtensions/NSString+WJExtension.{h,m}'
  end
    
  spec.subspec 'UIDevice+WJExtension' do |ss|
    ss.source_files = 'WJClassExtensions/UIDevice+WJExtension.{h,m}'
    ss.resource     = 'WJClassExtensions/UIDevice+WJExtension.plist'
  end

  spec.subspec 'UIImage+WJExtension' do |ss|
    ss.source_files = 'WJClassExtensions/UIImage+WJExtension.{h,m}'
  end

  spec.subspec 'UIView+WJExtension' do |ss|
    ss.source_files = 'WJClassExtensions/UIView+WJExtension.{h,m}'
  end

  spec.subspec 'UIViewController+WJExtension' do |ss|
    # ss.dependency 'WJClassExtensions/UIView+WJExtension'
    ss.source_files = 'WJClassExtensions/UIViewController+WJExtension.{h,m}'
  end

  # spec.subspec 'NSURLSession' do |ss|
  #   ss.dependency 'AFNetworking/Serialization'
  #   ss.ios.dependency 'AFNetworking/Reachability'
  #   ss.osx.dependency 'AFNetworking/Reachability'
  #   ss.tvos.dependency 'AFNetworking/Reachability'
  #   ss.dependency 'AFNetworking/Security'

  #   ss.source_files = 'AFNetworking/AF{URL,HTTP}SessionManager.{h,m}', 'AFNetworking/AFCompatibilityMacros.h'
  # end

  # spec.preserve_paths = "FilesToSave", "MoreFilesToSave"


  # ――― Project Linking ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Link your library with frameworks, or libraries. Libraries do not include
  #  the lib prefix of their name.
  #

  # spec.framework  = "SomeFramework"
  # spec.frameworks = "SomeFramework", "AnotherFramework"

  # spec.library   = "iconv"
  # spec.libraries = "iconv", "xml2"


  # ――― Project Settings ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  If your library depends on compiler flags you can set them in the xcconfig hash
  #  where they will only apply to your library. If you depend on other Podspecs
  #  you can include multiple dependencies to ensure it works.

  # spec.requires_arc = true

  # spec.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
  # spec.dependency "JSONKit", "~> 1.4"

end
