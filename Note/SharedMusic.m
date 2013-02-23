//
//  SharedMusic.m
//  Note
//
//  Created by Rayce Stipanovich on 2/19/13.
//  Copyright (c) 2013 WPI. All rights reserved.
//

#import "SharedMusic.h"

@interface SharedMusic () 
	
@end

static SharedMusicInstrument MusicInstrument = piano;
static SharedMusicKey MusicKey = CMajor;
static SharedMusicMode MusicMode = single;

@implementation SharedMusic

	+ (void)NoteOn:(NSInteger)key_number {
		
	}


	+ (void)NoteOff:(NSInteger)key_number {
		
	}

	//Setters
	+ (void)selectInstrument:(SharedMusicInstrument)inst {
		MusicInstrument = inst;
	}
	+ (void)selectMode:(SharedMusicMode)mode {
		MusicMode = mode;
	}
	+ (void)selectKey:(SharedMusicKey)key {
		MusicKey = key;
	}

	//Getters
	+ (SharedMusicKey)getKey {
		return MusicKey;
	}
	+ (SharedMusicInstrument)getInstrument {
		return MusicInstrument;
	}
	+ (SharedMusicMode)getMode {
		return MusicMode;
	}

	//Voice Recording
	+ (void)startRecording {
		
	}
	+ (void)stopRecording {
		
	}
	+ (void)startPlayback {
		
	}
	+ (void)stopPlayback {
		
	}
@end
