//
//  BlurredColorBackgroundView.m
//  
//
//  Created by Coffee on 15/10/18.
//
//

#import "BlurredColorBackgroundView.h"

@interface BlurredColorBackgroundView()

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




@end
