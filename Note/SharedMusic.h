//
//  SharedMusic.h
//  Note
//
//  Created by Rayce Stipanovich on 2/19/13.
//  Copyright (c) 2013 WPI. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface SharedMusic : NSObject
<AVAudioRecorderDelegate, AVAudioPlayerDelegate>
{
	AVAudioRecorder * audioRecorder;
	AVAudioPlayer * audioPlayer;
	
}
	typedef enum {
		CMajor = 1,
		FMajor = 2,
		GMajor = 3
	} SharedMusicKey;

	typedef enum {
		single = 1,
		chord = 2,
		arpegiated = 3
	} SharedMusicMode;

	typedef enum {
		piano = 1,
		strings = 2,
		bells = 3,
		horn = 4
	} SharedMusicInstrument;

	typedef enum {
		idle,
		playback,
		recording
	} RecordingState;

	- (void)NoteOn:(NSInteger)key_number;
	- (void)NoteOff:(NSInteger)key_number;

	- (void)selectInstrument:(SharedMusicInstrument)inst;
	- (void)selectMode:(SharedMusicMode)mode;
	- (void)selectKey:(SharedMusicKey)key;
	
	- (SharedMusicKey)getKey;
	- (SharedMusicInstrument)getInstrument;
	- (SharedMusicMode)getMode;

	- (void) configureRecording;

	- (void)startRecording;
	- (void)stopRecording;
	- (void)startPlayback;
	- (void)stopPlayback;
@end
