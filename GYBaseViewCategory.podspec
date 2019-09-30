Pod::Spec.new do |spec|

  spec.name         = "GYBaseViewCategory"
  spec.version      = "0.1.0"
  spec.summary      = "视图分类"
  spec.description  = "常见视图的一些设置，如果一行行去进行设置属性会显得代码麻烦。之前有见到过通过方法设置，但是有的时候又不需要设置那么多属性，方法的参数还需要传nil。因此，采用了链式编程进行属性设置。部分方法在view的分类里，一般是一些通用的属性。部分控件的属性可能没有添加完全，后续会更新。"

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
