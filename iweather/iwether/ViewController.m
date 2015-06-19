//
//  ViewController.m
//  iwether
//
//  Created by nguyenvantu on 6/10/15.
//  Copyright (c) 2015 nguyenvantu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *location;
@property (weak, nonatomic) IBOutlet UIButton *temperature;
@property (weak, nonatomic) IBOutlet UIImageView *weathericon;
@property (weak, nonatomic) IBOutlet UILabel *quote;
@property (weak, nonatomic) IBOutlet UIButton *update;
@property (weak, nonatomic) IBOutlet UILabel *degree;


@end

@implementation ViewController
{
    NSArray* quotes;
    NSArray* locations;
    NSArray* photoFiles;
    float degreeC;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    quotes = @[@"Một con ngựa đau cả tàu bỏ cỏ", @"Có công mài sắt có ngày nên kim", @"Chớ thấy sóng cả mà ngã tay chèo", @"Không có gì quý hơn độc lập tự do hạnh phúc", @"Đi một ngày đàng học một sàng không"];
    
    locations = @[@"Hai Ba Trung, Hanoi", @"Sydney, Australia", @"New York, USA"];
    
    photoFiles = @[@"rain", @"sunny", @"thunder", @"windy"];
   
    degreeC=20.9;
    
}
- (IBAction)updateWeather:(id)sender {
    int quoteIndex = arc4random_uniform(quotes.count);
    NSLog(@"%d", quoteIndex);
    self.quote.text = quotes[quoteIndex];
    
    int locationIndex = arc4random_uniform(locations.count);
    self.location.text = locations[locationIndex];
    
    int photoIndex = arc4random_uniform(photoFiles.count);
    self.weathericon.image = [UIImage imageNamed:photoFiles[photoIndex]];
    
    degreeC=[self getTemperature];
    NSString* string = [NSString stringWithFormat:@"%2.1f", degreeC];
    [self.temperature setTitle:string forState:UIControlStateNormal];
    
    
}
- (IBAction)updateTemperature:(id)sender {
    if([self.degree.text isEqualToString:@"C"])
    {
        NSLog(@"%2.1f",degreeC);
        NSString* string = [NSString stringWithFormat:@"%2.1f", [self changeTemperature]];
        [self.temperature setTitle:string forState:UIControlStateNormal];
        self.degree.text=@"F";
    }
    else
    {
        NSLog(@"%2.1f",degreeC);
        NSString* string = [NSString stringWithFormat:@"%2.1f", degreeC];
        [self.temperature setTitle:string forState:UIControlStateNormal];
        self.degree.text=@"C";
    }
    
}


//Có dấu trừ trước khai báo là instant method
//Có dấu + trước khai báo là class method
//(float) casting: chuyển, ép sang kiểu float
-(float) changeTemperature{
    return degreeC*1.8+32;
}
- (float) getTemperature {
    return 14.0 + arc4random_uniform(18) + (float)arc4random() /(float) INT32_MAX;
}



@end
