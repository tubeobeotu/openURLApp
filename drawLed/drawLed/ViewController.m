//
//  ViewController.m
//  drawLed
//
//  Created by nguyenvantu on 6/16/15.
//  Copyright (c) 2015 nguyenvantu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
{
    CGFloat _margin,_marginY;
    int _numberOfBall;
    CGFloat _space;
    CGFloat _ballDiameter;
    CGSize _size;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    _margin=40.0;
    _ballDiameter=24.0;
    _size=[self sizeOfApp];
    [self drawRowOfBall:8 andNumberBallsY:9];
}

-(void)placeBallAtX:(CGFloat)X
               andY:(CGFloat)Y
            withTag:(int)Tag
{
    UIImageView* ball=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"green"]];
    ball.center=CGPointMake(X, Y);
    ball.tag=Tag;
   // NSLog(@"%1.0f",ball.bounds.size.width);
    [self.view addSubview:ball];
}
-(CGFloat)spaceBetweenBallCenterWhenNunberBallIsKnown:(int)n
{
    return (self.view.bounds.size.width-2*_margin)/(n-1);
}
-(CGFloat)spaceYBetweenBallCenterWhenNunberBallIsKnown:(int)n
{
    return (self.view.bounds.size.height-2*_margin)/(n-1);
}
-(void)drawRowOfBall:(int)numberBallsX
     andNumberBallsY:(int)numberBallsY
{
    CGFloat spaceX=[self spaceBetweenBallCenterWhenNunberBallIsKnown:numberBallsX];
    CGFloat spaceY=[self spaceYBetweenBallCenterWhenNunberBallIsKnown:numberBallsY];
    for (int i=0; i<numberBallsY;i++)
    {
        for (int j=0; j<numberBallsX; j++)
        {
            [self placeBallAtX:_margin+j*spaceX
                          andY:_margin+i*spaceY
                       withTag:i+100];
        }
        
    }
    
}
-(CGSize)sizeOfApp
{
    CGSize size=self.view.bounds.size;
    return size;
}


@end
