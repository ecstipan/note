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

	//other constants
	bool advancedmenushowing;
}

@end
