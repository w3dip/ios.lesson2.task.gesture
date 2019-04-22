//
//  ViewController.m
//  ios.lesson2.task.gesture
//
//  Created by Admin on 22/04/2019.
//  Copyright © 2019 w3dip. All rights reserved.
//

#import "ViewController.h"
#import "IPCustomView.h"

@interface ViewController ()
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    IPCustomView* view = [[IPCustomView alloc] initWithParent:self.view];
    [self.view addSubview:view];
}

@end
