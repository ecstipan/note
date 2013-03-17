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

SystemSoundID globalSounds[4][3][3][8]; //[instrument][mode][key][note]

ViewController * parentViewController;
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

		/*
		//ARPEGIATED
		[self addSample:@"1" keyNumber:1 instrument:piano mode:arpegiated musicalKey:CMajor];
		[self addSample:@"2" keyNumber:2 instrument:piano mode:arpegiated musicalKey:CMajor];
		[self addSample:@"3" keyNumber:3 instrument:piano mode:arpegiated musicalKey:CMajor];
		[self addSample:@"4" keyNumber:4 instrument:piano mode:arpegiated musicalKey:CMajor];
		[self addSample:@"5" keyNumber:5 instrument:piano mode:arpegiated musicalKey:CMajor];
		[self addSample:@"6" keyNumber:6 instrument:piano mode:arpegiated musicalKey:CMajor];
		[self addSample:@"7" keyNumber:7 instrument:piano mode:arpegiated musicalKey:CMajor];
		[self addSample:@"2" keyNumber:8 instrument:piano mode:arpegiated musicalKey:CMajor];

		[self addSample:@"1" keyNumber:1 instrument:piano mode:arpegiated musicalKey:FMajor];
		[self addSample:@"2" keyNumber:2 instrument:piano mode:arpegiated musicalKey:FMajor];
		[self addSample:@"3" keyNumber:3 instrument:piano mode:arpegiated musicalKey:FMajor];
		[self addSample:@"4" keyNumber:4 instrument:piano mode:arpegiated musicalKey:FMajor];
		[self addSample:@"5" keyNumber:5 instrument:piano mode:arpegiated musicalKey:FMajor];
		[self addSample:@"6" keyNumber:6 instrument:piano mode:arpegiated musicalKey:FMajor];
		[self addSample:@"7" keyNumber:7 instrument:piano mode:arpegiated musicalKey:FMajor];
		[self addSample:@"2" keyNumber:8 instrument:piano mode:arpegiated musicalKey:FMajor];

		[self addSample:@"1" keyNumber:1 instrument:piano mode:arpegiated musicalKey:GMajor];
		[self addSample:@"2" keyNumber:2 instrument:piano mode:arpegiated musicalKey:GMajor];
		[self addSample:@"3" keyNumber:3 instrument:piano mode:arpegiated musicalKey:GMajor];
		[self addSample:@"4" keyNumber:4 instrument:piano mode:arpegiated musicalKey:GMajor];
		[self addSample:@"5" keyNumber:5 instrument:piano mode:arpegiated musicalKey:GMajor];
		[self addSample:@"6" keyNumber:6 instrument:piano mode:arpegiated musicalKey:GMajor];
		[self addSample:@"7" keyNumber:7 instrument:piano mode:arpegiated musicalKey:GMajor];
		[self addSample:@"2" keyNumber:8 instrument:piano mode:arpegiated musicalKey:GMajor];
		
		//STRINGS
		//SINGLE
		[self addSample:@"1" keyNumber:1 instrument:strings mode:single musicalKey:CMajor];
		[self addSample:@"2" keyNumber:2 instrument:strings mode:single musicalKey:CMajor];
		[self addSample:@"3" keyNumber:3 instrument:strings mode:single musicalKey:CMajor];
		[self addSample:@"4" keyNumber:4 instrument:strings mode:single musicalKey:CMajor];
		[self addSample:@"5" keyNumber:5 instrument:strings mode:single musicalKey:CMajor];
		[self addSample:@"6" keyNumber:6 instrument:strings mode:single musicalKey:CMajor];
		[self addSample:@"7" keyNumber:7 instrument:strings mode:single musicalKey:CMajor];
		[self addSample:@"2" keyNumber:8 instrument:strings mode:single musicalKey:CMajor];

		[self addSample:@"1" keyNumber:1 instrument:strings mode:single musicalKey:FMajor];
		[self addSample:@"2" keyNumber:2 instrument:strings mode:single musicalKey:FMajor];
		[self addSample:@"3" keyNumber:3 instrument:strings mode:single musicalKey:FMajor];
		[self addSample:@"4" keyNumber:4 instrument:strings mode:single musicalKey:FMajor];
		[self addSample:@"5" keyNumber:5 instrument:strings mode:single musicalKey:FMajor];
		[self addSample:@"6" keyNumber:6 instrument:strings mode:single musicalKey:FMajor];
		[self addSample:@"7" keyNumber:7 instrument:strings mode:single musicalKey:FMajor];
		[self addSample:@"2" keyNumber:8 instrument:strings mode:single musicalKey:FMajor];

		[self addSample:@"1" keyNumber:1 instrument:strings mode:single musicalKey:GMajor];
		[self addSample:@"2" keyNumber:2 instrument:strings mode:single musicalKey:GMajor];
		[self addSample:@"3" keyNumber:3 instrument:strings mode:single musicalKey:GMajor];
		[self addSample:@"4" keyNumber:4 instrument:strings mode:single musicalKey:GMajor];
		[self addSample:@"5" keyNumber:5 instrument:strings mode:single musicalKey:GMajor];
		[self addSample:@"6" keyNumber:6 instrument:strings mode:single musicalKey:GMajor];
		[self addSample:@"7" keyNumber:7 instrument:strings mode:single musicalKey:GMajor];
		[self addSample:@"2" keyNumber:8 instrument:strings mode:single musicalKey:GMajor];

		//CHORD
		[self addSample:@"1" keyNumber:1 instrument:strings mode:chord musicalKey:CMajor];
		[self addSample:@"2" keyNumber:2 instrument:strings mode:chord musicalKey:CMajor];
		[self addSample:@"3" keyNumber:3 instrument:strings mode:chord musicalKey:CMajor];
		[self addSample:@"4" keyNumber:4 instrument:strings mode:chord musicalKey:CMajor];
		[self addSample:@"5" keyNumber:5 instrument:strings mode:chord musicalKey:CMajor];
		[self addSample:@"6" keyNumber:6 instrument:strings mode:chord musicalKey:CMajor];
		[self addSample:@"7" keyNumber:7 instrument:strings mode:chord musicalKey:CMajor];
		[self addSample:@"2" keyNumber:8 instrument:strings mode:chord musicalKey:CMajor];

		[self addSample:@"1" keyNumber:1 instrument:strings mode:chord musicalKey:FMajor];
		[self addSample:@"2" keyNumber:2 instrument:strings mode:chord musicalKey:FMajor];
		[self addSample:@"3" keyNumber:3 instrument:strings mode:chord musicalKey:FMajor];
		[self addSample:@"4" keyNumber:4 instrument:strings mode:chord musicalKey:FMajor];
		[self addSample:@"5" keyNumber:5 instrument:strings mode:chord musicalKey:FMajor];
		[self addSample:@"6" keyNumber:6 instrument:strings mode:chord musicalKey:FMajor];
		[self addSample:@"7" keyNumber:7 instrument:strings mode:chord musicalKey:FMajor];
		[self addSample:@"2" keyNumber:8 instrument:strings mode:chord musicalKey:FMajor];

		[self addSample:@"1" keyNumber:1 instrument:strings mode:chord musicalKey:GMajor];
		[self addSample:@"2" keyNumber:2 instrument:strings mode:chord musicalKey:GMajor];
		[self addSample:@"3" keyNumber:3 instrument:strings mode:chord musicalKey:GMajor];
		[self addSample:@"4" keyNumber:4 instrument:strings mode:chord musicalKey:GMajor];
		[self addSample:@"5" keyNumber:5 instrument:strings mode:chord musicalKey:GMajor];
		[self addSample:@"6" keyNumber:6 instrument:strings mode:chord musicalKey:GMajor];
		[self addSample:@"7" keyNumber:7 instrument:strings mode:chord musicalKey:GMajor];
		[self addSample:@"2" keyNumber:8 instrument:strings mode:chord musicalKey:GMajor];

		//ARPEGIATED
		[self addSample:@"1" keyNumber:1 instrument:strings mode:arpegiated musicalKey:CMajor];
		[self addSample:@"2" keyNumber:2 instrument:strings mode:arpegiated musicalKey:CMajor];
		[self addSample:@"3" keyNumber:3 instrument:strings mode:arpegiated musicalKey:CMajor];
		[self addSample:@"4" keyNumber:4 instrument:strings mode:arpegiated musicalKey:CMajor];
		[self addSample:@"5" keyNumber:5 instrument:strings mode:arpegiated musicalKey:CMajor];
		[self addSample:@"6" keyNumber:6 instrument:strings mode:arpegiated musicalKey:CMajor];
		[self addSample:@"7" keyNumber:7 instrument:strings mode:arpegiated musicalKey:CMajor];
		[self addSample:@"2" keyNumber:8 instrument:strings mode:arpegiated musicalKey:CMajor];

		[self addSample:@"1" keyNumber:1 instrument:strings mode:arpegiated musicalKey:FMajor];
		[self addSample:@"2" keyNumber:2 instrument:strings mode:arpegiated musicalKey:FMajor];
		[self addSample:@"3" keyNumber:3 instrument:strings mode:arpegiated musicalKey:FMajor];
		[self addSample:@"4" keyNumber:4 instrument:strings mode:arpegiated musicalKey:FMajor];
		[self addSample:@"5" keyNumber:5 instrument:strings mode:arpegiated musicalKey:FMajor];
		[self addSample:@"6" keyNumber:6 instrument:strings mode:arpegiated musicalKey:FMajor];
		[self addSample:@"7" keyNumber:7 instrument:strings mode:arpegiated musicalKey:FMajor];
		[self addSample:@"2" keyNumber:8 instrument:strings mode:arpegiated musicalKey:FMajor];

		[self addSample:@"1" keyNumber:1 instrument:strings mode:arpegiated musicalKey:GMajor];
		[self addSample:@"2" keyNumber:2 instrument:strings mode:arpegiated musicalKey:GMajor];
		[self addSample:@"3" keyNumber:3 instrument:strings mode:arpegiated musicalKey:GMajor];
		[self addSample:@"4" keyNumber:4 instrument:strings mode:arpegiated musicalKey:GMajor];
		[self addSample:@"5" keyNumber:5 instrument:strings mode:arpegiated musicalKey:GMajor];
		[self addSample:@"6" keyNumber:6 instrument:strings mode:arpegiated musicalKey:GMajor];
		[self addSample:@"7" keyNumber:7 instrument:strings mode:arpegiated musicalKey:GMajor];
		[self addSample:@"2" keyNumber:8 instrument:strings mode:arpegiated musicalKey:GMajor];

		//BELLS
		//SINGLE
		[self addSample:@"1" keyNumber:1 instrument:bells mode:single musicalKey:CMajor];
		[self addSample:@"2" keyNumber:2 instrument:bells mode:single musicalKey:CMajor];
		[self addSample:@"3" keyNumber:3 instrument:bells mode:single musicalKey:CMajor];
		[self addSample:@"4" keyNumber:4 instrument:bells mode:single musicalKey:CMajor];
		[self addSample:@"5" keyNumber:5 instrument:bells mode:single musicalKey:CMajor];
		[self addSample:@"6" keyNumber:6 instrument:bells mode:single musicalKey:CMajor];
		[self addSample:@"7" keyNumber:7 instrument:bells mode:single musicalKey:CMajor];
		[self addSample:@"2" keyNumber:8 instrument:bells mode:single musicalKey:CMajor];

		[self addSample:@"1" keyNumber:1 instrument:bells mode:single musicalKey:FMajor];
		[self addSample:@"2" keyNumber:2 instrument:bells mode:single musicalKey:FMajor];
		[self addSample:@"3" keyNumber:3 instrument:bells mode:single musicalKey:FMajor];
		[self addSample:@"4" keyNumber:4 instrument:bells mode:single musicalKey:FMajor];
		[self addSample:@"5" keyNumber:5 instrument:bells mode:single musicalKey:FMajor];
		[self addSample:@"6" keyNumber:6 instrument:bells mode:single musicalKey:FMajor];
		[self addSample:@"7" keyNumber:7 instrument:bells mode:single musicalKey:FMajor];
		[self addSample:@"2" keyNumber:8 instrument:bells mode:single musicalKey:FMajor];

		[self addSample:@"1" keyNumber:1 instrument:bells mode:single musicalKey:GMajor];
		[self addSample:@"2" keyNumber:2 instrument:bells mode:single musicalKey:GMajor];
		[self addSample:@"3" keyNumber:3 instrument:bells mode:single musicalKey:GMajor];
		[self addSample:@"4" keyNumber:4 instrument:bells mode:single musicalKey:GMajor];
		[self addSample:@"5" keyNumber:5 instrument:bells mode:single musicalKey:GMajor];
		[self addSample:@"6" keyNumber:6 instrument:bells mode:single musicalKey:GMajor];
		[self addSample:@"7" keyNumber:7 instrument:bells mode:single musicalKey:GMajor];
		[self addSample:@"2" keyNumber:8 instrument:bells mode:single musicalKey:GMajor];

		//CHORD
		[self addSample:@"1" keyNumber:1 instrument:bells mode:chord musicalKey:CMajor];
		[self addSample:@"2" keyNumber:2 instrument:bells mode:chord musicalKey:CMajor];
		[self addSample:@"3" keyNumber:3 instrument:bells mode:chord musicalKey:CMajor];
		[self addSample:@"4" keyNumber:4 instrument:bells mode:chord musicalKey:CMajor];
		[self addSample:@"5" keyNumber:5 instrument:bells mode:chord musicalKey:CMajor];
		[self addSample:@"6" keyNumber:6 instrument:bells mode:chord musicalKey:CMajor];
		[self addSample:@"7" keyNumber:7 instrument:bells mode:chord musicalKey:CMajor];
		[self addSample:@"2" keyNumber:8 instrument:bells mode:chord musicalKey:CMajor];

		[self addSample:@"1" keyNumber:1 instrument:bells mode:chord musicalKey:FMajor];
		[self addSample:@"2" keyNumber:2 instrument:bells mode:chord musicalKey:FMajor];
		[self addSample:@"3" keyNumber:3 instrument:bells mode:chord musicalKey:FMajor];
		[self addSample:@"4" keyNumber:4 instrument:bells mode:chord musicalKey:FMajor];
		[self addSample:@"5" keyNumber:5 instrument:bells mode:chord musicalKey:FMajor];
		[self addSample:@"6" keyNumber:6 instrument:bells mode:chord musicalKey:FMajor];
		[self addSample:@"7" keyNumber:7 instrument:bells mode:chord musicalKey:FMajor];
		[self addSample:@"2" keyNumber:8 instrument:bells mode:chord musicalKey:FMajor];

		[self addSample:@"1" keyNumber:1 instrument:bells mode:chord musicalKey:GMajor];
		[self addSample:@"2" keyNumber:2 instrument:bells mode:chord musicalKey:GMajor];
		[self addSample:@"3" keyNumber:3 instrument:bells mode:chord musicalKey:GMajor];
		[self addSample:@"4" keyNumber:4 instrument:bells mode:chord musicalKey:GMajor];
		[self addSample:@"5" keyNumber:5 instrument:bells mode:chord musicalKey:GMajor];
		[self addSample:@"6" keyNumber:6 instrument:bells mode:chord musicalKey:GMajor];
		[self addSample:@"7" keyNumber:7 instrument:bells mode:chord musicalKey:GMajor];
		[self addSample:@"2" keyNumber:8 instrument:bells mode:chord musicalKey:GMajor];

		//ARPEGIATED
		[self addSample:@"1" keyNumber:1 instrument:bells mode:arpegiated musicalKey:CMajor];
		[self addSample:@"2" keyNumber:2 instrument:bells mode:arpegiated musicalKey:CMajor];
		[self addSample:@"3" keyNumber:3 instrument:bells mode:arpegiated musicalKey:CMajor];
		[self addSample:@"4" keyNumber:4 instrument:bells mode:arpegiated musicalKey:CMajor];
		[self addSample:@"5" keyNumber:5 instrument:bells mode:arpegiated musicalKey:CMajor];
		[self addSample:@"6" keyNumber:6 instrument:bells mode:arpegiated musicalKey:CMajor];
		[self addSample:@"7" keyNumber:7 instrument:bells mode:arpegiated musicalKey:CMajor];
		[self addSample:@"2" keyNumber:8 instrument:bells mode:arpegiated musicalKey:CMajor];

		[self addSample:@"1" keyNumber:1 instrument:bells mode:arpegiated musicalKey:FMajor];
		[self addSample:@"2" keyNumber:2 instrument:bells mode:arpegiated musicalKey:FMajor];
		[self addSample:@"3" keyNumber:3 instrument:bells mode:arpegiated musicalKey:FMajor];
		[self addSample:@"4" keyNumber:4 instrument:bells mode:arpegiated musicalKey:FMajor];
		[self addSample:@"5" keyNumber:5 instrument:bells mode:arpegiated musicalKey:FMajor];
		[self addSample:@"6" keyNumber:6 instrument:bells mode:arpegiated musicalKey:FMajor];
		[self addSample:@"7" keyNumber:7 instrument:bells mode:arpegiated musicalKey:FMajor];
		[self addSample:@"2" keyNumber:8 instrument:bells mode:arpegiated musicalKey:FMajor];

		[self addSample:@"1" keyNumber:1 instrument:bells mode:arpegiated musicalKey:GMajor];
		[self addSample:@"2" keyNumber:2 instrument:bells mode:arpegiated musicalKey:GMajor];
		[self addSample:@"3" keyNumber:3 instrument:bells mode:arpegiated musicalKey:GMajor];
		[self addSample:@"4" keyNumber:4 instrument:bells mode:arpegiated musicalKey:GMajor];
		[self addSample:@"5" keyNumber:5 instrument:bells mode:arpegiated musicalKey:GMajor];
		[self addSample:@"6" keyNumber:6 instrument:bells mode:arpegiated musicalKey:GMajor];
		[self addSample:@"7" keyNumber:7 instrument:bells mode:arpegiated musicalKey:GMajor];
		[self addSample:@"2" keyNumber:8 instrument:bells mode:arpegiated musicalKey:GMajor];


		//HORN
		//SINGLE
		[self addSample:@"1" keyNumber:1 instrument:horn mode:single musicalKey:CMajor];
		[self addSample:@"2" keyNumber:2 instrument:horn mode:single musicalKey:CMajor];
		[self addSample:@"3" keyNumber:3 instrument:horn mode:single musicalKey:CMajor];
		[self addSample:@"4" keyNumber:4 instrument:horn mode:single musicalKey:CMajor];
		[self addSample:@"5" keyNumber:5 instrument:horn mode:single musicalKey:CMajor];
		[self addSample:@"6" keyNumber:6 instrument:horn mode:single musicalKey:CMajor];
		[self addSample:@"7" keyNumber:7 instrument:horn mode:single musicalKey:CMajor];
		[self addSample:@"2" keyNumber:8 instrument:horn mode:single musicalKey:CMajor];

		[self addSample:@"1" keyNumber:1 instrument:horn mode:single musicalKey:FMajor];
		[self addSample:@"2" keyNumber:2 instrument:horn mode:single musicalKey:FMajor];
		[self addSample:@"3" keyNumber:3 instrument:horn mode:single musicalKey:FMajor];
		[self addSample:@"4" keyNumber:4 instrument:horn mode:single musicalKey:FMajor];
		[self addSample:@"5" keyNumber:5 instrument:horn mode:single musicalKey:FMajor];
		[self addSample:@"6" keyNumber:6 instrument:horn mode:single musicalKey:FMajor];
		[self addSample:@"7" keyNumber:7 instrument:horn mode:single musicalKey:FMajor];
		[self addSample:@"2" keyNumber:8 instrument:horn mode:single musicalKey:FMajor];

		[self addSample:@"1" keyNumber:1 instrument:horn mode:single musicalKey:GMajor];
		[self addSample:@"2" keyNumber:2 instrument:horn mode:single musicalKey:GMajor];
		[self addSample:@"3" keyNumber:3 instrument:horn mode:single musicalKey:GMajor];
		[self addSample:@"4" keyNumber:4 instrument:horn mode:single musicalKey:GMajor];
		[self addSample:@"5" keyNumber:5 instrument:horn mode:single musicalKey:GMajor];
		[self addSample:@"6" keyNumber:6 instrument:horn mode:single musicalKey:GMajor];
		[self addSample:@"7" keyNumber:7 instrument:horn mode:single musicalKey:GMajor];
		[self addSample:@"2" keyNumber:8 instrument:horn mode:single musicalKey:GMajor];

		//CHORD
		[self addSample:@"1" keyNumber:1 instrument:horn mode:chord musicalKey:CMajor];
		[self addSample:@"2" keyNumber:2 instrument:horn mode:chord musicalKey:CMajor];
		[self addSample:@"3" keyNumber:3 instrument:horn mode:chord musicalKey:CMajor];
		[self addSample:@"4" keyNumber:4 instrument:horn mode:chord musicalKey:CMajor];
		[self addSample:@"5" keyNumber:5 instrument:horn mode:chord musicalKey:CMajor];
		[self addSample:@"6" keyNumber:6 instrument:horn mode:chord musicalKey:CMajor];
		[self addSample:@"7" keyNumber:7 instrument:horn mode:chord musicalKey:CMajor];
		[self addSample:@"2" keyNumber:8 instrument:horn mode:chord musicalKey:CMajor];

		[self addSample:@"1" keyNumber:1 instrument:horn mode:chord musicalKey:FMajor];
		[self addSample:@"2" keyNumber:2 instrument:horn mode:chord musicalKey:FMajor];
		[self addSample:@"3" keyNumber:3 instrument:horn mode:chord musicalKey:FMajor];
		[self addSample:@"4" keyNumber:4 instrument:horn mode:chord musicalKey:FMajor];
		[self addSample:@"5" keyNumber:5 instrument:horn mode:chord musicalKey:FMajor];
		[self addSample:@"6" keyNumber:6 instrument:horn mode:chord musicalKey:FMajor];
		[self addSample:@"7" keyNumber:7 instrument:horn mode:chord musicalKey:FMajor];
		[self addSample:@"2" keyNumber:8 instrument:horn mode:chord musicalKey:FMajor];

		[self addSample:@"1" keyNumber:1 instrument:horn mode:chord musicalKey:GMajor];
		[self addSample:@"2" keyNumber:2 instrument:horn mode:chord musicalKey:GMajor];
		[self addSample:@"3" keyNumber:3 instrument:horn mode:chord musicalKey:GMajor];
		[self addSample:@"4" keyNumber:4 instrument:horn mode:chord musicalKey:GMajor];
		[self addSample:@"5" keyNumber:5 instrument:horn mode:chord musicalKey:GMajor];
		[self addSample:@"6" keyNumber:6 instrument:horn mode:chord musicalKey:GMajor];
		[self addSample:@"7" keyNumber:7 instrument:horn mode:chord musicalKey:GMajor];
		[self addSample:@"2" keyNumber:8 instrument:horn mode:chord musicalKey:GMajor];

		//ARPEGIATED
		[self addSample:@"1" keyNumber:1 instrument:horn mode:arpegiated musicalKey:CMajor];
		[self addSample:@"2" keyNumber:2 instrument:horn mode:arpegiated musicalKey:CMajor];
		[self addSample:@"3" keyNumber:3 instrument:horn mode:arpegiated musicalKey:CMajor];
		[self addSample:@"4" keyNumber:4 instrument:horn mode:arpegiated musicalKey:CMajor];
		[self addSample:@"5" keyNumber:5 instrument:horn mode:arpegiated musicalKey:CMajor];
		[self addSample:@"6" keyNumber:6 instrument:horn mode:arpegiated musicalKey:CMajor];
		[self addSample:@"7" keyNumber:7 instrument:horn mode:arpegiated musicalKey:CMajor];
		[self addSample:@"2" keyNumber:8 instrument:horn mode:arpegiated musicalKey:CMajor];

		[self addSample:@"1" keyNumber:1 instrument:horn mode:arpegiated musicalKey:FMajor];
		[self addSample:@"2" keyNumber:2 instrument:horn mode:arpegiated musicalKey:FMajor];
		[self addSample:@"3" keyNumber:3 instrument:horn mode:arpegiated musicalKey:FMajor];
		[self addSample:@"4" keyNumber:4 instrument:horn mode:arpegiated musicalKey:FMajor];
		[self addSample:@"5" keyNumber:5 instrument:horn mode:arpegiated musicalKey:FMajor];
		[self addSample:@"6" keyNumber:6 instrument:horn mode:arpegiated musicalKey:FMajor];
		[self addSample:@"7" keyNumber:7 instrument:horn mode:arpegiated musicalKey:FMajor];
		[self addSample:@"2" keyNumber:8 instrument:horn mode:arpegiated musicalKey:FMajor];

		[self addSample:@"1" keyNumber:1 instrument:horn mode:arpegiated musicalKey:GMajor];
		[self addSample:@"2" keyNumber:2 instrument:horn mode:arpegiated musicalKey:GMajor];
		[self addSample:@"3" keyNumber:3 instrument:horn mode:arpegiated musicalKey:GMajor];
		[self addSample:@"4" keyNumber:4 instrument:horn mode:arpegiated musicalKey:GMajor];
		[self addSample:@"5" keyNumber:5 instrument:horn mode:arpegiated musicalKey:GMajor];
		[self addSample:@"6" keyNumber:6 instrument:horn mode:arpegiated musicalKey:GMajor];
		[self addSample:@"7" keyNumber:7 instrument:horn mode:arpegiated musicalKey:GMajor];
		[self addSample:@"2" keyNumber:8 instrument:horn mode:arpegiated musicalKey:GMajor];

		*/
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
		[audioRecorder recordForDuration:10.00];
		[NSTimer scheduledTimerWithTimeInterval:10.00 target:self selector:@selector(forceStopRecord) userInfo:nil repeats:NO];
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
