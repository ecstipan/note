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
	UIKeyOffset = 56;
	key_1_state = false;
	key_2_state = false;
	key_3_state = false;
	key_4_state = false;
	key_5_state = false;
	key_6_state = false;
	key_7_state = false;
	key_8_state = false;

	self.view.multipleTouchEnabled = YES;
	self.view.exclusiveTouch = NO;

	[self.view setMultipleTouchEnabled:true];
	
	
	// Do any additional setup after loading the view, typically from a nib.

	//setup our background view
	backgroundView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 1024, 768)];
	[backgroundView setImage:[UIImage imageNamed:@"background.png"]];

	controlView = [[UIView alloc] initWithFrame:CGRectMake(0, -220, 1024, 380)];
	[controlView setBackgroundColor:[UIColor clearColor]];

	advControlBG = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 1024, 380)];
	[advControlBG setImage:[UIImage imageNamed:@"advMenu.png"]];

	instrumentSelection = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 1024, 220)];
	[instrumentSelection setBackgroundColor:[UIColor clearColor]];

	instrumentBG = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 1024, 220)];
	[instrumentBG setImage:[UIImage imageNamed:@"instrumentMenu.png"]];

	//Keys and their images
	key_1_defaultBG = [UIImage imageNamed:@"key_1_def.png"];
	key_2_defaultBG = [UIImage imageNamed:@"key_2_def.png"];
	key_3_defaultBG = [UIImage imageNamed:@"key_3_def.png"];
	key_4_defaultBG = [UIImage imageNamed:@"key_4_def.png"];
	key_5_defaultBG = [UIImage imageNamed:@"key_5_def.png"];
	key_6_defaultBG = [UIImage imageNamed:@"key_6_def.png"];
	key_7_defaultBG = [UIImage imageNamed:@"key_7_def.png"];
	key_8_defaultBG = [UIImage imageNamed:@"key_8_def.png"];

	key_1_selBG = [UIImage imageNamed:@"key_1_sel.png"];
	key_2_selBG = [UIImage imageNamed:@"key_2_sel.png"];
	key_3_selBG = [UIImage imageNamed:@"key_3_sel.png"];
	key_4_selBG = [UIImage imageNamed:@"key_4_sel.png"];
	key_5_selBG = [UIImage imageNamed:@"key_5_sel.png"];
	key_6_selBG = [UIImage imageNamed:@"key_6_sel.png"];
	key_7_selBG = [UIImage imageNamed:@"key_7_sel.png"];
	key_8_selBG = [UIImage imageNamed:@"key_8_sel.png"];

	key_1 = [[UIImageView alloc] initWithFrame:CGRectMake(UIKeyOffset+115*0, 548, 115, 220)];
	[key_1 setImage:key_1_defaultBG];
	key_2 = [[UIImageView alloc] initWithFrame:CGRectMake(UIKeyOffset+115*1, 548, 115, 220)];
	[key_2 setImage:key_2_defaultBG];
	key_3 = [[UIImageView alloc] initWithFrame:CGRectMake(UIKeyOffset+115*2, 548, 115, 220)];
	[key_3 setImage:key_3_defaultBG];
	key_4 = [[UIImageView alloc] initWithFrame:CGRectMake(UIKeyOffset+115*3, 548, 115, 220)];
	[key_4 setImage:key_4_defaultBG];
	key_5 = [[UIImageView alloc] initWithFrame:CGRectMake(UIKeyOffset+115*4, 548, 115, 220)];
	[key_5 setImage:key_5_defaultBG];
	key_6 = [[UIImageView alloc] initWithFrame:CGRectMake(UIKeyOffset+115*5, 548, 115, 220)];
	[key_6 setImage:key_6_defaultBG];
	key_7 = [[UIImageView alloc] initWithFrame:CGRectMake(UIKeyOffset+115*6, 548, 115, 220)];
	[key_7 setImage:key_7_defaultBG];
	key_8 = [[UIImageView alloc] initWithFrame:CGRectMake(UIKeyOffset+115*7, 548, 115, 220)];
	[key_8 setImage:key_8_defaultBG];

	//Add in stacked order
	[self.view addSubview:backgroundView];
	[self.view addSubview:controlView];
	[self.view addSubview:instrumentSelection];
	[instrumentSelection addSubview:instrumentBG];
	[controlView addSubview:advControlBG];

	//Add our buttons to the view
	[self.view addSubview:key_1];
	[self.view addSubview:key_2];
	[self.view addSubview:key_3];
	[self.view addSubview:key_4];
	[self.view addSubview:key_5];
	[self.view addSubview:key_6];
	[self.view addSubview:key_7];
	[self.view addSubview:key_8];

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
                         controlView.frame = CGRectMake(0, -190, 1024, 407);
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
                         controlView.frame = CGRectMake(0, 190, 1024, 407);
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

- (void)key_1_pressed {
	NSLog(@"Key 1 down.");
	key_1_state = true;
	[key_1 setImage:key_1_selBG];
	[key_1 setNeedsDisplay];
}
- (void)key_1_released {
	NSLog(@"Key 1 up.");
	key_1_state = false;
	[key_1 setImage:key_1_defaultBG];
	[key_1 setNeedsDisplay];
}
- (void)key_2_pressed {
	NSLog(@"Key 2 down.");
	key_2_state = true;
	[key_2 setImage:key_2_selBG];
	[key_2 setNeedsDisplay];
}
- (void)key_2_released {
	NSLog(@"Key 2 up.");
	key_2_state = false;
	[key_2 setImage:key_2_defaultBG];
	[key_2 setNeedsDisplay];
}
- (void)key_3_pressed {
	NSLog(@"Key 3 down.");
	key_3_state = true;
	[key_3 setImage:key_3_selBG];
	[key_3 setNeedsDisplay];
}
- (void)key_3_released {
	NSLog(@"Key 3 up.");
	key_3_state = false;
	[key_3 setImage:key_3_defaultBG];
	[key_3 setNeedsDisplay];
}
- (void)key_4_pressed {
	NSLog(@"Key 4 down.");
	key_4_state = true;
	[key_4 setImage:key_4_selBG];
	[key_4 setNeedsDisplay];
}
- (void)key_4_released {
	NSLog(@"Key 4 up.");
	key_4_state = false;
	[key_4 setImage:key_4_defaultBG];
	[key_4 setNeedsDisplay];
}
- (void)key_5_pressed {
	NSLog(@"Key 5 down.");
	key_5_state = true;
	[key_5 setImage:key_5_selBG];
	[key_5 setNeedsDisplay];
}
- (void)key_5_released {
	NSLog(@"Key 5 up.");
	key_5_state = false;
	[key_5 setImage:key_5_defaultBG];
	[key_5 setNeedsDisplay];
}
- (void)key_6_pressed {
	NSLog(@"Key 6 down.");
	key_6_state = true;
	[key_6 setImage:key_6_selBG];
	[key_6 setNeedsDisplay];
}
- (void)key_6_released {
	NSLog(@"Key 6 up.");
	key_6_state = false;
	[key_6 setImage:key_6_defaultBG];
	[key_6 setNeedsDisplay];
}
- (void)key_7_pressed {
	NSLog(@"Key 7 down.");
	key_7_state = true;
	[key_7 setImage:key_7_selBG];
	[key_7 setNeedsDisplay];
}
- (void)key_7_released {
	NSLog(@"Key 7 up.");
	key_7_state = false;
	[key_7 setImage:key_7_defaultBG];
	[key_7 setNeedsDisplay];
}
- (void)key_8_pressed {
	NSLog(@"Key 8 down.");
	key_8_state = true;
	[key_8 setImage:key_8_selBG];
	[key_8 setNeedsDisplay];
}
- (void)key_8_released {
	NSLog(@"Key 8 up.");
	key_8_state = false;
	[key_8 setImage:key_8_defaultBG];
	[key_8 setNeedsDisplay];
}
-(void)handlePianoKeySlide:(UITouch *)touches {
	if (key_1_state && !CGRectContainsPoint(key_1.frame, [touches locationInView:backgroundView])) {
		[self key_1_released];
	} else if (!key_1_state && CGRectContainsPoint(key_1.frame, [touches locationInView:backgroundView])) {
		[self key_1_pressed];
	}
	if (key_2_state && !CGRectContainsPoint(key_2.frame, [touches locationInView:backgroundView])) {
		[self key_2_released];
	} else if (!key_2_state && CGRectContainsPoint(key_2.frame, [touches locationInView:backgroundView])) {
		[self key_2_pressed];
	}
	if (key_3_state && !CGRectContainsPoint(key_3.frame, [touches locationInView:backgroundView])) {
		[self key_3_released];
	} else if (!key_3_state && CGRectContainsPoint(key_3.frame, [touches locationInView:backgroundView])) {
		[self key_3_pressed];
	}
	if (key_4_state && !CGRectContainsPoint(key_4.frame, [touches locationInView:backgroundView])) {
		[self key_4_released];
	} else if (!key_4_state && CGRectContainsPoint(key_4.frame, [touches locationInView:backgroundView])) {
		[self key_4_pressed];
	}
	if (key_5_state && !CGRectContainsPoint(key_5.frame, [touches locationInView:backgroundView])) {
		[self key_5_released];
	} else if (!key_5_state && CGRectContainsPoint(key_5.frame, [touches locationInView:backgroundView])) {
		[self key_5_pressed];
	}
	if (key_6_state && !CGRectContainsPoint(key_6.frame, [touches locationInView:backgroundView])) {
		[self key_6_released];
	} else if (!key_6_state && CGRectContainsPoint(key_6.frame, [touches locationInView:backgroundView])) {
		[self key_6_pressed];
	}
	if (key_7_state && !CGRectContainsPoint(key_7.frame, [touches locationInView:backgroundView])) {
		[self key_7_released];
	} else if (!key_7_state && CGRectContainsPoint(key_7.frame, [touches locationInView:backgroundView])) {
		[self key_7_pressed];
	}
	if (key_8_state && !CGRectContainsPoint(key_8.frame, [touches locationInView:backgroundView])) {
		[self key_8_released];
	} else if (!key_8_state && CGRectContainsPoint(key_8.frame, [touches locationInView:backgroundView])) {
		[self key_8_pressed];
	}
}
-(void)handlePianoKeyPresses:(UITouch *)touches {
	if (!key_1_state && CGRectContainsPoint(key_1.frame, [touches locationInView:backgroundView])) {
		[self key_1_pressed];
	}
	if (!key_2_state && CGRectContainsPoint(key_2.frame, [touches locationInView:backgroundView])) {
		[self key_2_pressed];
	}
	if (!key_3_state && CGRectContainsPoint(key_3.frame, [touches locationInView:backgroundView])) {
		[self key_3_pressed];
	}
	if (!key_4_state && CGRectContainsPoint(key_4.frame, [touches locationInView:backgroundView])) {
		[self key_4_pressed];
	}
	if (!key_5_state && CGRectContainsPoint(key_5.frame, [touches locationInView:backgroundView])) {
		[self key_5_pressed];
	}
	if (!key_6_state && CGRectContainsPoint(key_6.frame, [touches locationInView:backgroundView])) {
		[self key_6_pressed];
	}
	if (!key_7_state && CGRectContainsPoint(key_7.frame, [touches locationInView:backgroundView])) {
		[self key_7_pressed];
	}
	if (!key_8_state && CGRectContainsPoint(key_8.frame, [touches locationInView:backgroundView])) {
		[self key_8_pressed];
	}
}
-(void)handlePianoKeyReleases:(UITouch *)touches {
	if (key_1_state && CGRectContainsPoint(key_1.frame, [touches locationInView:backgroundView])) {
		[self key_1_released];
	}
	if (key_2_state && CGRectContainsPoint(key_2.frame, [touches locationInView:backgroundView])) {
		[self key_2_released];
	}
	if (key_3_state && CGRectContainsPoint(key_3.frame, [touches locationInView:backgroundView])) {
		[self key_3_released];
	}
	if (key_4_state && CGRectContainsPoint(key_4.frame, [touches locationInView:backgroundView])) {
		[self key_4_released];
	}
	if (key_5_state && CGRectContainsPoint(key_5.frame, [touches locationInView:backgroundView])) {
		[self key_5_released];
	}
	if (key_6_state && CGRectContainsPoint(key_6.frame, [touches locationInView:backgroundView])) {
		[self key_6_released];
	}
	if (key_7_state && CGRectContainsPoint(key_7.frame, [touches locationInView:backgroundView])) {
		[self key_7_released];
	}
	if (key_8_state && CGRectContainsPoint(key_8.frame, [touches locationInView:backgroundView])) {
		[self key_8_released];
	}
}
-(void)handleKeyPresses:(UIEvent *)event keyToCheck:(UIImageView *)key{
	bool on = false;
	for (UITouch *touch in [event allTouches]) {
		if (CGRectContainsPoint(key.frame, [touch locationInView:backgroundView])) {
			on = true;
			break;
		}
	}
	if (on && CGRectEqualToRect(key.frame, key_1.frame) && !key_1_state) [self key_1_pressed];
	else if (!on && CGRectEqualToRect(key.frame, key_1.frame)) [self key_1_released];
}
-(void)KillAllKeys {
	[self key_1_released];
	[self key_2_released];
	[self key_3_released];
	[self key_4_released];
	[self key_5_released];
	[self key_6_released];
	[self key_7_released];
	[self key_8_released];
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
	if (event.allTouches.count < 4) {
		for (UITouch *touch in [event allTouches]) {
			[self handlePianoKeySlide:touch];
		}
		for (UITouch *touch in [event allTouches]) {
			[self handlePianoKeyPresses:touch];
		}
	}
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	if (event.allTouches.count < 4)
	for (UITouch *touch in [event allTouches]) {
		[self handlePianoKeyPresses:touch];
	}
}
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
	for (UITouch *touch in [event allTouches]) {
		[self handlePianoKeyReleases:touch];
	}
}
@end
