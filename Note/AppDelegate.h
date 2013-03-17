//
//  AppDelegate.h
//  Note
//
//  Created by Rayce Stipanovich on 2/5/13.
//  Copyright (c) 2013 WPI. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>
	- (BOOL)application:(UIApplication *)application shouldSaveApplicationState:(NSCoder *)coder;
	- (BOOL)application:(UIApplication *)application shouldRestoreApplicationState:(NSCoder *)coder;

@property (strong, nonatomic) UIWindow *window;

@end
