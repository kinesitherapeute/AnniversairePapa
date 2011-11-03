//
//  HistoryViewController.h
//  AnniversairePapa
//
//  Created by Pierre Besson on 02/10/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HistoryViewController : UIViewController

@property (strong, nonatomic) IBOutlet UISegmentedControl *segmentedControl;
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) NSMutableArray *personnesArray;
@property (strong, nonatomic) IBOutlet UITextView *textView;
- (void) initSegmentControl;
- (void) initImageAndTextView;
- (void) initPersonnes;
//- (void) createGestureRecognizers;
- (IBAction) handleSwipeFrom:(UISwipeGestureRecognizer *)recognizer;
- (IBAction)handleTapOnSegmentControl:(UITapGestureRecognizer *)recognizer;
- (IBAction) handleTapGesture:(UIGestureRecognizer *) sender ;
- (IBAction) handlePinchGesture:(UIGestureRecognizer *) sender ;
//- (void)createGestureRecognizers; 
@end
