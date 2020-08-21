#
# Be sure to run `pod lib lint PeraTagView.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'PeraTagView'
  s.version          = '1.0.1'
  s.summary          = 'PeraTagView.'


 # s.description      = ‘头文件’

  s.homepage         = 'https://github.com/SGExploring/PeraTagView'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'SGExploring' => '18600707086@163.com' }
  s.source           = { :git => 'https://github.com/SGExploring/PeraTagView.git', :tag => "v#{s.version}" }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'

  s.source_files = 'PeraTagView/Classes/**/*'
  s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit', 'Foundation'
  s.dependency 'Masonry'
end
