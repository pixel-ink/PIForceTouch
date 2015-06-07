Pod::Spec.new do |s|

  s.name         = "PIForceTouch"
  s.version      = "0.1.2"
  s.summary      = "Force Touch for iOS (swift)"
  s.homepage     = "https://github.com/pixel-ink/PIForceTouch"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "pixelink" => "https://github.com/pixel-ink" }
  s.social_media_url   = "http://twitter.com/pixelink_jp"
  s.ios.deployment_target = "8.0"
  s.source       = { :git => "https://github.com/pixel-ink/PIForceTouch.git", :tag => s.version }
  s.source_files  = "**/PIForceTouchView.swift"

end