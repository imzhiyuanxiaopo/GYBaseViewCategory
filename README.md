# GYBaseViewCatogary
很多时候在初始化控件要对其有一些设置。之前是使用了方法进行设置，例如添加一个工具类，设置一个类方法对label进行设置。参数里大多包涵text,textColor,align,font等等的设置。但是有的时候可能我们只想设置一个文字，并不关心其他属性，而且不想让代码过于冗余。因此使用链式编程来进行设置。

这个库顺便为UITextView添加了placeHolder,使用kvc对textView的私有属性进行的赋值。
UIimageview暂时没想到添加什么。

如果一屏展示超过30个圆角，请谨慎使用UIView分类下的设置圆角。暂时没有使用高效化的圆角，会造成离屏渲染。

导入：
在podfile内添加    pod 'GYBaseViewCategory'

或者下载源码，将"View"文件夹拖入您的项目 ，并在需要使用的地方 #import "GYBaseViewHeader.h"

使用方法：
```
UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(0, 0, 300, 40)];
    textView
    .gyPlaceHolder(@"adsfasdfasdf")
    .gyPlaceHolderColor(UIColor.darkGrayColor)
    .gyBorderWidth(5)
    .gyBorderColor(UIColor.redColor);
    [self.view addSubview:textView];
```
