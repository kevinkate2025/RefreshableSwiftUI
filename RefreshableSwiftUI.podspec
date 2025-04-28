#
# Be sure to run `pod lib lint RefreshableSwiftUI.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'RefreshableSwiftUI'
  s.version          = '1.0.4'
  s.summary          = 'A SwiftUI component for pull-to-refresh and load-more using MJRefresh.'
  s.description      = <<-DESC
  RefreshableSwiftUI is a SwiftUI component that integrates the popular MJRefresh library to provide
  a seamless pull-to-refresh and load-more functionality in your SwiftUI applications.

  With this component, you can easily add refresh controls to your lists and scroll views,
  enhancing the user experience by allowing users to refresh content or load more data with
  intuitive gestures.

  Key Features:
  - Simple integration with SwiftUI views.
  - Customizable refresh and load-more animations.
  - Supports both vertical and horizontal scrolling.
  - Easy to use with existing SwiftUI data models.

  Ideal for developers looking to implement refreshing capabilities in their SwiftUI applications
  without having to manage the complexity of UIKit components.
DESC
  s.homepage         = 'https://github.com/kevinkate2025/RefreshableSwiftUI'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Kevin Kate' => 'kevinkate2025@gmail.com' }
  s.source           = { :git => 'https://github.com/kevinkate2025/RefreshableSwiftUI.git', :tag => s.version.to_s }
  s.swift_version = '6.0'
  s.ios.deployment_target = '16.0'
  
  s.source_files = 'RefreshableSwiftUI/Classes/*'
  
  s.dependency 'MJRefresh'
end
