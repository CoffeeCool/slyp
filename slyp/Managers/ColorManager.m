//
//  ColorManager.m
//  
//
//  Created by Coffee on 15/10/20.
//
//

#import "ColorManager.h"

@interface ColorManager()

@end

@implementation ColorManager
SYNTHESIZE_SINGLETON_FOR_CLASS(ColorManager)

#pragma mark - manager get methods

- (NSInteger)getEndHue
{
    return 220;
}

- (NSInteger)getStartHue
{
    return 210;
}


@end
