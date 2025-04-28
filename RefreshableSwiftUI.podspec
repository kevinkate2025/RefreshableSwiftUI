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
  s.description      = 'A SwiftUI component for pull-to-refresh and load-more using MJRefresh.'
  s.homepage         = 'https://github.com/kevinkate2025/RefreshableSwiftUI'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Kevin Kate' => 'kevinkate2025@gmail.com' }
  s.source           = { :git => 'git@github.com:kevinkate2025/RefreshableSwiftUI.git', :tag => s.version.to_s }
  s.swift_version = '6.0'
  s.ios.deployment_target = '16.0'
  
  s.source_files = 'RefreshableSwiftUI/Classes/*'
  
  s.dependency 'MJRefresh'
end
