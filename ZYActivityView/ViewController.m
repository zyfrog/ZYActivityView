//
//  ViewController.m
//  ZYActivityView
//
//  Created by Zyfrog on 13-5-28.
//  Copyright (c) 2013年 Xinling Zhang. All rights reserved.
//

#import "ViewController.h"
#import "ZYActivityView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    ZYActivityView* activity = [[ZYActivityView alloc] init];
    [self.view addSubview:activity];
    [activity release];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
