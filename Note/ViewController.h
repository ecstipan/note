//
//  ViewController.h
//  Note
//
//  Created by Rayce Stipanovich on 2/5/13.
//  Copyright (c) 2013 WPI. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SharedMusic.h"

@interface ViewController : UIViewController
{

	short int keyCount;

	//other constants used for logicS
	bool advancedmenushowing;

	short int UIKeyOffset;
	short int UIInstOffset;

	SharedMusic * sharedmusic;
}
	+ (void) clearRecordingState;
@end
