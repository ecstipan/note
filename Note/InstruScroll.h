//
//  InstruScroll.h
//  Note
//
//  Created by Rayce Stipanovich on 6/16/13.
//  Copyright (c) 2013 WPI. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InstruScroll : UIScrollView {
}
	- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event;
	- (void) setParentViewScroll:(UIViewController *)parent;
@end
