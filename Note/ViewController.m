//
//  ViewController.m
//  Note
//
//  Created by Rayce Stipanovich on 2/5/13.
//  Copyright (c) 2013 WPI. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

	//testing
	UIImage *tempimg = [UIImage imageNamed:@"template.png"];
	[test setImage:tempimg];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
