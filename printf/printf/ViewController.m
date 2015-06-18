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
    int row,col;
    row=4;
    col=30;
//    for (int i=0;i<row; i++)
//    {
//        for (int j=0; j<col-i; j++)
//        {
//            if (((j-i)%4==0 && (j-i)%8!=0)||((j+i)%4==0 && (j+i)%8!=0))
//            {
//                printf("+");
//            }
//            else
//            {
//                printf(" ");
//            }
//            
//        }
//        printf("\n");
//    }
    int a[10][10],d,c;
    d=5;
    c=5;
    int trai=0,tren=0,phai=c,duoi=d,dem=0,soluong=c*d;
    while(dem<soluong)
    {
        for(int i=trai;i<phai;i++)
            if(dem<soluong)
                a[tren][i]=dem++;
        tren++;
        for(int i=tren;i<duoi;i++)
            if(dem<soluong)
                a[i][phai-1]=dem++;
        phai--;
        for(int i=phai-1;i>=trai;i--)
            if(dem<soluong)
                a[duoi-1][i]=dem++;
        duoi--;
        for(int i=duoi-1;i>=tren;i--)
            if(dem<soluong)
                a[i][trai]=dem++;
        trai++;
    }
    for(int i=0;i<d;i++)
    {
        for(int j=0;j<c;j++)
            if(a[i][j]>=10)
                //cout<<a[i][j]<<" ";
                printf("%d ",a[i][j]);
            else
                //cout<<" "<<a[i][j]<<" ";
                printf(" %d ",a[i][j]);
        printf("\n");
    }
}



@end
