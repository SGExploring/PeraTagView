#
# Be sure to run `pod lib lint PeraTagView.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'PeraTagView'
  s.version          = '1.0.0'
  s.summary          = 'PeraTagView.'


 # s.description      = ‘不规则标签排序’

  s.homepage         = 'https://github.com/SGExploring/PeraTagView'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'SGExploring' => '18600707086@163.com' }
  s.source           = { :git => 'https://github.com/SGExploring/PeraTagView.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'PeraTagView/Classes/**/*'
  
  # s.resource_bundles = {
  #   'PeraTagView' => ['PeraTagView/Assets/*.png']
  # }

  s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit', 'Foundation'
  s.dependency 'Masonry'end
