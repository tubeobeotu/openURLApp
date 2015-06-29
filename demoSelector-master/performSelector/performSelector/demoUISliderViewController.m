//
//  demoUISliderViewController.m
//  performSelector
//
//  Created by nguyenvantu on 6/29/15.
//  Copyright (c) 2015 nguyenvantu. All rights reserved.
//

#import "demoUISliderViewController.h"

@interface demoUISliderViewController ()
{
    NSTimer* _timer;
    __weak IBOutlet UISlider *slider;
}
@end

@implementation demoUISliderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _timer = [NSTimer scheduledTimerWithTimeInterval:0.1
                                              target:self
                                            selector:@selector(onTimer)
                                            userInfo:nil
                                             repeats:true];
    //[_timer fire];
    slider.transform = CGAffineTransformMakeRotation(-M_PI_2);
    slider.tintColor = [UIColor redColor];
    slider.thumbTintColor = [UIColor yellowColor];
}

-(void)onTimer
{
    slider.value+=0.05;
    if (slider.value>1) {
        slider.value=1;
        [_timer invalidate];
    }
}



@end
