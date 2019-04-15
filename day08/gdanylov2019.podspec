#
# Be sure to run `pod lib lint gdanylov2019.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'gdanylov2019'
  s.version          = '3.5.0'
  # s.version          = '4.0.1'
  s.summary          = 'A short description of gdanylov2019.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/AnnyDanny'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'AnnyDanny' => 'anndann2201@gmail.com' }
  s.source           = { :git => 'https://github.com/AnnyDanny/gdanylov2019.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'gdanylov2019/Classes/**/*'
   s.resources = 'gdanylov2019/Assets/*.xcdatamodeld'
  
  # s.resource_bundles = {
  #   'gdanylov2019' => ['gdanylov2019/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
  s.frameworks = 'CoreData'
end
