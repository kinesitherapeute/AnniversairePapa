//
//  papaSecondViewController.h
//  AnniversairePapa
//
//  Created by Pierre Besson on 01/10/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import <AVFoundation/AVAudioPlayer.h>

@interface homeViewController : UIViewController{
    IBOutlet UIWebView *webview;
  //  AVAudioPlayer *audioPlayer;
}

@property (strong, nonatomic) IBOutlet UIWebView *webview;
//@property (strong, nonatomic) AVAudioPlayer *audioPlayer;
//-(void) loadAudio;
@end
