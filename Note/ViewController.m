//
//  ViewController.m
//  Note
//
//  Created by Rayce Stipanovich on 2/5/13.
//  Copyright (c) 2013 WPI. All rights reserved.
//

#import "ViewController.h"
#import "SharedMusic.h"

@interface ViewController ()

@end

static SharedMusicInstrument currentInstrument;
static SharedMusicKey currentKey;
static SharedMusicMode currentMode;
static RecordingState currentRecordingState;

//assign an outlet to our object
static UIImageView * backgroundView;
static UIView *controlView;
static UIView *instrumentSelection;
static UIImageView * instrumentBG;
static UIImageView * advControlBG;

static UIImageView * key_1;
static UIImageView * key_2;
static UIImageView * key_3;
static UIImageView * key_4;
static UIImageView * key_5;
static UIImageView * key_6;
static UIImageView * key_7;
static UIImageView * key_8;

static UIImage * key_1_defaultBG;
static UIImage * key_2_defaultBG;
static UIImage * key_3_defaultBG;
static UIImage * key_4_defaultBG;
static UIImage * key_5_defaultBG;
static UIImage * key_6_defaultBG;
static UIImage * key_7_defaultBG;
static UIImage * key_8_defaultBG;

static UIImage * key_1_selBG;
static UIImage * key_2_selBG;
static UIImage * key_3_selBG;
static UIImage * key_4_selBG;
static UIImage * key_5_selBG;
static UIImage * key_6_selBG;
static UIImage * key_7_selBG;
static UIImage * key_8_selBG;

static UIImage * inst_1_u;
static UIImage * inst_2_u;
static UIImage * inst_3_u;
static UIImage * inst_4_u;

static UIImage * inst_1_s;
static UIImage * inst_2_s;
static UIImage * inst_3_s;
static UIImage * inst_4_s;

static UIImageView * inst_1;
static UIImageView * inst_2;
static UIImageView * inst_3;
static UIImageView * inst_4;

static UIImage * key_c_u;
static UIImage * key_c_s;
static UIImage * key_f_u;
static UIImage * key_f_s;
static UIImage * key_g_u;
static UIImage * key_g_s;

static UIImage * mode_1_u;
static UIImage * mode_1_s;
static UIImage * mode_2_u;
static UIImage * mode_2_s;
static UIImage * mode_3_u;
static UIImage * mode_3_s;

static UIImage * rec_u;
static UIImage * rec_s;
static UIImage * play_u;
static UIImage * play_s;

static UIImageView * musickey_1;
static UIImageView * musickey_2;
static UIImageView * musickey_3;

static UIImageView * mode_1;
static UIImageView * mode_2;
static UIImageView * mode_3;

static UIImageView * record;
static UIImageView * play;

static bool key_1_state;
static bool key_2_state;
static bool key_3_state;
static bool key_4_state;
static bool key_5_state;
static bool key_6_state;
static bool key_7_state;
static bool key_8_state;

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	UIKeyOffset = 56;
	UIInstOffset = 64;
	currentInstrument = piano;
	currentKey = CMajor;
	currentMode = single;
	currentRecordingState = idle;
	
	key_1_state = false;
	key_2_state = false;
	key_3_state = false;  
	key_4_state = false;
	key_5_state = false;
	key_6_state = false;
	key_7_state = false;
	key_8_state = false;

	sharedmusic = [SharedMusic alloc];
	[sharedmusic configureRecording];

	self.view.multipleTouchEnabled = YES;
	self.view.exclusiveTouch = NO;

	[self.view setMultipleTouchEnabled:true];
	
	// Do any additional setup after loading the view, typically from a nib.

	//setup our background view
	backgroundView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 1024, 768)];
	[backgroundView setImage:[UIImage imageNamed:@"background.png"]];

	controlView = [[UIView alloc] initWithFrame:CGRectMake(0, -380, 1024, 380)];
	[controlView setBackgroundColor:[UIColor clearColor]];

	advControlBG = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 1024, 380)];
	[advControlBG setImage:[UIImage imageNamed:@"advMenu.png"]];

	instrumentSelection = [[UIView alloc] initWithFrame:CGRectMake(0, -220, 1024, 220)];
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

	inst_1_s = [UIImage imageNamed:@"inst_1_s.png"];
	inst_2_s = [UIImage imageNamed:@"inst_2_s.png"];
	inst_3_s = [UIImage imageNamed:@"inst_3_s.png"];
	inst_4_s = [UIImage imageNamed:@"inst_4_s.png"];
	inst_1_u = [UIImage imageNamed:@"inst_1_u.png"];
	inst_2_u = [UIImage imageNamed:@"inst_2_u.png"];
	inst_3_u = [UIImage imageNamed:@"inst_3_u.png"];
	inst_4_u = [UIImage imageNamed:@"inst_4_u.png"];

	inst_1 = [[UIImageView alloc] initWithFrame:CGRectMake(UIInstOffset+0, 8, 200, 190)];
	[inst_1 setImage:inst_1_s];
	inst_2 = [[UIImageView alloc] initWithFrame:CGRectMake(UIInstOffset+230, 8, 200, 190)];
	[inst_2 setImage:inst_2_u];
	inst_3 = [[UIImageView alloc] initWithFrame:CGRectMake(UIInstOffset+460, 8, 200, 190)];
	[inst_3 setImage:inst_3_u];
	inst_4 = [[UIImageView alloc] initWithFrame:CGRectMake(UIInstOffset+690, 8, 200, 190)];
	[inst_4 setImage:inst_4_u];
	
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
	[instrumentSelection addSubview:inst_1];
	[instrumentSelection addSubview:inst_2];
	[instrumentSelection addSubview:inst_3];
	[instrumentSelection addSubview:inst_4];

	//Add our buttons to the view
	[self.view addSubview:key_1];
	[self.view addSubview:key_2];
	[self.view addSubview:key_3];
	[self.view addSubview:key_4];
	[self.view addSubview:key_5];
	[self.view addSubview:key_6];
	[self.view addSubview:key_7];
	[self.view addSubview:key_8];

	//handle our advanced views
	key_c_u = [UIImage imageNamed:@"key_c_u.png"];
	key_c_s = [UIImage imageNamed:@"key_c_s.png"];
	key_f_u = [UIImage imageNamed:@"key_f_u.png"];
	key_f_s = [UIImage imageNamed:@"key_f_s.png"];
	key_g_u = [UIImage imageNamed:@"key_g_u.png"];
	key_g_s = [UIImage imageNamed:@"key_g_s.png"];
	
	musickey_1 = [[UIImageView alloc] initWithFrame:CGRectMake(570, 110, 90, 100)];
	[musickey_1 setImage:key_c_s];
	musickey_2 = [[UIImageView alloc] initWithFrame:CGRectMake(549, 226, 50, 66)];
	[musickey_2 setImage:key_f_u];
	musickey_3 = [[UIImageView alloc] initWithFrame:CGRectMake(624, 226, 66, 66)];
	[musickey_3 setImage:key_g_u];

	[advControlBG addSubview:musickey_1];
	[advControlBG addSubview:musickey_2];
	[advControlBG addSubview:musickey_3];


	mode_1_u = [UIImage imageNamed:@"mode_1_u.png"];
	mode_1_s = [UIImage imageNamed:@"mode_1_s.png"];
	mode_2_u = [UIImage imageNamed:@"mode_2_u.png"];
	mode_2_s = [UIImage imageNamed:@"mode_2_s.png"];
	mode_3_u = [UIImage imageNamed:@"mode_3_u.png"];
	mode_3_s = [UIImage imageNamed:@"mode_3_s.png"];

	mode_1 = [[UIImageView alloc] initWithFrame:CGRectMake(44, 128, 112, 165)];
	[mode_1 setImage:mode_1_s];
	mode_2 = [[UIImageView alloc] initWithFrame:CGRectMake(192, 110, 110, 175)];
	[mode_2 setImage:mode_2_u];
	mode_3 = [[UIImageView alloc] initWithFrame:CGRectMake(340, 138, 130, 154)];
	[mode_3 setImage:mode_3_u];

	[advControlBG addSubview:mode_1];
	[advControlBG addSubview:mode_2];
	[advControlBG addSubview:mode_3];

	rec_u = [UIImage imageNamed:@"mic_rec_u.png"];
	rec_s = [UIImage imageNamed:@"mic_rec_s.png"];
	play_u = [UIImage imageNamed:@"mic_play_u.png"];
	play_s = [UIImage imageNamed:@"mic_play_s.png"];

	record = [[UIImageView alloc] initWithFrame:CGRectMake(800, 214, 64, 64)];
	[record setImage:rec_u];
	play = [[UIImageView alloc] initWithFrame:CGRectMake(910, 214, 59, 66)];
	[play setImage:play_u];

	[advControlBG addSubview:record];
	[advControlBG addSubview:play];

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
                         controlView.frame = CGRectMake(0, -407, 1024, 407);
                     }
                     completion:^(BOOL finished){
						 [UIView animateWithDuration:0.3
											   delay:0
											 options: (UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionAllowUserInteraction)
										  animations:^{
											  instrumentSelection.frame = CGRectMake(0, -220, 1024, 220);
										  }
										  completion:^(BOOL finished){
											  NSLog(@"Advanced menu disabled.");
										  }];
                     }];
	advancedmenushowing = false;
}

-(void)showAdcancedMenu {
	[UIView animateWithDuration:0.3
						  delay:0
						options: (UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionAllowUserInteraction)
					 animations:^{
						 instrumentSelection.frame = CGRectMake(0, 0, 1024, 220);
					 }
					 completion:^(BOOL finished){
						 [UIView animateWithDuration:0.3
											   delay:0
											 options: (UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionAllowUserInteraction)
										  animations:^{
											  controlView.frame = CGRectMake(0, 190, 1024, 407);
										  }
										  completion:^(BOOL finished){
											  NSLog(@"Advanced menu enabled.");
										  }];
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
	[sharedmusic NoteOn:1];
}
- (void)key_1_released {
	NSLog(@"Key 1 up.");
	key_1_state = false;
	[key_1 setImage:key_1_defaultBG];
	[key_1 setNeedsDisplay];
	[sharedmusic NoteOff:1];
}
- (void)key_2_pressed {
	NSLog(@"Key 2 down.");
	key_2_state = true;
	[key_2 setImage:key_2_selBG];
	[key_2 setNeedsDisplay];
	[sharedmusic NoteOn:2];
}
- (void)key_2_released {
	NSLog(@"Key 2 up.");
	key_2_state = false;
	[key_2 setImage:key_2_defaultBG];
	[key_2 setNeedsDisplay];
	[sharedmusic NoteOff:2];
}
- (void)key_3_pressed {
	NSLog(@"Key 3 down.");
	key_3_state = true;
	[key_3 setImage:key_3_selBG];
	[key_3 setNeedsDisplay];
	[sharedmusic NoteOn:3];
}
- (void)key_3_released {
	NSLog(@"Key 3 up.");
	key_3_state = false;
	[key_3 setImage:key_3_defaultBG];
	[key_3 setNeedsDisplay];
	[sharedmusic NoteOff:3];
}
- (void)key_4_pressed {
	NSLog(@"Key 4 down.");
	key_4_state = true;
	[key_4 setImage:key_4_selBG];
	[key_4 setNeedsDisplay];
	[sharedmusic NoteOn:4];
}
- (void)key_4_released {
	NSLog(@"Key 4 up.");
	key_4_state = false;
	[key_4 setImage:key_4_defaultBG];
	[key_4 setNeedsDisplay];
	[sharedmusic NoteOff:4];
}
- (void)key_5_pressed {
	NSLog(@"Key 5 down.");
	key_5_state = true;
	[key_5 setImage:key_5_selBG];
	[key_5 setNeedsDisplay];
	[sharedmusic NoteOn:5];
}
- (void)key_5_released {
	NSLog(@"Key 5 up.");
	key_5_state = false;
	[key_5 setImage:key_5_defaultBG];
	[key_5 setNeedsDisplay];
	[sharedmusic NoteOff:5];
}
- (void)key_6_pressed {
	NSLog(@"Key 6 down.");
	key_6_state = true;
	[key_6 setImage:key_6_selBG];
	[key_6 setNeedsDisplay];
	[sharedmusic NoteOn:6];
}
- (void)key_6_released {
	NSLog(@"Key 6 up.");
	key_6_state = false;
	[key_6 setImage:key_6_defaultBG];
	[key_6 setNeedsDisplay];
	[sharedmusic NoteOff:6];
}
- (void)key_7_pressed {
	NSLog(@"Key 7 down.");
	key_7_state = true;
	[key_7 setImage:key_7_selBG];
	[key_7 setNeedsDisplay];
	[sharedmusic NoteOn:7];
}
- (void)key_7_released {
	NSLog(@"Key 7 up.");
	key_7_state = false;
	[key_7 setImage:key_7_defaultBG];
	[key_7 setNeedsDisplay];
	[sharedmusic NoteOff:7];
}
- (void)key_8_pressed {
	NSLog(@"Key 8 down.");
	key_8_state = true;
	[key_8 setImage:key_8_selBG];
	[key_8 setNeedsDisplay];
	[sharedmusic NoteOn:8];
}
- (void)key_8_released {
	NSLog(@"Key 8 up.");
	key_8_state = false;
	[key_8 setImage:key_8_defaultBG];
	[key_8 setNeedsDisplay];
	[sharedmusic NoteOff:8];
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
-(void)handleKeyPressesPoly:(UIEvent *)event keyToCheck:(UIImageView *)key{
	bool on = false;
	for (UITouch *touch in [event allTouches]) {
		if (CGRectContainsPoint(key.frame, [touch locationInView:backgroundView])) {
			on = true;
			break;
		}
	}
	if (on && CGRectEqualToRect(key.frame, key_1.frame) && !key_1_state) [self key_1_pressed];
	else if (!on && CGRectEqualToRect(key.frame, key_1.frame) && key_1_state) [self key_1_released];
	if (on && CGRectEqualToRect(key.frame, key_2.frame) && !key_2_state) [self key_2_pressed];
	else if (!on && CGRectEqualToRect(key.frame, key_2.frame) && key_2_state) [self key_2_released];
	if (on && CGRectEqualToRect(key.frame, key_3.frame) && !key_3_state) [self key_3_pressed];
	else if (!on && CGRectEqualToRect(key.frame, key_3.frame) && key_3_state) [self key_3_released];
	if (on && CGRectEqualToRect(key.frame, key_4.frame) && !key_4_state) [self key_4_pressed];
	else if (!on && CGRectEqualToRect(key.frame, key_4.frame) && key_4_state) [self key_4_released];
	if (on && CGRectEqualToRect(key.frame, key_5.frame) && !key_5_state) [self key_5_pressed];
	else if (!on && CGRectEqualToRect(key.frame, key_5.frame) && key_5_state) [self key_5_released];
	if (on && CGRectEqualToRect(key.frame, key_6.frame) && !key_6_state) [self key_6_pressed];
	else if (!on && CGRectEqualToRect(key.frame, key_6.frame) && key_6_state) [self key_6_released];
	if (on && CGRectEqualToRect(key.frame, key_7.frame) && !key_7_state) [self key_7_pressed];
	else if (!on && CGRectEqualToRect(key.frame, key_7.frame) && key_7_state) [self key_7_released];
	if (on && CGRectEqualToRect(key.frame, key_8.frame) && !key_8_state) [self key_8_pressed];
	else if (!on && CGRectEqualToRect(key.frame, key_8.frame) && key_8_state) [self key_8_released];
}
-(void)handleKeyPressesMono:(UITouch *)touch keyToCheck:(UIImageView *)key{
	bool on = false;
	if (CGRectContainsPoint(key.frame, [touch locationInView:backgroundView])) on = true;

	if (on && CGRectEqualToRect(key.frame, key_1.frame) && !key_1_state) [self key_1_pressed];
	else if (!on && CGRectEqualToRect(key.frame, key_1.frame) && key_1_state) [self key_1_released];
	if (on && CGRectEqualToRect(key.frame, key_2.frame) && !key_2_state) [self key_2_pressed];
	else if (!on && CGRectEqualToRect(key.frame, key_2.frame) && key_2_state) [self key_2_released];
	if (on && CGRectEqualToRect(key.frame, key_3.frame) && !key_3_state) [self key_3_pressed];
	else if (!on && CGRectEqualToRect(key.frame, key_3.frame) && key_3_state) [self key_3_released];
	if (on && CGRectEqualToRect(key.frame, key_4.frame) && !key_4_state) [self key_4_pressed];
	else if (!on && CGRectEqualToRect(key.frame, key_4.frame) && key_4_state) [self key_4_released];
	if (on && CGRectEqualToRect(key.frame, key_5.frame) && !key_5_state) [self key_5_pressed];
	else if (!on && CGRectEqualToRect(key.frame, key_5.frame) && key_5_state) [self key_5_released];
	if (on && CGRectEqualToRect(key.frame, key_6.frame) && !key_6_state) [self key_6_pressed];
	else if (!on && CGRectEqualToRect(key.frame, key_6.frame) && key_6_state) [self key_6_released];
	if (on && CGRectEqualToRect(key.frame, key_7.frame) && !key_7_state) [self key_7_pressed];
	else if (!on && CGRectEqualToRect(key.frame, key_7.frame) && key_7_state) [self key_7_released];
	if (on && CGRectEqualToRect(key.frame, key_8.frame) && !key_8_state) [self key_8_pressed];
	else if (!on && CGRectEqualToRect(key.frame, key_8.frame) && key_8_state) [self key_8_released];
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
-(void) setCurrentInstrument:(SharedMusicInstrument)inst {
	[sharedmusic selectInstrument:inst];
	currentInstrument = inst;
	if (inst == piano) {
		NSLog(@"Setting instrument to Piano...");
		[inst_1 setImage:inst_1_s];
		[inst_2 setImage:inst_2_u];
		[inst_3 setImage:inst_3_u];
		[inst_4 setImage:inst_4_u];
	} else if (inst == strings) {
		NSLog(@"Setting instrument to Strings...");
		[inst_1 setImage:inst_1_u];
		[inst_2 setImage:inst_2_s];
		[inst_3 setImage:inst_3_u];
		[inst_4 setImage:inst_4_u];
	} else if (inst == bells) {
		NSLog(@"Setting instrument to Bells...");
		[inst_1 setImage:inst_1_u];
		[inst_2 setImage:inst_2_u];
		[inst_3 setImage:inst_3_s];
		[inst_4 setImage:inst_4_u];
	} else if (inst == horn) {
		NSLog(@"Setting instrument to Horn...");
		[inst_1 setImage:inst_1_u];
		[inst_2 setImage:inst_2_u];
		[inst_3 setImage:inst_3_u];
		[inst_4 setImage:inst_4_s];
	}
}
-(void)setCurrentMode:(SharedMusicMode)mode {
	currentMode = mode;
	if (mode == single) {
		NSLog(@"Setting mode to Single...");
		[mode_1 setImage:mode_1_s];
		[mode_2 setImage:mode_2_u];
		[mode_3 setImage:mode_3_u];
		[sharedmusic selectMode:single];
	} else if (mode == chord) {
		NSLog(@"Setting mode to Chord...");
		[mode_1 setImage:mode_1_u];
		[mode_2 setImage:mode_2_s];
		[mode_3 setImage:mode_3_u];
		[sharedmusic selectMode:chord];
	} else if (mode == arpegiated) {
		NSLog(@"Setting mode to Arpegiated...");
		[mode_1 setImage:mode_1_u];
		[mode_2 setImage:mode_2_u];
		[mode_3 setImage:mode_3_s];
		[sharedmusic selectMode:arpegiated];
	}
}
-(void)setCurrentKey:(SharedMusicKey)key {
	currentKey = key;
	if (key == CMajor) {
		NSLog(@"Setting key to C Major...");
		[musickey_1 setImage:key_c_s];
		[musickey_2 setImage:key_f_u];
		[musickey_3 setImage:key_g_u];
		[sharedmusic selectKey:CMajor];
	} else if (key == FMajor) {
		NSLog(@"Setting key to F Major...");
		[musickey_1 setImage:key_c_u];
		[musickey_2 setImage:key_f_s];
		[musickey_3 setImage:key_g_u];
		[sharedmusic selectKey:FMajor];
	} else if (key == GMajor) {
		NSLog(@"Setting key to G Major...");
		[musickey_1 setImage:key_c_u];
		[musickey_2 setImage:key_f_u];
		[musickey_3 setImage:key_g_s];
		[sharedmusic selectKey:GMajor];
	}
}
+(void)setRecordingState:(RecordingState)state {
	currentRecordingState = state;
	if (state == idle) {
		NSLog(@"Returning to idle recording state");
		[record setImage:rec_u];
		[play setImage:play_u];
	} else if (state == recording) {
		NSLog(@"Entering recording state...");
		[record setImage:rec_s];
		[play setImage:play_u];
	} else if (state == playback) {
		NSLog(@"Entering playback state...");
		[record setImage:rec_u];
		[play setImage:play_s];
	}
}

-(void)handleModeState:(UITouch *)touch {
	if (currentMode!=single && CGRectContainsPoint(mode_1.frame, [touch locationInView:advControlBG])) [self setCurrentMode:single];
	if (currentMode!=chord && CGRectContainsPoint(mode_2.frame, [touch locationInView:advControlBG])) [self setCurrentMode:chord];
	if (currentMode!=arpegiated && CGRectContainsPoint(mode_3.frame, [touch locationInView:advControlBG])) [self setCurrentMode:arpegiated];
}
-(void)handleInstrumentState:(UITouch *)touch {
	if (currentInstrument!=piano && CGRectContainsPoint(inst_1.frame, [touch locationInView:instrumentSelection])) [self setCurrentInstrument:piano];
	if (currentInstrument!=strings && CGRectContainsPoint(inst_2.frame, [touch locationInView:instrumentSelection])) [self setCurrentInstrument:strings];
	if (currentInstrument!=bells && CGRectContainsPoint(inst_3.frame, [touch locationInView:instrumentSelection])) [self setCurrentInstrument:bells];
	if (currentInstrument!=horn && CGRectContainsPoint(inst_4.frame, [touch locationInView:instrumentSelection])) [self setCurrentInstrument:horn];
}
-(void)handleMusicKeyState:(UITouch *)touch {
	if (currentKey!=CMajor && CGRectContainsPoint(musickey_1.frame, [touch locationInView:advControlBG])) [self setCurrentKey:CMajor];
	if (currentKey!=FMajor && CGRectContainsPoint(musickey_2.frame, [touch locationInView:advControlBG])) [self setCurrentKey:FMajor];
	if (currentKey!=GMajor && CGRectContainsPoint(musickey_3.frame, [touch locationInView:advControlBG])) [self setCurrentKey:GMajor];
}
-(void)handleMicButtons:(UITouch *)touch {
	if (CGRectContainsPoint(record.frame, [touch locationInView:advControlBG])) {
		if (currentRecordingState == idle) {
			//Start recording
			[ViewController setRecordingState:recording];
			[sharedmusic startRecording];
		} else if (currentRecordingState == recording) {
			//Stop recording and enter idle
			[ViewController setRecordingState:idle];
			[sharedmusic stopRecording];
		} else if (currentRecordingState == playback) {
			//stop playback and enter recording
			[ViewController setRecordingState:recording];
			[sharedmusic stopPlayback];
			[sharedmusic startRecording];
		}
	} else if (CGRectContainsPoint(play.frame, [touch locationInView:advControlBG])) {
		if (currentRecordingState == idle) {
			//start playback
			[ViewController setRecordingState:playback];
			[sharedmusic startPlayback];
		} else if (currentRecordingState == recording) {
			//stop recording and enter playback
			[ViewController setRecordingState:playback];
			[sharedmusic stopRecording];
			[sharedmusic startPlayback];
		} else if (currentRecordingState == playback) {
			//stop playback and enter idle
			[ViewController setRecordingState:idle];
			[sharedmusic stopPlayback];
		}
	}
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
	if (currentMode == single) {
		for (UITouch *touch in [event allTouches]) {
			[self handleKeyPressesPoly:event keyToCheck:key_1];
			[self handleKeyPressesPoly:event keyToCheck:key_2];
			[self handleKeyPressesPoly:event keyToCheck:key_3];
			[self handleKeyPressesPoly:event keyToCheck:key_4];
			[self handleKeyPressesPoly:event keyToCheck:key_5];
			[self handleKeyPressesPoly:event keyToCheck:key_6];
			[self handleKeyPressesPoly:event keyToCheck:key_7];
			[self handleKeyPressesPoly:event keyToCheck:key_8];
		}
	}else {
		if (event.allTouches.count == 1) {
			[self handleKeyPressesMono:[touches anyObject] keyToCheck:key_1];
			[self handleKeyPressesMono:[touches anyObject] keyToCheck:key_2];
			[self handleKeyPressesMono:[touches anyObject] keyToCheck:key_3];
			[self handleKeyPressesMono:[touches anyObject] keyToCheck:key_4];
			[self handleKeyPressesMono:[touches anyObject] keyToCheck:key_5];
			[self handleKeyPressesMono:[touches anyObject] keyToCheck:key_6];
			[self handleKeyPressesMono:[touches anyObject] keyToCheck:key_7];
			[self handleKeyPressesMono:[touches anyObject] keyToCheck:key_8];
		}
	}
}
+(void)clearRecordingState {
	[ViewController setRecordingState:idle];
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	if (currentMode == single) {
		for (UITouch *touch in [event allTouches]) {
			[self handleKeyPressesPoly:event keyToCheck:key_1];
			[self handleKeyPressesPoly:event keyToCheck:key_2];
			[self handleKeyPressesPoly:event keyToCheck:key_3];
			[self handleKeyPressesPoly:event keyToCheck:key_4];
			[self handleKeyPressesPoly:event keyToCheck:key_5];
			[self handleKeyPressesPoly:event keyToCheck:key_6];
			[self handleKeyPressesPoly:event keyToCheck:key_7];
			[self handleKeyPressesPoly:event keyToCheck:key_8];
		}
	}else {
		if (event.allTouches.count == 1) {
			[self handleKeyPressesMono:[touches anyObject] keyToCheck:key_1];
			[self handleKeyPressesMono:[touches anyObject] keyToCheck:key_2];
			[self handleKeyPressesMono:[touches anyObject] keyToCheck:key_3];
			[self handleKeyPressesMono:[touches anyObject] keyToCheck:key_4];
			[self handleKeyPressesMono:[touches anyObject] keyToCheck:key_5];
			[self handleKeyPressesMono:[touches anyObject] keyToCheck:key_6];
			[self handleKeyPressesMono:[touches anyObject] keyToCheck:key_7];
			[self handleKeyPressesMono:[touches anyObject] keyToCheck:key_8];
		}
	}

	//handle instruments
	if (event.allTouches.count == 1) {
		[self handleInstrumentState:[touches anyObject]];
		[self handleModeState:[touches anyObject]];
		[self handleMusicKeyState:[touches anyObject]];
		[self handleMicButtons:[touches anyObject]];
	}
}
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
	for (UITouch *touch in [event allTouches]) {
		[self handlePianoKeyReleases:touch];
	}
}
@end
