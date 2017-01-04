Pod::Spec.new do |s|
  s.name             = 'Sharaku'
  s.version          = '1.0.0'
  s.summary          = 'Sharaku is an image filtering UI library like Instagram.'
  s.description      = <<-DESC
    Sharaku is an image filtering library like Instagram which is using CIFilter. This library is strongly inspired by Fusuma.
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
