//
//  ViewController.m
//  printf
//
//  Created by nguyenvantu on 6/15/15.
//  Copyright (c) 2015 nguyenvantu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    for (int i=0;i<5; i++)
    {
        for (int j=0; j<21-i; j++)
        {
            if (((j-i)%4==0 && (j-i)%8!=0)||((j+i)%4==0 && (j+i)%8!=0))
            {
                printf("+");
            }
            else
            {
                printf(" ");
            }
            
        }
        printf("\n");
    }
}



@end
