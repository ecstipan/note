//
//  SharedMusic.h
//  Note
//
//  Created by Rayce Stipanovich on 2/19/13.
//  Copyright (c) 2013 WPI. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SharedMusic : NSObject
	-(void)NoteOn:(short int)key_number;
	-(void)NoteOff:(short int)key_number;
@end
