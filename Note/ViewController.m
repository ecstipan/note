//
//  ViewController.m
//  Note
//
//  Created by Rayce Stipanovich on 2/5/13.
//  TADPOLE
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

	//setup our background view
	backgroundView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 1024, 768)];
	[backgroundView setImage:[UIImage imageNamed:@"background.png"]];

	controlView = [[UIView alloc] initWithFrame:CGRectMake(0, -220, 1024, 400)];
	[controlView setBackgroundColor:[UIColor redColor]];

	instrumentSelection = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 1024, 220)];
	[instrumentSelection setBackgroundColor:[UIColor clearColor]];

	instrumentBG = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 1024, 220)];
	[instrumentBG setImage:[UIImage imageNamed:@"instrumentMenu.png"]];

	//Add in stacked order
	[self.view addSubview:backgroundView];
	[self.view addSubview:controlView];
	[self.view addSubview:instrumentSelection];
	[instrumentSelection addSubview:instrumentBG];

	//Handle Swipe events
	UISwipeGestureRecognizer *threeFingerSwipeUp = [[[UISwipeGestureRecognizer alloc]
                                                     initWithTarget:self
                                                     action:@selector(threeFingerSwipeUp:)] autorelease];
    [threeFingerSwipeUp setDirection:UISwipeGestureRecognizerDirectionUp];
	[threeFingerSwipeUp setNumberOfTouchesRequired:3];
    [[self view] addGestureRecognizer:threeFingerSwipeUp];

    UISwipeGestureRecognizer *threeFingerSwipeDown = [[[UISwipeGestureRecognizer alloc]
													  initWithTarget:self
													  action:@selector(threeFingerSwipeDown:)] autorelease];
    [threeFingerSwipeDown setDirection:UISwipeGestureRecognizerDirectionDown];
	[threeFingerSwipeDown setNumberOfTouchesRequired:3];
    [[self view] addGestureRecognizer:threeFingerSwipeDown];

	UITapGestureRecognizer *doubleTapScreen = [[[UITapGestureRecognizer alloc]
												initWithTarget:self
												action:@selector(doubleTapScreen:)] autorelease];
	doubleTapScreen.numberOfTapsRequired = 2;
	doubleTapScreen.numberOfTouchesRequired = 3;
	[[self view] addGestureRecognizer:doubleTapScreen];

	[self showAdcancedMenu];
	advancedmenushowing = true;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)hideAdcancedMenu
{
	[UIView animateWithDuration:0.3
                          delay:0
                        options: (UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionAllowUserInteraction)
                     animations:^{
                         controlView.frame = CGRectMake(0, -220, 1024, 400);
                     }
                     completion:^(BOOL finished){
                         NSLog(@"Advanced menu disabled.");
                     }];
	advancedmenushowing = false;
}

-(void)showAdcancedMenu
{
	[UIView animateWithDuration:0.3
                          delay:0
                        options: (UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionAllowUserInteraction)
                     animations:^{
                         controlView.frame = CGRectMake(0, 170, 1024, 400);
                     }
                     completion:^(BOOL finished){
                         NSLog(@"Advanced menu enabled.");
                     }];
	advancedmenushowing = true;
}

- (void)threeFingerSwipeUp:(UITapGestureRecognizer *)recognizer {
    // Insert your own code to handle swipe left
	[self hideAdcancedMenu];
}

- (void)threeFingerSwipeDown:(UITapGestureRecognizer *)recognizer {
    // Insert your own code to handle swipe right
	[self showAdcancedMenu];
}

- (void)doubleTapScreen:(UITapGestureRecognizer *)recognizer {
    // Insert your own code to handle swipe right
	if (advancedmenushowing) [self hideAdcancedMenu];
	else [self showAdcancedMenu];
}
@end
