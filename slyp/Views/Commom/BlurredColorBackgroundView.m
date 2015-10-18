//
//  BlurredColorBackgroundView.m
//  
//
//  Created by Coffee on 15/10/18.
//
//

#import "BlurredColorBackgroundView.h"

@interface BlurredColorBackgroundView()

@property (strong, nonatomic) CAGradientLayer *gradientLayer;
@property (strong, nonatomic) NSTimer *timer;
@end

@implementation BlurredColorBackgroundView

#pragma mark - life cycle

- (instancetype)initWithBackgroundColor:(UIColor *)color;
{
    self = [super init];
    if (self) {
        
        self.backgroundColor = color;
    
    }
    return self;
}

#pragma mark - event response

- (void)timerEvent
{
    
}


#pragma getters and setters

- (CAGradientLayer *)gradientLayer
{
    if (!self.gradientLayer) {
        self.gradientLayer = [CAGradientLayer layer];
        self.gradientLayer.frame = self.bounds;
    }
    return self.gradientLayer;
}


- (NSTimer *)timer
{
    if (!self.timer) {
        self.timer = [NSTimer scheduledTimerWithTimeInterval:2.0f
                                                      target:self
                                                    selector:@selector(timerEvent)
                                                    userInfo:nil
                                                     repeats:YES];
    }
    return self.timer;
}

@end
