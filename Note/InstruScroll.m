//
//  InstruScroll.m
//  Note
//
//  Created by Rayce Stipanovich on 6/16/13.
//  Copyright (c) 2013 WPI. All rights reserved.
//

#import "InstruScroll.h"

UIViewController *parentController;

@implementation InstruScroll
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	[parentController touchesBegan:touches withEvent:event];
}
- (void) setParentViewScroll:(UIViewController *)parent {
	parentController = (UIViewController *)parent;
}
@end
