//
//  LabColor.m
//  LabColorSpaceExplorer
//
//  Created by LinBq on 16/8/3.
//  Copyright © 2016年 BqLin. All rights reserved.
//

#import "LabColor.h"

//static double inverseF(double const t);
static double D65TristimulusValues[3] = {95.047, 100.0, 108.883};
static double inverseF(double const t)
{
	return ((t > 6./29.) ?
			t*t*t :
			3.*(6./29.)*(6./29.)*(t-4./29.));
}

@implementation LabColor

- (void)dealloc{
	NSLog(@"%s", __FUNCTION__);
}

- (instancetype)init{
	if (self = [super init]) {
		_lComponent = 75 + (arc4random_uniform(200) * 0.1 - 10.);
		_aComponent = 0 + (arc4random_uniform(200) * 0.1 - 10.);
		_bComponent = 0 + (arc4random_uniform(200) * 0.1 - 10.);
	}
	return self;
}

- (NSString *)description{
	return [NSString stringWithFormat:@"<%@: %p> \nlab={%g, %g, %g} \nrgb={%g, %g, %g}", [self class], self, self.lComponent, self.aComponent, self.bComponent, self.redComponent, self.greenComponent, self.blueComponent];
}

#pragma mark - RGB 转换
- (double)redComponent{
	return D65TristimulusValues[0] * inverseF(1./116. * (self.lComponent + 16));
}
- (double)greenComponent{
	return D65TristimulusValues[1] * inverseF(1./116. * (self.lComponent + 16) + 1./500.*self.aComponent);
}
- (double)blueComponent{
	return D65TristimulusValues[2] * inverseF(1./116. * (self.lComponent + 16) - 1./200.*self.bComponent);
}
- (UIColor *)color{
	return [UIColor colorWithRed:self.redComponent * 0.01 green:self.greenComponent * 0.01 blue:self.blueComponent * 0.01 alpha:1.];
}

#pragma mark - KVO 属性依赖
+ (NSSet *)keyPathsForValuesAffectingRedComponent{
	return [NSSet setWithObject:@"lComponent"];
}
+ (NSSet *)keyPathsForValuesAffectingGreenComponent{
	return [NSSet setWithObjects:@"lComponent", @"aComponent", nil];
}
+ (NSSet *)keyPathsForValuesAffectingBlueComponent{
	return [NSSet setWithObjects:@"lComponent", @"bComponent", nil];
}
+ (NSSet *)keyPathsForValuesAffectingColor{
	return [NSSet setWithObjects:@"redComponent", @"greenComponent", @"blueComponent", nil];
}
@end


