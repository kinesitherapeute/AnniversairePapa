//
//  papaSecondViewController.m
//  AnniversairePapa
//
//  Created by Pierre Besson on 01/10/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "homeViewController.h"

@implementation homeViewController
@synthesize webview;
//@synthesize audioPlayer;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    //How Load a webview 
    [webview loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"index" ofType:@"html"]isDirectory:NO]]];
 //   [self loadAudio];
   // Do any additional setup after loading the view, typically from a nib.
}

/*-(void) loadAudio{
    NSURL *url = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/275382_eye_of_the_tiger_8bit.mp3", [[NSBundle mainBundle] resourcePath]]];
    
	NSError *error;
	audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
	audioPlayer.numberOfLoops = -1;
    
	if (audioPlayer == nil){
		NSLog([error description]);
    }
	else{
		[audioPlayer play];
    }
}
*/
- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return YES;
}

@end
