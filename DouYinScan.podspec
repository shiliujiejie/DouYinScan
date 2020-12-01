

Pod::Spec.new do |s|
  s.name             = 'DouYinScan'
  s.version          = '0.1.1'
  s.summary          = 'A short description of DouYinScan.'
  s.description      = <<-DESC
   DouYinScan isFor Idcard find back, andFor share code create
                       DESC

  s.homepage         = 'https://github.com/shiliujiejie/DouYinScan'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'shiliujiejie' => 'zzhu51499@gmail.com' }
  s.source           = { :git => 'https://github.com/shiliujiejie/DouYinScan.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'

  s.source_files = 'DouYinScan/Classes/**/*'
  s.swift_version = '4.2'
  # s.resource_bundles = {
  #   'DouYinScan' => ['DouYinScan/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
