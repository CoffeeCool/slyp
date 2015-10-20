//
//  ColorManager.m
//  
//
//  Created by Coffee on 15/10/20.
//
//

#import "ColorManager.h"

@interface ColorManager()

@property (strong, nonatomic) UIColor* baseColor;

@property (strong, nonatomic) UIColor* colorOne;
@property (strong, nonatomic) UIColor* colorTwo;
@property (strong, nonatomic) UIColor* colorThree;

@property (strong, nonatomic) UIColor* currentColor;

@property (strong, nonatomic) NSArray* colorArray;
@end

@implementation ColorManager
SYNTHESIZE_SINGLETON_FOR_CLASS(ColorManager)

#pragma mark - manager get methods

- (UIColor*)getBaseColor
{
    return _baseColor;
}

- (UIColor *)getRandomColor
{
    return _colorArray[arc4random()%([_colorArray count])];
}

#pragma mark - getters and setters

- (UIColor *)baseColor
{
    if (!_baseColor) {
        _baseColor = UIColorFromRGB(0x455a64);
    }
    return _baseColor;
}
- (UIColor *)colorOne
{
    if (!_colorOne) {
        _colorOne = UIColorFromRGB(0x536dfe);
    }
    return _colorOne;
}

- (UIColor *)colorTwo
{
    if (!_colorTwo) {
        _colorTwo = UIColorFromRGB(0x512da8);
    }
    return _colorTwo;
}

- (UIColor *)colorThree
{
    if (!_colorThree) {
        _colorThree = UIColorFromRGB(0x637ab7);
    }
    return _colorThree;
}

- (NSArray *)colorArray
{
    if (!_colorArray) {
        _colorArray = [[NSArray alloc] initWithObjects:_colorOne,_colorTwo,_colorThree, nil];
    }
    return _colorArray;
}

@end
