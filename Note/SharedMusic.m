//
//  SharedMusic.m
//  Note
//
//  Created by Rayce Stipanovich on 2/19/13.
//  Copyright (c) 2013 WPI. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SharedMusic.h"
#import "AppDelegate.h"
#import "ViewController.h"
#import <CoreAudio/CoreAudioTypes.h>
#import <AVFoundation/AVFoundation.h>
#import <AudioToolbox/AudioToolbox.h>

@interface SharedMusic () {

}
	
@end

SharedMusicInstrument MusicInstrument = piano;
SharedMusicKey MusicKey = CMajor;
SharedMusicMode MusicMode = single;

SystemSoundID globalSounds[6][3][3][8]; //[instrument][mode][key][note]

ViewController * parentViewController;
AVAudioSession *session;

@implementation SharedMusic
	- (void)NoteOn:(NSInteger)key_number {
		NSLog(@"AUDIO: NOTE ON %i", key_number);
		AudioServicesPlaySystemSound(globalSounds[MusicInstrument][MusicMode][MusicKey][key_number-1]);
	}

	- (void)setDelegateController:(UIViewController *)control {
		parentViewController = (ViewController *)control;
	}

	- (void)NoteOff:(NSInteger)key_number {
		//Depreciated
	}

	//Setters
	- (void)selectInstrument:(SharedMusicInstrument)inst {
		MusicInstrument = inst;
	}
	- (void)selectMode:(SharedMusicMode)mode {
		MusicMode = mode;
	}
	- (void)selectKey:(SharedMusicKey)key {
		MusicKey = key;
	}

	//Getters
	- (SharedMusicKey)getKey {
		return MusicKey;
	}
	- (SharedMusicInstrument)getInstrument {
		return MusicInstrument;
	}
	- (SharedMusicMode)getMode {
		return MusicMode;
	}

	- (void) addSample:(NSString *)sample keyNumber:(int)key instrument:(SharedMusicInstrument)instrument mode:(SharedMusicMode)mode musicalKey:(SharedMusicKey)keySignature {
		NSString * test = [NSString stringWithFormat:@"%@", sample];
		NSLog(@"ADDING: %@", test);
		NSString *pewPewPath = [[NSBundle mainBundle] pathForResource:test ofType:@"wav"];
		NSURL *pewPewURL = [NSURL fileURLWithPath:pewPewPath];
		AudioServicesCreateSystemSoundID((CFURLRef)pewPewURL, &globalSounds[(int)instrument][(int)mode][(int)keySignature][(int)(key - 1)]);
	}

	- (void) initializeSampleLibrary {
		//PIANO
		//SINGLE
		[self addSample:@"1_1_1_1" keyNumber:1 instrument:piano mode:single musicalKey:CMajor];
		[self addSample:@"1_1_1_2" keyNumber:2 instrument:piano mode:single musicalKey:CMajor];
		[self addSample:@"1_1_1_3" keyNumber:3 instrument:piano mode:single musicalKey:CMajor];
		[self addSample:@"1_1_1_4" keyNumber:4 instrument:piano mode:single musicalKey:CMajor];
		[self addSample:@"1_1_1_5" keyNumber:5 instrument:piano mode:single musicalKey:CMajor];
		[self addSample:@"1_1_1_6" keyNumber:6 instrument:piano mode:single musicalKey:CMajor];
		[self addSample:@"1_1_1_7" keyNumber:7 instrument:piano mode:single musicalKey:CMajor];
		[self addSample:@"1_1_1_8" keyNumber:8 instrument:piano mode:single musicalKey:CMajor];

		[self addSample:@"1_1_2_1" keyNumber:1 instrument:piano mode:single musicalKey:FMajor];
		[self addSample:@"1_1_2_2" keyNumber:2 instrument:piano mode:single musicalKey:FMajor];
		[self addSample:@"1_1_2_3" keyNumber:3 instrument:piano mode:single musicalKey:FMajor];
		[self addSample:@"1_1_2_4" keyNumber:4 instrument:piano mode:single musicalKey:FMajor];
		[self addSample:@"1_1_2_5" keyNumber:5 instrument:piano mode:single musicalKey:FMajor];
		[self addSample:@"1_1_2_6" keyNumber:6 instrument:piano mode:single musicalKey:FMajor];
		[self addSample:@"1_1_2_7" keyNumber:7 instrument:piano mode:single musicalKey:FMajor];
		[self addSample:@"1_1_2_8" keyNumber:8 instrument:piano mode:single musicalKey:FMajor];

		[self addSample:@"1_1_3_1" keyNumber:1 instrument:piano mode:single musicalKey:GMajor];
		[self addSample:@"1_1_3_2" keyNumber:2 instrument:piano mode:single musicalKey:GMajor];
		[self addSample:@"1_1_3_3" keyNumber:3 instrument:piano mode:single musicalKey:GMajor];
		[self addSample:@"1_1_3_4" keyNumber:4 instrument:piano mode:single musicalKey:GMajor];
		[self addSample:@"1_1_3_5" keyNumber:5 instrument:piano mode:single musicalKey:GMajor];
		[self addSample:@"1_1_3_6" keyNumber:6 instrument:piano mode:single musicalKey:GMajor];
		[self addSample:@"1_1_3_7" keyNumber:7 instrument:piano mode:single musicalKey:GMajor];
		[self addSample:@"1_1_3_8" keyNumber:8 instrument:piano mode:single musicalKey:GMajor];

		
		//CHORD
		[self addSample:@"1_2_1_1" keyNumber:1 instrument:piano mode:chord musicalKey:CMajor];
		[self addSample:@"1_2_1_2" keyNumber:2 instrument:piano mode:chord musicalKey:CMajor];
		[self addSample:@"1_2_1_3" keyNumber:3 instrument:piano mode:chord musicalKey:CMajor];
		[self addSample:@"1_2_1_4" keyNumber:4 instrument:piano mode:chord musicalKey:CMajor];
		[self addSample:@"1_2_1_5" keyNumber:5 instrument:piano mode:chord musicalKey:CMajor];
		[self addSample:@"1_2_1_6" keyNumber:6 instrument:piano mode:chord musicalKey:CMajor];
		[self addSample:@"1_2_1_7" keyNumber:7 instrument:piano mode:chord musicalKey:CMajor];
		[self addSample:@"1_2_1_8" keyNumber:8 instrument:piano mode:chord musicalKey:CMajor];

		[self addSample:@"1_2_2_1" keyNumber:1 instrument:piano mode:chord musicalKey:FMajor];
		[self addSample:@"1_2_2_2" keyNumber:2 instrument:piano mode:chord musicalKey:FMajor];
		[self addSample:@"1_2_2_3" keyNumber:3 instrument:piano mode:chord musicalKey:FMajor];
		[self addSample:@"1_2_2_4" keyNumber:4 instrument:piano mode:chord musicalKey:FMajor];
		[self addSample:@"1_2_2_5" keyNumber:5 instrument:piano mode:chord musicalKey:FMajor];
		[self addSample:@"1_2_2_6" keyNumber:6 instrument:piano mode:chord musicalKey:FMajor];
		[self addSample:@"1_2_2_7" keyNumber:7 instrument:piano mode:chord musicalKey:FMajor];
		[self addSample:@"1_2_2_8" keyNumber:8 instrument:piano mode:chord musicalKey:FMajor];

		[self addSample:@"1_2_3_1" keyNumber:1 instrument:piano mode:chord musicalKey:GMajor];
		[self addSample:@"1_2_3_2" keyNumber:2 instrument:piano mode:chord musicalKey:GMajor];
		[self addSample:@"1_2_3_3" keyNumber:3 instrument:piano mode:chord musicalKey:GMajor];
		[self addSample:@"1_2_3_4" keyNumber:4 instrument:piano mode:chord musicalKey:GMajor];
		[self addSample:@"1_2_3_5" keyNumber:5 instrument:piano mode:chord musicalKey:GMajor];
		[self addSample:@"1_2_3_6" keyNumber:6 instrument:piano mode:chord musicalKey:GMajor];
		[self addSample:@"1_2_3_7" keyNumber:7 instrument:piano mode:chord musicalKey:GMajor];
		[self addSample:@"1_2_3_8" keyNumber:8 instrument:piano mode:chord musicalKey:GMajor];

		
		//ARPEGIATED
		[self addSample:@"1_3_1_1" keyNumber:1 instrument:piano mode:arpegiated musicalKey:CMajor];
		[self addSample:@"1_3_1_2" keyNumber:2 instrument:piano mode:arpegiated musicalKey:CMajor];
		[self addSample:@"1_3_1_3" keyNumber:3 instrument:piano mode:arpegiated musicalKey:CMajor];
		[self addSample:@"1_3_1_4" keyNumber:4 instrument:piano mode:arpegiated musicalKey:CMajor];
		[self addSample:@"1_3_1_5" keyNumber:5 instrument:piano mode:arpegiated musicalKey:CMajor];
		[self addSample:@"1_3_1_6" keyNumber:6 instrument:piano mode:arpegiated musicalKey:CMajor];
		[self addSample:@"1_3_1_7" keyNumber:7 instrument:piano mode:arpegiated musicalKey:CMajor];
		[self addSample:@"1_3_1_8" keyNumber:8 instrument:piano mode:arpegiated musicalKey:CMajor];

		[self addSample:@"1_3_2_1" keyNumber:1 instrument:piano mode:arpegiated musicalKey:FMajor];
		[self addSample:@"1_3_2_2" keyNumber:2 instrument:piano mode:arpegiated musicalKey:FMajor];
		[self addSample:@"1_3_2_3" keyNumber:3 instrument:piano mode:arpegiated musicalKey:FMajor];
		[self addSample:@"1_3_2_4" keyNumber:4 instrument:piano mode:arpegiated musicalKey:FMajor];
		[self addSample:@"1_3_2_5" keyNumber:5 instrument:piano mode:arpegiated musicalKey:FMajor];
		[self addSample:@"1_3_2_6" keyNumber:6 instrument:piano mode:arpegiated musicalKey:FMajor];
		[self addSample:@"1_3_2_7" keyNumber:7 instrument:piano mode:arpegiated musicalKey:FMajor];
		[self addSample:@"1_3_2_8" keyNumber:8 instrument:piano mode:arpegiated musicalKey:FMajor];

		[self addSample:@"1_3_3_1" keyNumber:1 instrument:piano mode:arpegiated musicalKey:GMajor];
		[self addSample:@"1_3_3_2" keyNumber:2 instrument:piano mode:arpegiated musicalKey:GMajor];
		[self addSample:@"1_3_3_3" keyNumber:3 instrument:piano mode:arpegiated musicalKey:GMajor];
		[self addSample:@"1_3_3_4" keyNumber:4 instrument:piano mode:arpegiated musicalKey:GMajor];
		[self addSample:@"1_3_3_5" keyNumber:5 instrument:piano mode:arpegiated musicalKey:GMajor];
		[self addSample:@"1_3_3_6" keyNumber:6 instrument:piano mode:arpegiated musicalKey:GMajor];
		[self addSample:@"1_3_3_7" keyNumber:7 instrument:piano mode:arpegiated musicalKey:GMajor];
		[self addSample:@"1_3_3_8" keyNumber:8 instrument:piano mode:arpegiated musicalKey:GMajor];

		
		//STRINGS
		//SINGLE
		[self addSample:@"2_1_1_1" keyNumber:1 instrument:strings mode:single musicalKey:CMajor];
		[self addSample:@"2_1_1_2" keyNumber:2 instrument:strings mode:single musicalKey:CMajor];
		[self addSample:@"2_1_1_3" keyNumber:3 instrument:strings mode:single musicalKey:CMajor];
		[self addSample:@"2_1_1_4" keyNumber:4 instrument:strings mode:single musicalKey:CMajor];
		[self addSample:@"2_1_1_5" keyNumber:5 instrument:strings mode:single musicalKey:CMajor];
		[self addSample:@"2_1_1_6" keyNumber:6 instrument:strings mode:single musicalKey:CMajor];
		[self addSample:@"2_1_1_7" keyNumber:7 instrument:strings mode:single musicalKey:CMajor];
		[self addSample:@"2_1_1_8" keyNumber:8 instrument:strings mode:single musicalKey:CMajor];

		[self addSample:@"2_1_2_1" keyNumber:1 instrument:strings mode:single musicalKey:FMajor];
		[self addSample:@"2_1_2_2" keyNumber:2 instrument:strings mode:single musicalKey:FMajor];
		[self addSample:@"2_1_2_3" keyNumber:3 instrument:strings mode:single musicalKey:FMajor];
		[self addSample:@"2_1_2_4" keyNumber:4 instrument:strings mode:single musicalKey:FMajor];
		[self addSample:@"2_1_2_5" keyNumber:5 instrument:strings mode:single musicalKey:FMajor];
		[self addSample:@"2_1_2_6" keyNumber:6 instrument:strings mode:single musicalKey:FMajor];
		[self addSample:@"2_1_2_7" keyNumber:7 instrument:strings mode:single musicalKey:FMajor];
		[self addSample:@"2_1_2_8" keyNumber:8 instrument:strings mode:single musicalKey:FMajor];

		[self addSample:@"2_1_3_1" keyNumber:1 instrument:strings mode:single musicalKey:GMajor];
		[self addSample:@"2_1_3_2" keyNumber:2 instrument:strings mode:single musicalKey:GMajor];
		[self addSample:@"2_1_3_3" keyNumber:3 instrument:strings mode:single musicalKey:GMajor];
		[self addSample:@"2_1_3_4" keyNumber:4 instrument:strings mode:single musicalKey:GMajor];
		[self addSample:@"2_1_3_5" keyNumber:5 instrument:strings mode:single musicalKey:GMajor];
		[self addSample:@"2_1_3_6" keyNumber:6 instrument:strings mode:single musicalKey:GMajor];
		[self addSample:@"2_1_3_7" keyNumber:7 instrument:strings mode:single musicalKey:GMajor];
		[self addSample:@"2_1_3_8" keyNumber:8 instrument:strings mode:single musicalKey:GMajor];

		//CHORD
		[self addSample:@"2_2_1_1" keyNumber:1 instrument:strings mode:chord musicalKey:CMajor];
		[self addSample:@"2_2_1_2" keyNumber:2 instrument:strings mode:chord musicalKey:CMajor];
		[self addSample:@"2_2_1_3" keyNumber:3 instrument:strings mode:chord musicalKey:CMajor];
		[self addSample:@"2_2_1_4" keyNumber:4 instrument:strings mode:chord musicalKey:CMajor];
		[self addSample:@"2_2_1_5" keyNumber:5 instrument:strings mode:chord musicalKey:CMajor];
		[self addSample:@"2_2_1_6" keyNumber:6 instrument:strings mode:chord musicalKey:CMajor];
		[self addSample:@"2_2_1_7" keyNumber:7 instrument:strings mode:chord musicalKey:CMajor];
		[self addSample:@"2_2_1_8" keyNumber:8 instrument:strings mode:chord musicalKey:CMajor];

		[self addSample:@"2_2_2_1" keyNumber:1 instrument:strings mode:chord musicalKey:FMajor];
		[self addSample:@"2_2_2_2" keyNumber:2 instrument:strings mode:chord musicalKey:FMajor];
		[self addSample:@"2_2_2_3" keyNumber:3 instrument:strings mode:chord musicalKey:FMajor];
		[self addSample:@"2_2_2_4" keyNumber:4 instrument:strings mode:chord musicalKey:FMajor];
		[self addSample:@"2_2_2_5" keyNumber:5 instrument:strings mode:chord musicalKey:FMajor];
		[self addSample:@"2_2_2_6" keyNumber:6 instrument:strings mode:chord musicalKey:FMajor];
		[self addSample:@"2_2_2_7" keyNumber:7 instrument:strings mode:chord musicalKey:FMajor];
		[self addSample:@"2_2_2_8" keyNumber:8 instrument:strings mode:chord musicalKey:FMajor];

		[self addSample:@"2_2_3_1" keyNumber:1 instrument:strings mode:chord musicalKey:GMajor];
		[self addSample:@"2_2_3_2" keyNumber:2 instrument:strings mode:chord musicalKey:GMajor];
		[self addSample:@"2_2_3_3" keyNumber:3 instrument:strings mode:chord musicalKey:GMajor];
		[self addSample:@"2_2_3_4" keyNumber:4 instrument:strings mode:chord musicalKey:GMajor];
		[self addSample:@"2_2_3_5" keyNumber:5 instrument:strings mode:chord musicalKey:GMajor];
		[self addSample:@"2_2_3_6" keyNumber:6 instrument:strings mode:chord musicalKey:GMajor];
		[self addSample:@"2_2_3_7" keyNumber:7 instrument:strings mode:chord musicalKey:GMajor];
		[self addSample:@"2_2_3_8" keyNumber:8 instrument:strings mode:chord musicalKey:GMajor];

		//ARPEGIATED
		[self addSample:@"2_3_1_1" keyNumber:1 instrument:strings mode:arpegiated musicalKey:CMajor];
		[self addSample:@"2_3_1_2" keyNumber:2 instrument:strings mode:arpegiated musicalKey:CMajor];
		[self addSample:@"2_3_1_3" keyNumber:3 instrument:strings mode:arpegiated musicalKey:CMajor];
		[self addSample:@"2_3_1_4" keyNumber:4 instrument:strings mode:arpegiated musicalKey:CMajor];
		[self addSample:@"2_3_1_5" keyNumber:5 instrument:strings mode:arpegiated musicalKey:CMajor];
		[self addSample:@"2_3_1_6" keyNumber:6 instrument:strings mode:arpegiated musicalKey:CMajor];
		[self addSample:@"2_3_1_7" keyNumber:7 instrument:strings mode:arpegiated musicalKey:CMajor];
		[self addSample:@"2_3_1_8" keyNumber:8 instrument:strings mode:arpegiated musicalKey:CMajor];

		[self addSample:@"2_3_2_1" keyNumber:1 instrument:strings mode:arpegiated musicalKey:FMajor];
		[self addSample:@"2_3_2_2" keyNumber:2 instrument:strings mode:arpegiated musicalKey:FMajor];
		[self addSample:@"2_3_2_3" keyNumber:3 instrument:strings mode:arpegiated musicalKey:FMajor];
		[self addSample:@"2_3_2_4" keyNumber:4 instrument:strings mode:arpegiated musicalKey:FMajor];
		[self addSample:@"2_3_2_5" keyNumber:5 instrument:strings mode:arpegiated musicalKey:FMajor];
		[self addSample:@"2_3_2_6" keyNumber:6 instrument:strings mode:arpegiated musicalKey:FMajor];
		[self addSample:@"2_3_2_7" keyNumber:7 instrument:strings mode:arpegiated musicalKey:FMajor];
		[self addSample:@"2_3_2_8" keyNumber:8 instrument:strings mode:arpegiated musicalKey:FMajor];

		[self addSample:@"2_3_3_1" keyNumber:1 instrument:strings mode:arpegiated musicalKey:GMajor];
		[self addSample:@"2_3_3_2" keyNumber:2 instrument:strings mode:arpegiated musicalKey:GMajor];
		[self addSample:@"2_3_3_3" keyNumber:3 instrument:strings mode:arpegiated musicalKey:GMajor];
		[self addSample:@"2_3_3_4" keyNumber:4 instrument:strings mode:arpegiated musicalKey:GMajor];
		[self addSample:@"2_3_3_5" keyNumber:5 instrument:strings mode:arpegiated musicalKey:GMajor];
		[self addSample:@"2_3_3_6" keyNumber:6 instrument:strings mode:arpegiated musicalKey:GMajor];
		[self addSample:@"2_3_3_7" keyNumber:7 instrument:strings mode:arpegiated musicalKey:GMajor];
		[self addSample:@"2_3_3_8" keyNumber:8 instrument:strings mode:arpegiated musicalKey:GMajor];


		
		//BELLS
		//SINGLE
		[self addSample:@"3_1_1_1" keyNumber:1 instrument:bells mode:single musicalKey:CMajor];
		[self addSample:@"3_1_1_2" keyNumber:2 instrument:bells mode:single musicalKey:CMajor];
		[self addSample:@"3_1_1_3" keyNumber:3 instrument:bells mode:single musicalKey:CMajor];
		[self addSample:@"3_1_1_4" keyNumber:4 instrument:bells mode:single musicalKey:CMajor];
		[self addSample:@"3_1_1_5" keyNumber:5 instrument:bells mode:single musicalKey:CMajor];
		[self addSample:@"3_1_1_6" keyNumber:6 instrument:bells mode:single musicalKey:CMajor];
		[self addSample:@"3_1_1_7" keyNumber:7 instrument:bells mode:single musicalKey:CMajor];
		[self addSample:@"3_1_1_8" keyNumber:8 instrument:bells mode:single musicalKey:CMajor];

		[self addSample:@"3_1_2_1" keyNumber:1 instrument:bells mode:single musicalKey:FMajor];
		[self addSample:@"3_1_2_2" keyNumber:2 instrument:bells mode:single musicalKey:FMajor];
		[self addSample:@"3_1_2_3" keyNumber:3 instrument:bells mode:single musicalKey:FMajor];
		[self addSample:@"3_1_2_4" keyNumber:4 instrument:bells mode:single musicalKey:FMajor];
		[self addSample:@"3_1_2_5" keyNumber:5 instrument:bells mode:single musicalKey:FMajor];
		[self addSample:@"3_1_2_6" keyNumber:6 instrument:bells mode:single musicalKey:FMajor];
		[self addSample:@"3_1_2_7" keyNumber:7 instrument:bells mode:single musicalKey:FMajor];
		[self addSample:@"3_1_2_8" keyNumber:8 instrument:bells mode:single musicalKey:FMajor];

		[self addSample:@"3_1_3_1" keyNumber:1 instrument:bells mode:single musicalKey:GMajor];
		[self addSample:@"3_1_3_2" keyNumber:2 instrument:bells mode:single musicalKey:GMajor];
		[self addSample:@"3_1_3_3" keyNumber:3 instrument:bells mode:single musicalKey:GMajor];
		[self addSample:@"3_1_3_4" keyNumber:4 instrument:bells mode:single musicalKey:GMajor];
		[self addSample:@"3_1_3_5" keyNumber:5 instrument:bells mode:single musicalKey:GMajor];
		[self addSample:@"3_1_3_6" keyNumber:6 instrument:bells mode:single musicalKey:GMajor];
		[self addSample:@"3_1_3_7" keyNumber:7 instrument:bells mode:single musicalKey:GMajor];
		[self addSample:@"3_1_3_8" keyNumber:8 instrument:bells mode:single musicalKey:GMajor];

		//CHORD
		[self addSample:@"3_2_1_1" keyNumber:1 instrument:bells mode:chord musicalKey:CMajor];
		[self addSample:@"3_2_1_2" keyNumber:2 instrument:bells mode:chord musicalKey:CMajor];
		[self addSample:@"3_2_1_3" keyNumber:3 instrument:bells mode:chord musicalKey:CMajor];
		[self addSample:@"3_2_1_4" keyNumber:4 instrument:bells mode:chord musicalKey:CMajor];
		[self addSample:@"3_2_1_5" keyNumber:5 instrument:bells mode:chord musicalKey:CMajor];
		[self addSample:@"3_2_1_6" keyNumber:6 instrument:bells mode:chord musicalKey:CMajor];
		[self addSample:@"3_2_1_7" keyNumber:7 instrument:bells mode:chord musicalKey:CMajor];
		[self addSample:@"3_2_1_8" keyNumber:8 instrument:bells mode:chord musicalKey:CMajor];

		[self addSample:@"3_2_2_1" keyNumber:1 instrument:bells mode:chord musicalKey:FMajor];
		[self addSample:@"3_2_2_2" keyNumber:2 instrument:bells mode:chord musicalKey:FMajor];
		[self addSample:@"3_2_2_3" keyNumber:3 instrument:bells mode:chord musicalKey:FMajor];
		[self addSample:@"3_2_2_4" keyNumber:4 instrument:bells mode:chord musicalKey:FMajor];
		[self addSample:@"3_2_2_5" keyNumber:5 instrument:bells mode:chord musicalKey:FMajor];
		[self addSample:@"3_2_2_6" keyNumber:6 instrument:bells mode:chord musicalKey:FMajor];
		[self addSample:@"3_2_2_7" keyNumber:7 instrument:bells mode:chord musicalKey:FMajor];
		[self addSample:@"3_2_2_8" keyNumber:8 instrument:bells mode:chord musicalKey:FMajor];

		[self addSample:@"3_2_3_1" keyNumber:1 instrument:bells mode:chord musicalKey:GMajor];
		[self addSample:@"3_2_3_2" keyNumber:2 instrument:bells mode:chord musicalKey:GMajor];
		[self addSample:@"3_2_3_3" keyNumber:3 instrument:bells mode:chord musicalKey:GMajor];
		[self addSample:@"3_2_3_4" keyNumber:4 instrument:bells mode:chord musicalKey:GMajor];
		[self addSample:@"3_2_3_5" keyNumber:5 instrument:bells mode:chord musicalKey:GMajor];
		[self addSample:@"3_2_3_6" keyNumber:6 instrument:bells mode:chord musicalKey:GMajor];
		[self addSample:@"3_2_3_7" keyNumber:7 instrument:bells mode:chord musicalKey:GMajor];
		[self addSample:@"3_2_3_8" keyNumber:8 instrument:bells mode:chord musicalKey:GMajor];

		//ARPEGIATED
		[self addSample:@"3_3_1_1" keyNumber:1 instrument:bells mode:arpegiated musicalKey:CMajor];
		[self addSample:@"3_3_1_2" keyNumber:2 instrument:bells mode:arpegiated musicalKey:CMajor];
		[self addSample:@"3_3_1_3" keyNumber:3 instrument:bells mode:arpegiated musicalKey:CMajor];
		[self addSample:@"3_3_1_4" keyNumber:4 instrument:bells mode:arpegiated musicalKey:CMajor];
		[self addSample:@"3_3_1_5" keyNumber:5 instrument:bells mode:arpegiated musicalKey:CMajor];
		[self addSample:@"3_3_1_6" keyNumber:6 instrument:bells mode:arpegiated musicalKey:CMajor];
		[self addSample:@"3_3_1_7" keyNumber:7 instrument:bells mode:arpegiated musicalKey:CMajor];
		[self addSample:@"3_3_1_8" keyNumber:8 instrument:bells mode:arpegiated musicalKey:CMajor];

		[self addSample:@"3_3_2_1" keyNumber:1 instrument:bells mode:arpegiated musicalKey:FMajor];
		[self addSample:@"3_3_2_2" keyNumber:2 instrument:bells mode:arpegiated musicalKey:FMajor];
		[self addSample:@"3_3_2_3" keyNumber:3 instrument:bells mode:arpegiated musicalKey:FMajor];
		[self addSample:@"3_3_2_4" keyNumber:4 instrument:bells mode:arpegiated musicalKey:FMajor];
		[self addSample:@"3_3_2_5" keyNumber:5 instrument:bells mode:arpegiated musicalKey:FMajor];
		[self addSample:@"3_3_2_6" keyNumber:6 instrument:bells mode:arpegiated musicalKey:FMajor];
		[self addSample:@"3_3_2_7" keyNumber:7 instrument:bells mode:arpegiated musicalKey:FMajor];
		[self addSample:@"3_3_2_8" keyNumber:8 instrument:bells mode:arpegiated musicalKey:FMajor];

		[self addSample:@"3_3_3_1" keyNumber:1 instrument:bells mode:arpegiated musicalKey:GMajor];
		[self addSample:@"3_3_3_2" keyNumber:2 instrument:bells mode:arpegiated musicalKey:GMajor];
		[self addSample:@"3_3_3_3" keyNumber:3 instrument:bells mode:arpegiated musicalKey:GMajor];
		[self addSample:@"3_3_3_4" keyNumber:4 instrument:bells mode:arpegiated musicalKey:GMajor];
		[self addSample:@"3_3_3_5" keyNumber:5 instrument:bells mode:arpegiated musicalKey:GMajor];
		[self addSample:@"3_3_3_6" keyNumber:6 instrument:bells mode:arpegiated musicalKey:GMajor];
		[self addSample:@"3_3_3_7" keyNumber:7 instrument:bells mode:arpegiated musicalKey:GMajor];
		[self addSample:@"3_3_3_8" keyNumber:8 instrument:bells mode:arpegiated musicalKey:GMajor];

		
		//guitar
		//SINGLE
		[self addSample:@"4_1_1_1" keyNumber:1 instrument:horn mode:single musicalKey:CMajor];
		[self addSample:@"4_1_1_2" keyNumber:2 instrument:horn mode:single musicalKey:CMajor];
		[self addSample:@"4_1_1_3" keyNumber:3 instrument:horn mode:single musicalKey:CMajor];
		[self addSample:@"4_1_1_4" keyNumber:4 instrument:horn mode:single musicalKey:CMajor];
		[self addSample:@"4_1_1_5" keyNumber:5 instrument:horn mode:single musicalKey:CMajor];
		[self addSample:@"4_1_1_6" keyNumber:6 instrument:horn mode:single musicalKey:CMajor];
		[self addSample:@"4_1_1_7" keyNumber:7 instrument:horn mode:single musicalKey:CMajor];
		[self addSample:@"4_1_1_8" keyNumber:8 instrument:horn mode:single musicalKey:CMajor];

		[self addSample:@"4_1_2_1" keyNumber:1 instrument:horn mode:single musicalKey:FMajor];
		[self addSample:@"4_1_2_2" keyNumber:2 instrument:horn mode:single musicalKey:FMajor];
		[self addSample:@"4_1_2_3" keyNumber:3 instrument:horn mode:single musicalKey:FMajor];
		[self addSample:@"4_1_2_4" keyNumber:4 instrument:horn mode:single musicalKey:FMajor];
		[self addSample:@"4_1_2_5" keyNumber:5 instrument:horn mode:single musicalKey:FMajor];
		[self addSample:@"4_1_2_6" keyNumber:6 instrument:horn mode:single musicalKey:FMajor];
		[self addSample:@"4_1_2_7" keyNumber:7 instrument:horn mode:single musicalKey:FMajor];
		[self addSample:@"4_1_2_8" keyNumber:8 instrument:horn mode:single musicalKey:FMajor];

		[self addSample:@"4_1_3_1" keyNumber:1 instrument:horn mode:single musicalKey:GMajor];
		[self addSample:@"4_1_3_2" keyNumber:2 instrument:horn mode:single musicalKey:GMajor];
		[self addSample:@"4_1_3_3" keyNumber:3 instrument:horn mode:single musicalKey:GMajor];
		[self addSample:@"4_1_3_4" keyNumber:4 instrument:horn mode:single musicalKey:GMajor];
		[self addSample:@"4_1_3_5" keyNumber:5 instrument:horn mode:single musicalKey:GMajor];
		[self addSample:@"4_1_3_6" keyNumber:6 instrument:horn mode:single musicalKey:GMajor];
		[self addSample:@"4_1_3_7" keyNumber:7 instrument:horn mode:single musicalKey:GMajor];
		[self addSample:@"4_1_3_8" keyNumber:8 instrument:horn mode:single musicalKey:GMajor];

		//CHORD
		[self addSample:@"4_2_1_1" keyNumber:1 instrument:horn mode:chord musicalKey:CMajor];
		[self addSample:@"4_2_1_2" keyNumber:2 instrument:horn mode:chord musicalKey:CMajor];
		[self addSample:@"4_2_1_3" keyNumber:3 instrument:horn mode:chord musicalKey:CMajor];
		[self addSample:@"4_2_1_4" keyNumber:4 instrument:horn mode:chord musicalKey:CMajor];
		[self addSample:@"4_2_1_5" keyNumber:5 instrument:horn mode:chord musicalKey:CMajor];
		[self addSample:@"4_2_1_6" keyNumber:6 instrument:horn mode:chord musicalKey:CMajor];
		[self addSample:@"4_2_1_7" keyNumber:7 instrument:horn mode:chord musicalKey:CMajor];
		[self addSample:@"4_2_1_8" keyNumber:8 instrument:horn mode:chord musicalKey:CMajor];

		[self addSample:@"4_2_2_1" keyNumber:1 instrument:horn mode:chord musicalKey:FMajor];
		[self addSample:@"4_2_2_2" keyNumber:2 instrument:horn mode:chord musicalKey:FMajor];
		[self addSample:@"4_2_2_3" keyNumber:3 instrument:horn mode:chord musicalKey:FMajor];
		[self addSample:@"4_2_2_4" keyNumber:4 instrument:horn mode:chord musicalKey:FMajor];
		[self addSample:@"4_2_2_5" keyNumber:5 instrument:horn mode:chord musicalKey:FMajor];
		[self addSample:@"4_2_2_6" keyNumber:6 instrument:horn mode:chord musicalKey:FMajor];
		[self addSample:@"4_2_2_7" keyNumber:7 instrument:horn mode:chord musicalKey:FMajor];
		[self addSample:@"4_2_2_8" keyNumber:8 instrument:horn mode:chord musicalKey:FMajor];

		[self addSample:@"4_2_3_1" keyNumber:1 instrument:horn mode:chord musicalKey:GMajor];
		[self addSample:@"4_2_3_2" keyNumber:2 instrument:horn mode:chord musicalKey:GMajor];
		[self addSample:@"4_2_3_3" keyNumber:3 instrument:horn mode:chord musicalKey:GMajor];
		[self addSample:@"4_2_3_4" keyNumber:4 instrument:horn mode:chord musicalKey:GMajor];
		[self addSample:@"4_2_3_5" keyNumber:5 instrument:horn mode:chord musicalKey:GMajor];
		[self addSample:@"4_2_3_6" keyNumber:6 instrument:horn mode:chord musicalKey:GMajor];
		[self addSample:@"4_2_3_7" keyNumber:7 instrument:horn mode:chord musicalKey:GMajor];
		[self addSample:@"4_2_3_8" keyNumber:8 instrument:horn mode:chord musicalKey:GMajor];

		//ARPEGIATED
		[self addSample:@"4_3_1_1" keyNumber:1 instrument:horn mode:arpegiated musicalKey:CMajor];
		[self addSample:@"4_3_1_2" keyNumber:2 instrument:horn mode:arpegiated musicalKey:CMajor];
		[self addSample:@"4_3_1_3" keyNumber:3 instrument:horn mode:arpegiated musicalKey:CMajor];
		[self addSample:@"4_3_1_4" keyNumber:4 instrument:horn mode:arpegiated musicalKey:CMajor];
		[self addSample:@"4_3_1_5" keyNumber:5 instrument:horn mode:arpegiated musicalKey:CMajor];
		[self addSample:@"4_3_1_6" keyNumber:6 instrument:horn mode:arpegiated musicalKey:CMajor];
		[self addSample:@"4_3_1_7" keyNumber:7 instrument:horn mode:arpegiated musicalKey:CMajor];
		[self addSample:@"4_3_1_8" keyNumber:8 instrument:horn mode:arpegiated musicalKey:CMajor];

		[self addSample:@"4_3_2_1" keyNumber:1 instrument:horn mode:arpegiated musicalKey:FMajor];
		[self addSample:@"4_3_2_2" keyNumber:2 instrument:horn mode:arpegiated musicalKey:FMajor];
		[self addSample:@"4_3_2_3" keyNumber:3 instrument:horn mode:arpegiated musicalKey:FMajor];
		[self addSample:@"4_3_2_4" keyNumber:4 instrument:horn mode:arpegiated musicalKey:FMajor];
		[self addSample:@"4_3_2_5" keyNumber:5 instrument:horn mode:arpegiated musicalKey:FMajor];
		[self addSample:@"4_3_2_6" keyNumber:6 instrument:horn mode:arpegiated musicalKey:FMajor];
		[self addSample:@"4_3_2_7" keyNumber:7 instrument:horn mode:arpegiated musicalKey:FMajor];
		[self addSample:@"4_3_2_8" keyNumber:8 instrument:horn mode:arpegiated musicalKey:FMajor];

		[self addSample:@"4_3_3_1" keyNumber:1 instrument:horn mode:arpegiated musicalKey:GMajor];
		[self addSample:@"4_3_3_2" keyNumber:2 instrument:horn mode:arpegiated musicalKey:GMajor];
		[self addSample:@"4_3_3_3" keyNumber:3 instrument:horn mode:arpegiated musicalKey:GMajor];
		[self addSample:@"4_3_3_4" keyNumber:4 instrument:horn mode:arpegiated musicalKey:GMajor];
		[self addSample:@"4_3_3_5" keyNumber:5 instrument:horn mode:arpegiated musicalKey:GMajor];
		[self addSample:@"4_3_3_6" keyNumber:6 instrument:horn mode:arpegiated musicalKey:GMajor];
		[self addSample:@"4_3_3_7" keyNumber:7 instrument:horn mode:arpegiated musicalKey:GMajor];
		[self addSample:@"4_3_3_8" keyNumber:8 instrument:horn mode:arpegiated musicalKey:GMajor];

		//marimba
		//SINGLE
		[self addSample:@"5_1_1_1" keyNumber:1 instrument:soft mode:single musicalKey:CMajor];
		[self addSample:@"5_1_1_2" keyNumber:2 instrument:soft mode:single musicalKey:CMajor];
		[self addSample:@"5_1_1_3" keyNumber:3 instrument:soft mode:single musicalKey:CMajor];
		[self addSample:@"5_1_1_4" keyNumber:4 instrument:soft mode:single musicalKey:CMajor];
		[self addSample:@"5_1_1_5" keyNumber:5 instrument:soft mode:single musicalKey:CMajor];
		[self addSample:@"5_1_1_6" keyNumber:6 instrument:soft mode:single musicalKey:CMajor];
		[self addSample:@"5_1_1_7" keyNumber:7 instrument:soft mode:single musicalKey:CMajor];
		[self addSample:@"5_1_1_8" keyNumber:8 instrument:soft mode:single musicalKey:CMajor];

		[self addSample:@"5_1_2_1" keyNumber:1 instrument:soft mode:single musicalKey:FMajor];
		[self addSample:@"5_1_2_2" keyNumber:2 instrument:soft mode:single musicalKey:FMajor];
		[self addSample:@"5_1_2_3" keyNumber:3 instrument:soft mode:single musicalKey:FMajor];
		[self addSample:@"5_1_2_4" keyNumber:4 instrument:soft mode:single musicalKey:FMajor];
		[self addSample:@"5_1_2_5" keyNumber:5 instrument:soft mode:single musicalKey:FMajor];
		[self addSample:@"5_1_2_6" keyNumber:6 instrument:soft mode:single musicalKey:FMajor];
		[self addSample:@"5_1_2_7" keyNumber:7 instrument:soft mode:single musicalKey:FMajor];
		[self addSample:@"5_1_2_8" keyNumber:8 instrument:soft mode:single musicalKey:FMajor];

		[self addSample:@"5_1_3_1" keyNumber:1 instrument:soft mode:single musicalKey:GMajor];
		[self addSample:@"5_1_3_2" keyNumber:2 instrument:soft mode:single musicalKey:GMajor];
		[self addSample:@"5_1_3_3" keyNumber:3 instrument:soft mode:single musicalKey:GMajor];
		[self addSample:@"5_1_3_4" keyNumber:4 instrument:soft mode:single musicalKey:GMajor];
		[self addSample:@"5_1_3_5" keyNumber:5 instrument:soft mode:single musicalKey:GMajor];
		[self addSample:@"5_1_3_6" keyNumber:6 instrument:soft mode:single musicalKey:GMajor];
		[self addSample:@"5_1_3_7" keyNumber:7 instrument:soft mode:single musicalKey:GMajor];
		[self addSample:@"5_1_3_8" keyNumber:8 instrument:soft mode:single musicalKey:GMajor];

		//CHORD
		[self addSample:@"5_2_1_1" keyNumber:1 instrument:soft mode:chord musicalKey:CMajor];
		[self addSample:@"5_2_1_2" keyNumber:2 instrument:soft mode:chord musicalKey:CMajor];
		[self addSample:@"5_2_1_3" keyNumber:3 instrument:soft mode:chord musicalKey:CMajor];
		[self addSample:@"5_2_1_4" keyNumber:4 instrument:soft mode:chord musicalKey:CMajor];
		[self addSample:@"5_2_1_5" keyNumber:5 instrument:soft mode:chord musicalKey:CMajor];
		[self addSample:@"5_2_1_6" keyNumber:6 instrument:soft mode:chord musicalKey:CMajor];
		[self addSample:@"5_2_1_7" keyNumber:7 instrument:soft mode:chord musicalKey:CMajor];
		[self addSample:@"5_2_1_8" keyNumber:8 instrument:soft mode:chord musicalKey:CMajor];

		[self addSample:@"5_2_2_1" keyNumber:1 instrument:soft mode:chord musicalKey:FMajor];
		[self addSample:@"5_2_2_2" keyNumber:2 instrument:soft mode:chord musicalKey:FMajor];
		[self addSample:@"5_2_2_3" keyNumber:3 instrument:soft mode:chord musicalKey:FMajor];
		[self addSample:@"5_2_2_4" keyNumber:4 instrument:soft mode:chord musicalKey:FMajor];
		[self addSample:@"5_2_2_5" keyNumber:5 instrument:soft mode:chord musicalKey:FMajor];
		[self addSample:@"5_2_2_6" keyNumber:6 instrument:soft mode:chord musicalKey:FMajor];
		[self addSample:@"5_2_2_7" keyNumber:7 instrument:soft mode:chord musicalKey:FMajor];
		[self addSample:@"5_2_2_8" keyNumber:8 instrument:soft mode:chord musicalKey:FMajor];

		[self addSample:@"5_2_3_1" keyNumber:1 instrument:soft mode:chord musicalKey:GMajor];
		[self addSample:@"5_2_3_2" keyNumber:2 instrument:soft mode:chord musicalKey:GMajor];
		[self addSample:@"5_2_3_3" keyNumber:3 instrument:soft mode:chord musicalKey:GMajor];
		[self addSample:@"5_2_3_4" keyNumber:4 instrument:soft mode:chord musicalKey:GMajor];
		[self addSample:@"5_2_3_5" keyNumber:5 instrument:soft mode:chord musicalKey:GMajor];
		[self addSample:@"5_2_3_6" keyNumber:6 instrument:soft mode:chord musicalKey:GMajor];
		[self addSample:@"5_2_3_7" keyNumber:7 instrument:soft mode:chord musicalKey:GMajor];
		[self addSample:@"5_2_3_8" keyNumber:8 instrument:soft mode:chord musicalKey:GMajor];

		//ARPEGIATED
		[self addSample:@"5_3_1_1" keyNumber:1 instrument:soft mode:arpegiated musicalKey:CMajor];
		[self addSample:@"5_3_1_2" keyNumber:2 instrument:soft mode:arpegiated musicalKey:CMajor];
		[self addSample:@"5_3_1_3" keyNumber:3 instrument:soft mode:arpegiated musicalKey:CMajor];
		[self addSample:@"5_3_1_4" keyNumber:4 instrument:soft mode:arpegiated musicalKey:CMajor];
		[self addSample:@"5_3_1_5" keyNumber:5 instrument:soft mode:arpegiated musicalKey:CMajor];
		[self addSample:@"5_3_1_6" keyNumber:6 instrument:soft mode:arpegiated musicalKey:CMajor];
		[self addSample:@"5_3_1_7" keyNumber:7 instrument:soft mode:arpegiated musicalKey:CMajor];
		[self addSample:@"5_3_1_8" keyNumber:8 instrument:soft mode:arpegiated musicalKey:CMajor];

		[self addSample:@"5_3_2_1" keyNumber:1 instrument:soft mode:arpegiated musicalKey:FMajor];
		[self addSample:@"5_3_2_2" keyNumber:2 instrument:soft mode:arpegiated musicalKey:FMajor];
		[self addSample:@"5_3_2_3" keyNumber:3 instrument:soft mode:arpegiated musicalKey:FMajor];
		[self addSample:@"5_3_2_4" keyNumber:4 instrument:soft mode:arpegiated musicalKey:FMajor];
		[self addSample:@"5_3_2_5" keyNumber:5 instrument:soft mode:arpegiated musicalKey:FMajor];
		[self addSample:@"5_3_2_6" keyNumber:6 instrument:soft mode:arpegiated musicalKey:FMajor];
		[self addSample:@"5_3_2_7" keyNumber:7 instrument:soft mode:arpegiated musicalKey:FMajor];
		[self addSample:@"5_3_2_8" keyNumber:8 instrument:soft mode:arpegiated musicalKey:FMajor];

		[self addSample:@"5_3_3_1" keyNumber:1 instrument:soft mode:arpegiated musicalKey:GMajor];
		[self addSample:@"5_3_3_2" keyNumber:2 instrument:soft mode:arpegiated musicalKey:GMajor];
		[self addSample:@"5_3_3_3" keyNumber:3 instrument:soft mode:arpegiated musicalKey:GMajor];
		[self addSample:@"5_3_3_4" keyNumber:4 instrument:soft mode:arpegiated musicalKey:GMajor];
		[self addSample:@"5_3_3_5" keyNumber:5 instrument:soft mode:arpegiated musicalKey:GMajor];
		[self addSample:@"5_3_3_6" keyNumber:6 instrument:soft mode:arpegiated musicalKey:GMajor];
		[self addSample:@"5_3_3_7" keyNumber:7 instrument:soft mode:arpegiated musicalKey:GMajor];
		[self addSample:@"5_3_3_8" keyNumber:8 instrument:soft mode:arpegiated musicalKey:GMajor];

		//HORN
		//SINGLE
		[self addSample:@"6_1_1_1" keyNumber:1 instrument:marimba mode:single musicalKey:CMajor];
		[self addSample:@"6_1_1_2" keyNumber:2 instrument:marimba mode:single musicalKey:CMajor];
		[self addSample:@"6_1_1_3" keyNumber:3 instrument:marimba mode:single musicalKey:CMajor];
		[self addSample:@"6_1_1_4" keyNumber:4 instrument:marimba mode:single musicalKey:CMajor];
		[self addSample:@"6_1_1_5" keyNumber:5 instrument:marimba mode:single musicalKey:CMajor];
		[self addSample:@"6_1_1_6" keyNumber:6 instrument:marimba mode:single musicalKey:CMajor];
		[self addSample:@"6_1_1_7" keyNumber:7 instrument:marimba mode:single musicalKey:CMajor];
		[self addSample:@"6_1_1_8" keyNumber:8 instrument:marimba mode:single musicalKey:CMajor];

		[self addSample:@"6_1_2_1" keyNumber:1 instrument:marimba mode:single musicalKey:FMajor];
		[self addSample:@"6_1_2_2" keyNumber:2 instrument:marimba mode:single musicalKey:FMajor];
		[self addSample:@"6_1_2_3" keyNumber:3 instrument:marimba mode:single musicalKey:FMajor];
		[self addSample:@"6_1_2_4" keyNumber:4 instrument:marimba mode:single musicalKey:FMajor];
		[self addSample:@"6_1_2_5" keyNumber:5 instrument:marimba mode:single musicalKey:FMajor];
		[self addSample:@"6_1_2_6" keyNumber:6 instrument:marimba mode:single musicalKey:FMajor];
		[self addSample:@"6_1_2_7" keyNumber:7 instrument:marimba mode:single musicalKey:FMajor];
		[self addSample:@"6_1_2_8" keyNumber:8 instrument:marimba mode:single musicalKey:FMajor];

		[self addSample:@"6_1_3_1" keyNumber:1 instrument:marimba mode:single musicalKey:GMajor];
		[self addSample:@"6_1_3_2" keyNumber:2 instrument:marimba mode:single musicalKey:GMajor];
		[self addSample:@"6_1_3_3" keyNumber:3 instrument:marimba mode:single musicalKey:GMajor];
		[self addSample:@"6_1_3_4" keyNumber:4 instrument:marimba mode:single musicalKey:GMajor];
		[self addSample:@"6_1_3_5" keyNumber:5 instrument:marimba mode:single musicalKey:GMajor];
		[self addSample:@"6_1_3_6" keyNumber:6 instrument:marimba mode:single musicalKey:GMajor];
		[self addSample:@"6_1_3_7" keyNumber:7 instrument:marimba mode:single musicalKey:GMajor];
		[self addSample:@"6_1_3_8" keyNumber:8 instrument:marimba mode:single musicalKey:GMajor];

		//CHORD
		[self addSample:@"6_2_1_1" keyNumber:1 instrument:marimba mode:chord musicalKey:CMajor];
		[self addSample:@"6_2_1_2" keyNumber:2 instrument:marimba mode:chord musicalKey:CMajor];
		[self addSample:@"6_2_1_3" keyNumber:3 instrument:marimba mode:chord musicalKey:CMajor];
		[self addSample:@"6_2_1_4" keyNumber:4 instrument:marimba mode:chord musicalKey:CMajor];
		[self addSample:@"6_2_1_5" keyNumber:5 instrument:marimba mode:chord musicalKey:CMajor];
		[self addSample:@"6_2_1_6" keyNumber:6 instrument:marimba mode:chord musicalKey:CMajor];
		[self addSample:@"6_2_1_7" keyNumber:7 instrument:marimba mode:chord musicalKey:CMajor];
		[self addSample:@"6_2_1_8" keyNumber:8 instrument:marimba mode:chord musicalKey:CMajor];

		[self addSample:@"6_2_2_1" keyNumber:1 instrument:marimba mode:chord musicalKey:FMajor];
		[self addSample:@"6_2_2_2" keyNumber:2 instrument:marimba mode:chord musicalKey:FMajor];
		[self addSample:@"6_2_2_3" keyNumber:3 instrument:marimba mode:chord musicalKey:FMajor];
		[self addSample:@"6_2_2_4" keyNumber:4 instrument:marimba mode:chord musicalKey:FMajor];
		[self addSample:@"6_2_2_5" keyNumber:5 instrument:marimba mode:chord musicalKey:FMajor];
		[self addSample:@"6_2_2_6" keyNumber:6 instrument:marimba mode:chord musicalKey:FMajor];
		[self addSample:@"6_2_2_7" keyNumber:7 instrument:marimba mode:chord musicalKey:FMajor];
		[self addSample:@"6_2_2_8" keyNumber:8 instrument:marimba mode:chord musicalKey:FMajor];

		[self addSample:@"6_2_3_1" keyNumber:1 instrument:marimba mode:chord musicalKey:GMajor];
		[self addSample:@"6_2_3_2" keyNumber:2 instrument:marimba mode:chord musicalKey:GMajor];
		[self addSample:@"6_2_3_3" keyNumber:3 instrument:marimba mode:chord musicalKey:GMajor];
		[self addSample:@"6_2_3_4" keyNumber:4 instrument:marimba mode:chord musicalKey:GMajor];
		[self addSample:@"6_2_3_5" keyNumber:5 instrument:marimba mode:chord musicalKey:GMajor];
		[self addSample:@"6_2_3_6" keyNumber:6 instrument:marimba mode:chord musicalKey:GMajor];
		[self addSample:@"6_2_3_7" keyNumber:7 instrument:marimba mode:chord musicalKey:GMajor];
		[self addSample:@"6_2_3_8" keyNumber:8 instrument:marimba mode:chord musicalKey:GMajor];

		//ARPEGIATED
		[self addSample:@"6_3_1_1" keyNumber:1 instrument:marimba mode:arpegiated musicalKey:CMajor];
		[self addSample:@"6_3_1_2" keyNumber:2 instrument:marimba mode:arpegiated musicalKey:CMajor];
		[self addSample:@"6_3_1_3" keyNumber:3 instrument:marimba mode:arpegiated musicalKey:CMajor];
		[self addSample:@"6_3_1_4" keyNumber:4 instrument:marimba mode:arpegiated musicalKey:CMajor];
		[self addSample:@"6_3_1_5" keyNumber:5 instrument:marimba mode:arpegiated musicalKey:CMajor];
		[self addSample:@"6_3_1_6" keyNumber:6 instrument:marimba mode:arpegiated musicalKey:CMajor];
		[self addSample:@"6_3_1_7" keyNumber:7 instrument:marimba mode:arpegiated musicalKey:CMajor];
		[self addSample:@"6_3_1_8" keyNumber:8 instrument:marimba mode:arpegiated musicalKey:CMajor];

		[self addSample:@"6_3_2_1" keyNumber:1 instrument:marimba mode:arpegiated musicalKey:FMajor];
		[self addSample:@"6_3_2_2" keyNumber:2 instrument:marimba mode:arpegiated musicalKey:FMajor];
		[self addSample:@"6_3_2_3" keyNumber:3 instrument:marimba mode:arpegiated musicalKey:FMajor];
		[self addSample:@"6_3_2_4" keyNumber:4 instrument:marimba mode:arpegiated musicalKey:FMajor];
		[self addSample:@"6_3_2_5" keyNumber:5 instrument:marimba mode:arpegiated musicalKey:FMajor];
		[self addSample:@"6_3_2_6" keyNumber:6 instrument:marimba mode:arpegiated musicalKey:FMajor];
		[self addSample:@"6_3_2_7" keyNumber:7 instrument:marimba mode:arpegiated musicalKey:FMajor];
		[self addSample:@"6_3_2_8" keyNumber:8 instrument:marimba mode:arpegiated musicalKey:FMajor];

		[self addSample:@"6_3_3_1" keyNumber:1 instrument:marimba mode:arpegiated musicalKey:GMajor];
		[self addSample:@"6_3_3_2" keyNumber:2 instrument:marimba mode:arpegiated musicalKey:GMajor];
		[self addSample:@"6_3_3_3" keyNumber:3 instrument:marimba mode:arpegiated musicalKey:GMajor];
		[self addSample:@"6_3_3_4" keyNumber:4 instrument:marimba mode:arpegiated musicalKey:GMajor];
		[self addSample:@"6_3_3_5" keyNumber:5 instrument:marimba mode:arpegiated musicalKey:GMajor];
		[self addSample:@"6_3_3_6" keyNumber:6 instrument:marimba mode:arpegiated musicalKey:GMajor];
		[self addSample:@"6_3_3_7" keyNumber:7 instrument:marimba mode:arpegiated musicalKey:GMajor];
		[self addSample:@"6_3_3_8" keyNumber:8 instrument:marimba mode:arpegiated musicalKey:GMajor];

		
		NSLog(@"ALL SAMPLES LOADED!");
	}

	- (void) configureRecording {

		NSLog(@"AUDIO: Initializing Recording...");
		NSArray * dirPaths;
		NSString * docsDir;

		dirPaths = NSSearchPathForDirectoriesInDomains(
													   NSDocumentDirectory, NSUserDomainMask, YES);
		docsDir = [dirPaths objectAtIndex:0];
		NSString *soundFilePath = [docsDir
								   stringByAppendingPathComponent:@"sound.caf"];

		NSURL *soundFileURL = [NSURL fileURLWithPath:soundFilePath];

		NSDictionary *recordSettings = [NSDictionary
										dictionaryWithObjectsAndKeys:
										[NSNumber numberWithInt:AVAudioQualityMin],
										AVEncoderAudioQualityKey,
										[NSNumber numberWithInt:16],
										AVEncoderBitRateKey,
										[NSNumber numberWithInt: 2],
										AVNumberOfChannelsKey,
										[NSNumber numberWithFloat:44100.0],
										AVSampleRateKey,
										nil];

		NSError *error = nil;

		audioRecorder = [[AVAudioRecorder alloc]
						 initWithURL:soundFileURL
						 settings:recordSettings
						 error:&error];

		if (error)
		{
			NSLog(@"error: %@", [error localizedDescription]);

		} else {
			[audioRecorder prepareToRecord];
		}
		NSLog(@"Record ready...");
		
	}

	//Voice Recording
	- (void)startRecording {
		NSLog(@"AUDIO: Start Recording...");
		[audioRecorder recordForDuration:30.00];
		[NSTimer scheduledTimerWithTimeInterval:30.00 target:self selector:@selector(forceStopRecord) userInfo:nil repeats:NO];
	}
	- (void)stopRecording {
		[audioRecorder stop];
	}
	- (void)startPlayback {
		NSLog(@"AUDIO: Start Playback...");
		if (audioPlayer)
			[audioPlayer release];
        NSError *error;

        audioPlayer = [[AVAudioPlayer alloc]
					   initWithContentsOfURL:audioRecorder.url
					   error:&error];
		
		audioPlayer.delegate = self;

        if (error)
			NSLog(@"Error: %@",
				  [error localizedDescription]);
        else
			[audioPlayer play];
	}
	- (void)stopPlayback {
		[audioPlayer stop];
	}
	- (void)forceStopRecord {
		[audioRecorder stop];
		[parentViewController clearRecordingState];
	}

	-(void)audioPlayerDidFinishPlaying:
	(AVAudioPlayer *)player successfully:(BOOL)flag
	{
		[parentViewController clearRecordingState];
	}
	-(void)audioPlayerDecodeErrorDidOccur:(AVAudioPlayer *)player error:(NSError *)error
	{
		NSLog(@"Decode Error occurred");
	}
	-(void)audioRecorderDidFinishRecording:(AVAudioRecorder *)recorder successfully:(BOOL)flag
	{
		[parentViewController clearRecordingState];
	}
	-(void)audioRecorderEncodeErrorDidOccur:(AVAudioRecorder *)recorder error:(NSError *)error
	{
		NSLog(@"Encode Error occurred");
	}
@end
