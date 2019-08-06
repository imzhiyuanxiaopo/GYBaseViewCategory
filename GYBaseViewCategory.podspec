Pod::Spec.new do |spec|

  spec.name         = "GYBaseViewCategory"
  spec.version      = "0.0.1"
  spec.summary      = "视图分类"
  spec.description  = "常见视图的一些设置，采用链式编程。UITextView添加了placeholder"

  spec.homepage     = "https://github.com/imzhiyuanxiaopo/GYBaseViewCategory"

 spec.license      = "MIT"
 #spec.license      = { :type => "MIT", :file => "FILE_LICENSE" }

  spec.author             = { "gzy1992123" => "872598520@qq.com" }
  spec.authors            = { "gzy1992123" => "872598520@qq.com" }
  spec.platform     = :ios, "9.0"

  spec.source       = { :git => "https://github.com/imzhiyuanxiaopo/GYBaseViewCategory.git", :tag => "#{spec.version}" }

spec.source_files  = "GYBaseViewCategory/View/*.{h,m}"
  #spec.exclude_files = "Classes/Exclude"

end
