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
    .gyPlaceHolder(@"adsfasdfasdf") // 设置占位符
    .gyPlaceHolderColor(UIColor.darkGrayColor) // 设置占位符颜色
    .gyBorderWidth(5) // 设置边线
    .gyBorderColor(UIColor.redColor); // 边线颜色  有设置16进制颜色方法
    [self.view addSubview:textView];
```
```
__weak typeof(self) weakSelf = self;
    UIButton *button = (UIButton *)UIButton.new
    .gyNormalText(@"我是按钮") // 设置normal状态文字
    .gySelectedText(@"我不是按钮了") // 设置选中状态的文字
    .gyHighlightedText(@"我又特么是按钮了") // 高亮状态文字
    .gyNormalTextHexColor(0x518369) // 设置文字16进制颜色（通过color设置颜色另有方法）
    .gySelectedTextHexColor(0x53ab11) // 设置按钮选中文字颜色
    .gyHighlightedTextColor(UIColor.purpleColor) // 设置高亮文字颜色
    .gyTouchInside(^(UIButton *button){ // 添加UIControlEventTouchUpInside的点击方法 注意循环引用问题
        __strong typeof(weakSelf) storngSelf = weakSelf;  // 注意循环引用问题
        NSLog(@"点击了按钮");
        AViewController *viewController = AViewController.new;
        viewController.view.gyBackgroundColor(UIColor.whiteColor);
//        [storngSelf presentViewController:viewController animated:YES completion:nil];
        button.gyButtonState(UIControlStateSelected);
    })
    .gyTouchOutside(^(UIButton *button){ // 添加UIControlEventTouchUpOutside的点击方法 注意循环引用问题
        __strong typeof(weakSelf) storngSelf = weakSelf; // 注意循环引用问题
        NSLog(@"点击了按钮  如果点击超出边界");
        AViewController *viewController = AViewController.new;
        viewController.view.gyBackgroundColor(UIColor.whiteColor);
        [storngSelf presentViewController:viewController animated:YES completion:nil];
    })
    .gyBackgroundColor(UIColor.yellowColor); // 修改背景色（uiview分类 返回的是uiview  所以初始化时使用了(UIButton *)强行转换  取消警告  button分类后添加了设置背景色的方法）
    button.frame = CGRectMake(0, 300, 300, 40);
    [self.view addSubview:button];
```
```
__weak typeof(self) weakself = self;
    UILabel *label = (UILabel *)UILabel.new
    .gyText(@"asdfasdf") // 设置label文字
    .gyTextColor(UIColor.greenColor) // 设置文字颜色
    .gyBackgroundColor(UIColor.purpleColor) // 背景色
    .gyGestureTap(^(UITapGestureRecognizer *gesture){ // 点击事件  注意循环引用
        NSLog(@"短按");
    })
    .gyGestureLongPress(^(UILongPressGestureRecognizer *gesture){ // 长按事件 注意循环引用
        __strong typeof(weakself) strongSelf = weakself;
        NSLog(@"长按");
        [strongSelf dismissViewControllerAnimated:YES completion:nil];
    })
    .gyGestureLongPressDuratime(1.5); // 设置长按事件事件  如果添加在前面会无效 暂时考虑如果设置时间就有长按方法 
    label.frame = CGRectMake(0, 400, 300, 40);
    [self.view addSubview:label];
```
暂时支持UILabel   UIButton   UITextField   UITextView几个控件，并对textview添加了placeholder属性，使用方式类似于uitextfiled甚至更加简便。
全是基于链式编程，如果有不了解的属性去对应控件的声明文件看即可。
