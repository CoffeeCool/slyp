//
//  BlurredColorBackgroundView.m
//  
//
//  Created by Coffee on 15/10/18.
//
//

#import "BlurredColorBackgroundView.h"
#import "ColorManager.h"
#define timerScheduledTimeInterval 1.0f
@interface BlurredColorBackgroundView()

@property (strong, nonatomic) CAGradientLayer *gradientLayer;
@end

@implementation BlurredColorBackgroundView

#pragma mark - life cycle

- (instancetype)init
{
    self = [super initWithFrame:CGRectMake(0, 0, kScreen_Width, kScreen_Height)];
    if (self) {
        self.backgroundColor = [UIColor blueColor];
        [self.layer addSublayer:self.gradientLayer];
        [self startTimer];
    }
    return self;
}

#pragma mark - event response

- (void)timerEvent
{
    //定时改变颜色
    self.gradientLayer.colors = @[(__bridge id)[UIColor clearColor].CGColor,
                                  (__bridge id)[UIColor colorWithRed:arc4random() % 255 / 255.0
                                                               green:arc4random() % 255 / 255.0
                                                                blue:arc4random() % 255 / 255.0
                                                               alpha:1.0].CGColor];
    
    //定时改变分割点
    self.gradientLayer.locations = @[@(arc4random() % 10 / 10.0f), @(1.0f)];
}
#pragma mark - private methods
//启动计时器
- (void)startTimer
{
    [NSTimer scheduledTimerWithTimeInterval:timerScheduledTimeInterval
                                     target:self
                                   selector:@selector(timerEvent)
                                   userInfo:nil
                                    repeats:YES];;
}

#pragma getters and setters

- (CAGradientLayer *)gradientLayer
{
    if (!_gradientLayer) {
        _gradientLayer = [CAGradientLayer layer];
        _gradientLayer.frame = self.bounds;
        //设置渐变颜色方向
        _gradientLayer.startPoint = CGPointMake(0, 0);
        _gradientLayer.endPoint = CGPointMake(0, 1);
        //设定颜色组
        _gradientLayer.colors = @[(__bridge id)[UIColor clearColor].CGColor,
                                      (__bridge id)[UIColor purpleColor].CGColor];
        //设定颜色分割点
        _gradientLayer.locations = @[@(0.5f) ,@(1.0f)];
    }
    return _gradientLayer;
}

@end
