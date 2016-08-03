//
//  ViewController.m
//  LabColorSpaceExplorer
//
//  Created by LinBq on 16/8/3.
//  Copyright © 2016年 BqLin. All rights reserved.
//

#import "ViewController.h"
#import "LabColor.h"
#import "KeyValueObserver.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UISlider *lSlider;
@property (weak, nonatomic) IBOutlet UISlider *aSlider;
@property (weak, nonatomic) IBOutlet UISlider *bSlider;
@property (weak, nonatomic) IBOutlet UIView *colorView;
@property (weak, nonatomic) IBOutlet UIProgressView *redValue;
@property (weak, nonatomic) IBOutlet UIProgressView *greenValue;
@property (weak, nonatomic) IBOutlet UIProgressView *blueValue;


@property (nonatomic, strong) LabColor *labColor;
@property (nonatomic, strong) id colorObserverToken;

@end

@implementation ViewController

- (void)dealloc{
	NSLog(@"%s", __FUNCTION__);
}

- (void)viewDidLoad {
	[super viewDidLoad];
	[self setupUI];
	self.labColor = [[LabColor alloc] init];
}

- (void)setupUI{
	self.lSlider.minimumValue = 0;
	self.lSlider.maximumValue = 100;
	self.aSlider.minimumValue = -128;
	self.aSlider.maximumValue = 127;
	self.bSlider.minimumValue = -128;
	self.bSlider.maximumValue = 127;
}

// 重写 labColor setter 方法
- (void)setLabColor:(LabColor *)labColor{
	_labColor = labColor;
	self.colorObserverToken = [KeyValueObserver observerObject:labColor keyPath:@"color" target:self selector:@selector(colorDidChange:) options:NSKeyValueObservingOptionInitial];
	
	self.lSlider.value = self.labColor.lComponent;
	self.aSlider.value = self.labColor.aComponent;
	self.bSlider.value = self.labColor.bComponent;
}

- (void)colorDidChange:(NSDictionary *)change{
//	NSLog(@"%s - labColor = %@", __FUNCTION__, self.labColor);
//	NSLog(@"change = %@", change);
	self.colorView.backgroundColor = self.labColor.color;
	self.redValue.progress = self.labColor.redComponent / 255;
	self.greenValue.progress = self.labColor.greenComponent / 255;
	self.blueValue.progress = self.labColor.blueComponent / 255;
}

- (IBAction)changeLComponent:(UISlider *)sender {
	self.labColor.lComponent = sender.value;
}
- (IBAction)changeAComponent:(UISlider *)sender {
	 self.labColor.aComponent = sender.value;
}
- (IBAction)changeBComponent:(UISlider *)sender {
	self.labColor.bComponent = sender.value;
}


- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

@end
