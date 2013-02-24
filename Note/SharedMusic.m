//
//  SharedMusic.m
//  Note
//
//  Created by Rayce Stipanovich on 2/19/13.
//  Copyright (c) 2013 WPI. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SharedMusic.h"
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

@implementation SharedMusic

	- (void)NoteOn:(NSInteger)key_number {
		NSLog(@"AUDIO: NOTE ON %i", key_number);
		if (key_number<4)
			AudioServicesPlaySystemSound(globalSounds[0][0][0][0]);
		else
			AudioServicesPlaySystemSound(globalSounds[0][0][0][1]);
	}


	- (void)NoteOff:(NSInteger)key_number {
		
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
		
		NSString *pewPewPath = [[NSBundle mainBundle] pathForResource:@"test" ofType:@"wav"];
		NSURL *pewPewURL = [NSURL fileURLWithPath:pewPewPath];
		AudioServicesCreateSystemSoundID((CFURLRef)pewPewURL, &globalSounds[0][0][0][0]);

		pewPewPath = [[NSBundle mainBundle] pathForResource:@"test2" ofType:@"wav"];
		pewPewURL = [NSURL fileURLWithPath:pewPewPath];
		AudioServicesCreateSystemSoundID((CFURLRef)pewPewURL, &globalSounds[0][0][0][1]);
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
		[ViewController clearRecordingState];
	}

	-(void)audioPlayerDidFinishPlaying:
	(AVAudioPlayer *)player successfully:(BOOL)flag
	{
		[ViewController clearRecordingState];
	}
	-(void)audioPlayerDecodeErrorDidOccur:(AVAudioPlayer *)player error:(NSError *)error
	{
		NSLog(@"Decode Error occurred");
	}
	-(void)audioRecorderDidFinishRecording:(AVAudioRecorder *)recorder successfully:(BOOL)flag
	{
		[ViewController clearRecordingState];
	}
	-(void)audioRecorderEncodeErrorDidOccur:(AVAudioRecorder *)recorder error:(NSError *)error
	{
		NSLog(@"Encode Error occurred");
	}
@end
