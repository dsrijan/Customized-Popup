#
# Be sure to run `pod lib lint Customized-Popup.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'Customized-Popup'
  s.version          = '0.1.0 '
  s.summary          = 'Customized-Popup. Hello this is my first project in cocoapod. '

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      =  <<-DESC

Customized popup : One of the most customized popup with custom view inside the popup. You can show map, image and texts inside your popup. Easy to maintain
                       DESC

  s.homepage         = 'https://github.com/dsrijan/Customized-Popup'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'dsrijan' => 'srijan12345@gmail.com' }
  s.source           = { :git => 'https://github.com/dsrijan/Customized-Popup.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = "CustomizedPopup/**/*.swift"
  
  # s.resource_bundles = {
  #   'Customized-Popup' => ['Customized-Popup/Assets/*.png']i
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
