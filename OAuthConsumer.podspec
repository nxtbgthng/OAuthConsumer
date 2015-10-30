Pod::Spec.new do |s|
  s.name     = 'OAuthConsumer'
  s.version  = '0.1.2'
  s.license  = { :type => 'MIT', :file => 'LICENSE' }
    
  s.plattform = :ios, "7.0"
  s.summary  = 'An OAuth Consumer implementation in Objective-C.'
  s.homepage = 'https://github.com/nxtbgthng/OAuthConsumer'
  s.author   = { 'nxtbgthng' => 'team@nxtbgthng.com'}
  s.source   = { :git => 'https://github.com/nxtbgthng/OAuthConsumer.git', :tag => "v#{s.version}" }
  s.source_files = ['NSMutableURLRequest+Parameters.{h,m}', 'OADataFetcher.{h,m}', 'OAServiceTicket.{h,m}', 'NSString+URLEncoding.{h,m}',
                    'OAHMAC_SHA1SignatureProvider.{h,m}' ,'OASignatureProviding.{h,m}',
                    'OAToken+iOSKeychain.{h,m}', 'NSURL+Base.{h,m}' ,'OAMutableURLRequest.{h,m}' ,'OAToken.{h,m}',
                    'OAAsynchronousDataFetcher.{h,m}' ,'OAPlaintextSignatureProvider.{h,m}' ,'OAuthConsumer.{h,m}',
                    'OAConsumer.{h,m}' ,'OARequestParameter.{h,m}', 'Crypto/*.{h,c}']
  s.frameworks = 'Security'
  s.requires_arc = false
end



