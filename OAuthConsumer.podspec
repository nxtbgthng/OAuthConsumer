Pod::Spec.new do |s|
  s.name     = 'OAuthConsumer'
  s.version  = '0.1.1'
  s.license  = 'MIT'
    
  s.summary  = 'An OAuth Consumer implementation in Objective-C.'
  s.homepage = 'https://github.com/nxtbgthng/OAuth2Client'
  s.author   = { 'nxtbgthng' => 'team@nxtbgthng.com'}
  s.source   = { :git => 'https://github.com/nxtbgthng/OAuthConsumer.git', :tag => "v#{s.version}" }
  s.source_files = '*.{h,m}', 'Crypto/*.{h,c}'
  s.frameworks = 'Security'
  s.requires_arc = false
end
