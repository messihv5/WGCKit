Pod::Spec.new do |s|
  s.name         = "WGCKit"
  s.version      = "0.0.1"
  s.summary      = "A basic tool kit. "

  s.description  = <<-DESC
  A common used tool kit.
                   DESC

  s.homepage     = "https://github.com/messihv5/WGCKit"

  s.license      = "MIT"

  s.author       = "messihv5"


  s.platform     = :ios, "7.0"

  s.source       = { :git => "https://github.com/messihv5/WGCKit.git", :tag => "0.0.1"  }

  s.source_files  = 'Headers/*.h'
  s.public_header_files = 'Headers/*.h'

  s.subspec 'Views' do |ss|
    ss.source_files = 'Views/*.{h,m}'
  end

  s.subspec 'Controllers' do |ss|
    ss.source_files = 'Controllers/*.{h,m}'
  end

  s.requires_arc = true

  s.dependency "MBProgressHUD"
  s.dependency "MJRefresh"
  s.dependency "YYKit"

end
