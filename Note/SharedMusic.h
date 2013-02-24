//
//  SharedMusic.h
//  Note
//
//  Created by Rayce Stipanovich on 2/19/13.
//  Copyright (c) 2013 WPI. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SharedMusic : NSObject
	+ (void)NoteOn:(NSInteger)key_number;
	+ (void)NoteOff:(NSInteger)key_number;
@end
