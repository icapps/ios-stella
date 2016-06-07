#
# Be sure to run `pod lib lint Stella.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'Stella'
  s.version          = '0.1.0'
  s.summary          = 'A set of utilities that can be used during iOS development in Swift.'
  s.description      = <<-DESC
Stella contains utlities methods that make it easier for you to code in Swift.

At the moment only some cleaner GCD handling is added to Stella, but this will be expanded in the future.
                       DESC

  s.homepage         = 'https://github.com/icapps/ios-stella'
  s.license          = { type: 'MIT', file: 'LICENSE' }
  s.author           = { 'Jelle Vandebeeck' => 'jelle@fousa.be' }
  s.source           = { git: 'https://github.com/icapps/ios-stella.git', tag: s.version.to_s }
  s.social_media_url = 'https://twitter.com/icapps'

  s.ios.deployment_target = '8.0'
  s.tvos.deployment_target = '9.0'

  s.source_files = 'Sources/**/*'
end
