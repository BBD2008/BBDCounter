# BBDCounter
简单的倒计时View，只需要一行代码就可以创建。

##动画演示

![image](https://github.com/BBD2008/BBDCounter/raw/master/Image/luping.gif)

##导入方式

把BBDCounter文件夹拖到项目中即可使用。

##使用方式

```objective-c
//核心方法

- (instancetype)initWithFrame:(CGRect)frame second:(NSInteger)second lineWidth:(int)lineWidth lineColor:(UIColor *)color font:(UIFont *)font;

//示例代码

BBDTimerView *timerView = [[BBDTimerView alloc] initWithFrame:CGRectMake(x, y, width, height) second:10 lineWidth:3 lineColor:[UIColor colorWithHue:RandomLessOne saturation:RandomLessOneMoreHalf brightness:1.0 alpha:1.0] font:[UIFont systemFontOfSize:17]];

```

##备注

粗糙的小工具，有好的建议可以给我留言。
