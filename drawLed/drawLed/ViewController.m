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
    int _numberOfBallsRow,_numberOfBallsCol;
    CGFloat _space;
    CGFloat _ballDiameter;
    NSTimer* _timer1;
    NSTimer* _timer2;
    int _lastOnLEDLeft,_lastOnLEDRight,_lastOnLEDfreeLeft,_lastOnLEDfreeRight;
    int _tag;
    int _boundTOPLEFT,_boundTOPRIGHT,_boundBOTLEFT,_boundBOTRIGHT,_numberBallCurrent;
    int _currentCol,_currentRow,_subRow,_subCol;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    _margin=40.0;
    _ballDiameter=24.0;
    _numberOfBallsRow=11;
    _numberOfBallsCol=11;
    _boundTOPLEFT=1;
    _boundTOPRIGHT=_numberOfBallsCol;
    _boundBOTRIGHT=_numberOfBallsRow*_numberOfBallsCol;
    _boundBOTLEFT=_boundBOTRIGHT-_numberOfBallsCol+1;
    _subRow=_numberOfBallsRow;
    _subCol=_numberOfBallsCol;
    _timer1 = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(freeStyle) userInfo:nil repeats:true];
    
    
    
    
   
    [self drawRowOfBall:_numberOfBallsCol andnumberBallsRow:_numberOfBallsRow];
    [self freeStyle];
}
-(void) leftToRight
{
//    NSLog(@"%d, %d",_lastOnLEDLeft,_lastOnLEDRight);
    
    if (_lastOnLEDRight==_lastOnLEDLeft+1 && _lastOnLEDRight!=0)
    {
        [_timer1 invalidate];
       _timer1 = [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(freeStyle) userInfo:nil repeats:true];
        
    }
    else
    {
        if (_lastOnLEDLeft != -1)
        {
            [self turnOFFLed:_lastOnLEDLeft];
        }
    
        if (_lastOnLEDLeft != _numberOfBallsRow*_numberOfBallsRow - 1)
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
            _lastOnLEDRight = _numberOfBallsRow*_numberOfBallsRow - 1;
        }
        [self turnONLed:_lastOnLEDRight];
    }
}
-(void)freeStyle
{

    if(_numberBallCurrent < _boundTOPRIGHT )
    {
        _numberBallCurrent++;
       
    }
    else if(_numberBallCurrent<_boundBOTRIGHT && _currentRow != _subRow-1)
    {
        _numberBallCurrent=_numberBallCurrent+_numberOfBallsCol;
        
        _currentRow++;
    }
    else if(_numberBallCurrent>_boundBOTLEFT && _currentCol !=_subCol-1)
    {
        _numberBallCurrent=_numberBallCurrent-1;
        _currentCol++;
        
    }
    else if (_numberBallCurrent>_boundTOPLEFT+_numberOfBallsCol )
    {
        _numberBallCurrent=_numberBallCurrent-_numberOfBallsCol;
    }
    else if (_subCol>1)
    {
        _boundTOPLEFT=_boundTOPLEFT+_numberOfBallsCol+1;
        _boundTOPRIGHT=_boundTOPRIGHT+_numberOfBallsCol-1;
        
        _boundBOTRIGHT=_boundBOTRIGHT-_numberOfBallsCol-1;
        _boundBOTLEFT=_boundBOTLEFT-_numberOfBallsCol+1;
        _numberBallCurrent=_boundTOPLEFT;
        _currentRow=0;
        _subRow=_subRow-2;
        _subCol=_subCol-2;
        
       
    }
    [self turnONLed:_numberBallCurrent];
    
    

    
    
    
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
-(void)drawRowOfBall:(int)numberBallsCol
     andnumberBallsRow:(int)numberBallsRow
{
    CGFloat spaceCol=[self spaceBetweenBallCenterWhenNunberBallIsKnown:numberBallsCol];
    CGFloat spaceRow=[self spaceYBetweenBallCenterWhenNunberBallIsKnown:numberBallsRow];
    for (int i=0; i<numberBallsRow;i++)
    {
        for (int j=0; j<numberBallsCol; j++)
        {
            _tag=_tag+1;
            [self placeBallAtX:_margin+j*spaceCol
                          andY:_margin+i*spaceRow
                       withTag:_tag+100];
            
        }
        
    }
    
}



@end
