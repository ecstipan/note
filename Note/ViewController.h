//
//  ViewController.h
//  Note
//
//  Created by Rayce Stipanovich on 2/5/13.
//  Copyright (c) 2013 WPI. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {

	//assign an outlet to our object
	UIImageView * backgroundView;
	UIView *controlView;
	UIView *instrumentSelection;
	UIImageView * instrumentBG;
	UIImageView * advControlBG;

	UIImageView * key_1;
	UIImageView * key_2;
	UIImageView * key_3;
	UIImageView * key_4;
	UIImageView * key_5;
	UIImageView * key_6;
	UIImageView * key_7;
	UIImageView * key_8;

	UIImage * key_1_defaultBG;
	UIImage * key_2_defaultBG;
	UIImage * key_3_defaultBG;
	UIImage * key_4_defaultBG;
	UIImage * key_5_defaultBG;
	UIImage * key_6_defaultBG;
	UIImage * key_7_defaultBG;
	UIImage * key_8_defaultBG;

	UIImage * key_1_selBG;
	UIImage * key_2_selBG;
	UIImage * key_3_selBG;
	UIImage * key_4_selBG;
	UIImage * key_5_selBG;
	UIImage * key_6_selBG;
	UIImage * key_7_selBG;
	UIImage * key_8_selBG;

	bool key_1_state;
	bool key_2_state;
	bool key_3_state;
	bool key_4_state;
	bool key_5_state;
	bool key_6_state;
	bool key_7_state;
	bool key_8_state;

	short int keyCount;

	//other constants used for logicS
	bool advancedmenushowing;

	short int UIKeyOffset;
}

@end
