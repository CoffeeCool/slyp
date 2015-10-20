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
    
        [self.layer addSublayer:self.gradientLayer];
        [self performAnimation];
    }
    return self;
}

#pragma mark - private methods
//执行动画
- (void)performAnimation
{
    NSMutableArray *shiftedColors = [[_gradientLayer colors] mutableCopy];
    shiftedColors = (NSMutableArray *)[[shiftedColors reverseObjectEnumerator] allObjects];
    [_gradientLayer setColors:shiftedColors];
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"colors"];
    [animation setToValue:shiftedColors];
    [animation setDuration:10.0f];
    [animation setRemovedOnCompletion:YES];
    [animation setFillMode:kCAFillModeForwards];
    [animation setDelegate:self];
    [_gradientLayer addAnimation:animation forKey:@"animateGradient"];
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    [self performAnimation];
}

#pragma getters and setters

- (CAGradientLayer *)gradientLayer
{
    if (!_gradientLayer) {
        _gradientLayer = [CAGradientLayer layer];
        _gradientLayer.frame = self.bounds;
        //设置渐变颜色方向
        _gradientLayer.startPoint = CGPointMake(0, 0);
        _gradientLayer.endPoint = CGPointMake(1, 1);
        //设定颜色组
        NSMutableArray *colors = [NSMutableArray array];
        for (NSInteger hue = [[ColorManager sharedColorManager] getStartHue]; hue < [[ColorManager sharedColorManager] getEndHue]; hue += 0.1) {
            UIColor *color = [UIColor colorWithHue:1.0 * hue / 360.0
                               saturation:1.0
                               brightness:1.0
                                    alpha:1.0];
            [colors addObject:(id)[color CGColor]];
        }
        _gradientLayer.colors = colors;
        //设定颜色分割点
//        _gradientLayer.locations = @[@(0.25), @(0.5), @(0.75)];
    }
    return _gradientLayer;
}

@end
