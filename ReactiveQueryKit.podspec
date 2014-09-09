Pod::Spec.new do |spec|
  spec.name = 'ReactiveQueryKit'
  spec.version = '0.1.0'
  spec.summary = 'ReactiveCocoa extensions for QueryKit.'
  spec.homepage = 'http://querykit.org/'
  spec.license = { :type => 'BSD', :file => 'LICENSE' }
  spec.author = { 'Kyle Fuller' => 'inbox@kylefuller.co.uk' }
  spec.social_media_url = 'http://twitter.com/QueryKit'
  spec.source = { :git => 'https://github.com/QueryKit/ReactiveQueryKit.git', :tag => "#{spec.version}" }
  spec.source_files = 'ReactiveQueryKit/*.{h}', 'ReactiveQueryKit/ObjectiveC/*.{h,m}'
  spec.requires_arc = true
  spec.dependency 'ReactiveCocoa', '~> 2.0'
  spec.dependency 'QueryKit'
end

