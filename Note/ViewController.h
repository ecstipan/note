//
//  ViewController.h
//  Note
//
//  Created by Rayce Stipanovich on 2/5/13.
//  Copyright (c) 2013 WPI. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SharedMusic.h"
#import "InstruScroll.h"

@interface ViewController : UIViewController
<AVAudioRecorderDelegate, AVAudioPlayerDelegate, UIScrollViewDelegate>
{

	short int keyCount;

	//other constants used for logicS
	bool advancedmenushowing;

	short int UIKeyOffset;
	short int UIInstOffset;

}
	- (void) clearRecordingState;
	- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event;
@end
