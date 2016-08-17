

#import "BBDTimerView.h"

@interface BBDTimerView ()

@property (nonatomic, strong) NSTimer *timer;

// *总时间
@property (nonatomic, assign) float time;

// *剩余时间
@property (nonatomic, assign) float leftTime;

// 画圆是使用的圆心
@property (nonatomic, assign) CGPoint timerCenter;

// 字体大小
@property (nonatomic, assign) UIFont *timerFont;

// 圆环半径
@property (nonatomic, assign) CGFloat timerRadius;

// 圆环线宽
@property (nonatomic, assign) CGFloat timerLineWidth;

// 圆环颜色
@property (nonatomic, strong) UIColor *timerLineColor;

@end



@implementation BBDTimerView

/// 构造方法
- (instancetype)initWithFrame:(CGRect)frame second:(NSInteger)second lineWidth:(int)lineWidth lineColor:(UIColor *)color font:(UIFont *)font
{
    self = [super initWithFrame:frame];
    
    if (self)
    {
        self.timerCenter = CGPointMake(frame.size.width / 2, frame.size.height /2);
        
        self.timerRadius = MIN(self.timerCenter.x, self.timerCenter.y) - self.timerLineWidth;
        
        self.timerLineWidth = lineWidth;
        
        [self.titleLabel setFont:font];
        
        self.timerLineColor = color;
        
        [self setTitleColor:self.timerLineColor forState:UIControlStateNormal];
        
        self.backgroundColor = [UIColor clearColor];
        
        self.leftTime = second;
        
        self.time = second;
        
        // 定时器启动前显示初始时间
        [self refreshWithFirstToken:YES];
        
        // 启动定时器
        self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(refreshWithFirstToken:) userInfo:@"倒计时工具" repeats:YES];
        
        
    }
    
    return self;
}


/// 定时器到时间执行的方法
- (void)refreshWithFirstToken:(BOOL)isFirst
{
    // 刷新文字
    [self setTitle:[NSString stringWithFormat:@"%.0f", self.leftTime] forState:UIControlStateNormal];
    
    // 调用drawRect方法，刷新圆环
    [self setNeedsDisplay];
    
    // 调整文字
    if (self.leftTime > 0)
    {
        self.leftTime --;
    }
    else if (self.leftTime <= 0)
    {
        [self setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        
        [self.timer invalidate];
    }
}

- (void)drawRect:(CGRect)rect
{
    [self drawGrayPath];
    
    [self drawColorPath];
}

//  画彩色线
- (void)drawColorPath
{
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    CGFloat startAngle = - M_PI_2;
    
    CGFloat endAngle = 0;
    
    endAngle = 2 * M_PI * ((self.leftTime) / self.time) + startAngle;
    
    [path addArcWithCenter:self.timerCenter radius:self.timerRadius - self.timerLineWidth startAngle:startAngle endAngle:endAngle clockwise:YES];
    
    path.lineWidth = self.timerLineWidth;
    
    path.lineCapStyle = kCGLineCapRound;
    
    [self.timerLineColor setStroke];
    
    [path stroke];
}

//  画灰色线
- (void)drawGrayPath
{
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    CGFloat startAngle = 0;
    
    CGFloat endAngle = 2 * M_PI;
    
    [path addArcWithCenter:self.timerCenter radius:self.timerRadius - self.timerLineWidth startAngle:startAngle endAngle:endAngle clockwise:NO];
    
    path.lineWidth = self.timerLineWidth;
    
    path.lineCapStyle = kCGLineCapRound;
    
    [[UIColor lightGrayColor] setStroke];
    
    [path stroke];
}

- (void)dealloc
{
    [self.timer invalidate];
}

@end
