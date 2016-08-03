//
//  LabColor.h
//  LabColorSpaceExplorer
//
//  Created by LinBq on 16/8/3.
//  Copyright © 2016年 BqLin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LabColor : NSObject

// LAB 颜色空间
@property (nonatomic, assign) double lComponent;
@property (nonatomic, assign) double aComponent;
@property (nonatomic, assign) double bComponent;

// RGB 颜色空间
@property (nonatomic, assign, readonly) double redComponent;
@property (nonatomic, assign, readonly) double greenComponent;
@property (nonatomic, assign, readonly) double blueComponent;

@property (nonatomic, strong, readonly) UIColor *color;


@end
