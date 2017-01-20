Pod::Spec.new do |s|
  s.name         = "ExtendedUIKit"
  s.version      = "0.0.1"
  s.summary      = "Extensions for the UIKit framework."
  s.homepage     = "https://github.com/daniel-barros/ExtendedUIKit"
  s.license      = { :type => "MIT", :file => "LICENSE.md" }
  s.author       = { "Daniel Barros" => "dani.barros@me.com" }
  s.source       = { :git => "https://github.com/daniel-barros/ExtendedUIKit.git", :tag => s.version }

  s.ios.deployment_target = "9.0"
  s.watchos.deployment_target = "2.0"

  s.source_files  = "Sources/**/*.{h,swift}"
  s.requires_arc = true
  s.dependencies =
end
