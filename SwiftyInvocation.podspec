
Pod::Spec.new do |s|
  s.name             = 'SwiftyInvocation'
  s.version          = '0.1.0'
  s.summary          = 'NSInvocation for Swift + helpers'
  s.description      = <<-DESC
Have you ever dreamed about using NSInvocation from Swift code?
You hate Apple for the NS_SWIFT_UNAVAILABLE macro?

Me neither.

But sometimes we just HAVE to use it. And here it is.
                       DESC

  s.homepage         = 'https://github.com/piotr-tobolski/SwiftyInvocation'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'piotr-tobolski' => 'piotr.tobolski@me.com' }
  s.source           = { :git => 'https://github.com/piotr-tobolski/SwiftyInvocation.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/piotrtobolski'

  s.ios.deployment_target = '8.0'

  s.source_files = 'SwiftyInvocation/Classes/**/*'

  s.frameworks = 'Foundation'
end
