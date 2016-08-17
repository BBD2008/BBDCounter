

#define RandomLessOne (arc4random_uniform(256)/256.0)
#define RandomLessOneMoreHalf (arc4random_uniform(1)/4.0 + 0.75)

#import "ViewController.h"
#import "BBDTimerView.h"

@interface ViewController ()

@end

@implementation ViewController

- (IBAction)begin
{
    CGFloat margin = 20;
    int column = 3;
    CGFloat width = 40;
    CGFloat height = 40;
    CGFloat x = margin;
    CGFloat y = margin;
    
    for (int i = 0; i < 12; i++)
    {
        x = margin + (margin + width) * (i % column);
        y = margin + (margin + height) * (i / column);
        
        // 构造方法
        BBDTimerView *timerView = [[BBDTimerView alloc] initWithFrame:CGRectMake(x, y, width, height) second:10 lineWidth:3 lineColor:[UIColor colorWithHue:RandomLessOne saturation:RandomLessOneMoreHalf brightness:1.0 alpha:1.0] font:[UIFont systemFontOfSize:17]];
        
        [self.view addSubview:timerView];
    }
    
}

@end
