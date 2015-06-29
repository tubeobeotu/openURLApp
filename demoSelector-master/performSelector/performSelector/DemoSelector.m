//
//  DemoSelector.m
//  performSelector
//
//  Created by nguyenvantu on 6/26/15.
//  Copyright (c) 2015 nguyenvantu. All rights reserved.
//

#import "DemoSelector.h"

@interface DemoSelector ()
@property (weak, nonatomic) IBOutlet UISlider *Slider;

@end

@implementation DemoSelector
- (IBAction)OnCrunch:(id)sender {
    //[self performSelectorInBackground:@selector(doCrunchData) withObject:nil];
    //[self performSelectorOnMainThread:@selector(doCrunchData) withObject:nil waitUntilDone:false];
    [self performSelectorOnMainThread:@selector(processData:) withObject:@{@"apple": @"táo", @"lemon": @"chanh"} waitUntilDone: true];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self performSelector:@selector(hideSlider) withObject:nil afterDelay: 3];
}


- (void) doCrunchData {
    [NSThread sleepForTimeInterval: 3];
}
- (void) processData: (NSDictionary*) data
{
    for (NSString* key in [data allKeys])
    {
        NSLog(@"%@ - %@", key, [data valueForKey:key]);
    }
}

- (void) hideSlider {
    self.Slider.hidden = true;
}



@end
