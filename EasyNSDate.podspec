Pod::Spec.new do |spec|
  spec.name         = 'EasyNSDate'
  spec.version      = '0.0.2'
  spec.license      = { :type => 'MIT' }
  spec.homepage     = 'http://jeffsuke.hatenablog.com/'
  spec.authors      = { 'Yusuke Kawanabe' => 'ysk.kwnb.915@gmail.com' }
  spec.summary      = 'Easiest NSDate.'
  spec.source       = { :git => 'https://github.com/jeffsuke/EasyNSDate.git',  :tag => "0.0.1"}
  spec.source_files = 'NSDate+EasierUtility.{h,m},NSDateFormatter+EasierUtility.{h,m}'
  spec.framework    = 'SystemConfiguration'
  spec.requires_arc = true
end
