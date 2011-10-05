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
@property (nonatomic, retain) UISwipeGestureRecognizer *swipeLeftRecognizer;
@property (nonatomic, retain) UISwipeGestureRecognizer *swipeRightRecognizer;
- (void) initSegmentControl;
- (void) initImageAndTextView;
- (void) initPersonnes;
- (void) createGestureRecognizers;
- (void) handleSwipeFrom:(UISwipeGestureRecognizer *)recognizer;
- (void)createGestureRecognizers; 
@end
