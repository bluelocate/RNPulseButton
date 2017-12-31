
Pod::Spec.new do |s|
  s.name             = 'RNPulseButton'
  s.version          = '0.5.0'
  s.summary          = 'Easy and Customizable Pulse Animation Effect Button!'
  s.description      = 'Easy and Customizable Pulse Animation Effect Button! Be Simple and convenience.'
  s.homepage         = 'https://github.com/bluelocate/RNPulseButton'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Rodo' => 'planon21@gmail.com' }
  s.source           = { :git => 'https://github.com/bluelocate/RNPulseButton.git', :tag => s.version.to_s }
  s.ios.deployment_target = '9.0'

  s.source_files = 'Sources/*.swift'
  s.frameworks = 'UIKit', 'Foundation'
end
