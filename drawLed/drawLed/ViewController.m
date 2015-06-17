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
    int _numberOfBalls,_numberOfBallsY;
    CGFloat _space;
    CGFloat _ballDiameter;
    NSTimer* _timer1;
    NSTimer* _timer2;
    int _lastOnLEDLeft,_lastOnLEDRight,_lastOnLEDfreeLeft,_lastOnLEDfreeRight;
    int _tag;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    _margin=40.0;
    _ballDiameter=24.0;
    _numberOfBalls=5;
    _numberOfBallsY=5;
    
    
    _timer1 = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(runningLED) userInfo:nil repeats:true];
    //_timer2 = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(runningLED2) userInfo:nil repeats:true];
   
    [self drawRowOfBall:_numberOfBalls andNumberBallsY:_numberOfBallsY];
}
-(void) leftToRight
{
//    NSLog(@"%d, %d",_lastOnLEDLeft,_lastOnLEDRight);
    
    if (_lastOnLEDRight==_lastOnLEDLeft+1 && _lastOnLEDRight!=0)
    {
        [_timer1 invalidate];
       _timer1 = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(freeStyle) userInfo:nil repeats:true];
        
    }
    else
    {
        if (_lastOnLEDLeft != -1)
        {
            [self turnOFFLed:_lastOnLEDLeft];
        }
    
        if (_lastOnLEDLeft != _numberOfBalls*_numberOfBallsY - 1)
        {
                _lastOnLEDLeft++;
        }
        else
        {
            _lastOnLEDLeft = 0;
        
        }
        [self turnONLed:_lastOnLEDLeft];
    }
}
-(void) rightToLeft
{
    if (_lastOnLEDRight==_lastOnLEDLeft+1 && _lastOnLEDRight!=0)
    {
        [self turnOFFLed:_lastOnLEDRight];
        [self turnOFFLed:_lastOnLEDLeft];
        _lastOnLEDLeft=0;
        _lastOnLEDRight=0;
        
    }
    else
    {
        if (_lastOnLEDRight != -1)
        {
            [self turnOFFLed:_lastOnLEDRight];
        }
    
        if (_lastOnLEDRight != 0)
        {
            _lastOnLEDRight--;
        }
        else
        {
            _lastOnLEDRight = _numberOfBalls*_numberOfBallsY - 1;
        }
        [self turnONLed:_lastOnLEDRight];
    }
}
-(void)freeStyle
{
    if (_lastOnLEDfreeLeft < _numberOfBalls*_numberOfBallsY)
    {
        
    
        if (_lastOnLEDfreeLeft != -1)
        {
        [   self turnOFFLed:_lastOnLEDfreeLeft];
        }
    
        if (_lastOnLEDfreeLeft < _numberOfBalls)
        {
            _lastOnLEDfreeLeft++;
        }
        else if(_lastOnLEDfreeLeft < _numberOfBalls*_numberOfBallsY-_numberOfBallsY-1)
        {
            _lastOnLEDfreeLeft=_lastOnLEDfreeLeft+_numberOfBallsY-1;
        }
        else
        {
            _lastOnLEDfreeLeft++;
        }

        [self turnONLed:_lastOnLEDfreeLeft];
    }
    else
    {
        [_timer1 invalidate];
        [self turnOFFLed:_lastOnLEDfreeLeft];
        _lastOnLEDfreeLeft=0;
        _timer1 = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(runningLED) userInfo:nil repeats:true];
    }
    
    
}

-(void) runningLED
{
    
    [self leftToRight];
    [self rightToLeft];

}
-(void)turnONLed:(int)index
{
    UIView* view=[self.view viewWithTag:index+100];
    if (view && [view isMemberOfClass:[UIImageView class]])
    {
        UIImageView* ball=(UIImageView*)view;
        ball.image=[UIImage imageNamed:@"green"];
    }
}
-(void)turnOFFLed:(int)index
{
    UIView* view=[self.view viewWithTag:index+100];
    if (view && [view isMemberOfClass:[UIImageView class]])
    {
        UIImageView* ball=(UIImageView*)view;
        ball.image=[UIImage imageNamed:@"grey"];
    }
}









-(void)placeBallAtX:(CGFloat)X
               andY:(CGFloat)Y
            withTag:(int)Tag
{
    UIImageView* ball=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"grey"]];
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
            _tag=_tag+1;
            [self placeBallAtX:_margin+j*spaceX
                          andY:_margin+i*spaceY
                       withTag:_tag+100];
            
        }
        
    }
    
}



@end
