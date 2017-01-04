#
# Be sure to run `pod lib lint Sharaku.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'Sharaku'
  s.version          = '0.1.0'
  s.summary          = 'Sharaku is an image filtering library like Instagram.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
    Sharaku is an image filtering library like Instagram.
        DESC

  s.homepage         = 'https://github.com/makomori/Sharaku'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'makomori' => 'makomori26@gmail.com' }
  s.source           = { :git => 'https://github.com/makomori/Sharaku.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/makomori26'

  s.ios.deployment_target = '8.0'

  s.source_files = 'Sharaku/Classes/**/*'
  s.resources = ['Sharaku/Classes/**/*.xib', 'Sharaku/**/*.xcassets']
  s.resource_bundles = {
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
