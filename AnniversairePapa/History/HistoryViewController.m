//
//  HistoryViewController.m
//  AnniversairePapa
//
//  Created by Pierre Besson on 02/10/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "HistoryViewController.h"
#import "Personne.h"

//Génération des setter/getter
@implementation HistoryViewController
@synthesize segmentedControl;
@synthesize imageView;
@synthesize personnesArray;
@synthesize textView;

//Deal with fullscreen mode.
CGRect originalFrame,fullScreenFrame, textFrame; //In order to keep in memory the size of the image view
BOOL isFullScreenMode; //In order to know if you are in fullScreen mode.



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
    }
    return self;
}

- (void) initPersonnes{
    //On charge les données depuis le fihier .plist
    NSString *path = [[NSBundle mainBundle] pathForResource:@"NomPrenom" ofType:@"plist"];
    NSDictionary *dictFromFile = [[NSDictionary alloc] initWithContentsOfFile:path];
    NSArray *arrayFromFile = [dictFromFile objectForKey:@"Root"];
    
    // Créons un tableau temporaire que nous allons remplir avec un objet Personnes par NSDictionnary contenu dans le fichier .plist
    // Notez l'utilisation de NSEnumerator pour parcourir un tableau
    personnesArray = [[NSMutableArray alloc] init];
    NSEnumerator *enumerator = [arrayFromFile objectEnumerator];
    NSDictionary *anObject;
    //On ajoute tous les éléments de la liste du fichier .plist.
    while ((anObject = [enumerator nextObject])) {
        Personne *personne = [[Personne alloc] initWithDictionaryFromPlist: anObject];
        [personnesArray addObject: personne];
        //[personne release];//On ne s'occupe pas de a liberation de mémoire dans iOs5.
    }
}

- (void) initImageAndTextView{
    textView.text  = [[personnesArray objectAtIndex:[segmentedControl selectedSegmentIndex]] message];
    [textView setOpaque:TRUE];
    [imageView setImage:[UIImage imageNamed:@"IMG_0992_face0.jpg"]];
    [imageView setOpaque:TRUE];
    [self.view addSubview:imageView];
    [self.view addSubview:textView];
    textFrame = textView.frame;
    [textView sizeToFit];
    //We put in memory the size of fullscreen mode and normal mode.
    originalFrame = imageView.frame;//CGRectMake(imageView.frame.origin.x,imageView.frame.origin.y,imageView.frame.size.width,imageView.frame.size.height);
    fullScreenFrame = CGRectMake(0,0,768,1004);
}
-(void) updateImageView:(bool) isLeft{
    
   // imageView = NULL;
    //imageView.frame = isFullScreenMode ? originalFrame: fullScreenFrame;
    NSString *imageNom;
    if(isLeft){
        //imageNom = @"IMG_0992_face0.jpg";
        //[imageView setImage:[UIImage imageNamed:@"IMG_0992_face0.jpg"]];
        imageNom = [[personnesArray objectAtIndex:[segmentedControl selectedSegmentIndex]] getPreviousPhoto];
        
    } else{
        //[imageView setImage:[UIImage imageNamed:@"DSC01133_face1.jpg"]];
        imageNom = [[personnesArray objectAtIndex:[segmentedControl selectedSegmentIndex]] getNextPhoto];
    //[imageView setImage:[UIImage imageNamed:imageNom]];
    }
    [imageView  setImage:[UIImage imageNamed:imageNom]];
    [imageView setOpaque:TRUE];
    //[self.view addSubview:imageView];
}

//Faire une méthode qui fait la même chose mais pour le bouton sélectionné.

- (void) initSegmentControl{
    
    [segmentedControl removeAllSegments];
    NSInteger i =0;
    for(Personne* personne in personnesArray){
        [segmentedControl insertSegmentWithTitle:personne.surnom atIndex:i animated:FALSE];
        if(i == 0){
            [segmentedControl setSelectedSegmentIndex:i];
        }
        i++;
        //[segmentedControl sizeToFit];//Permet la mise à jour en taille des boutons
        //[segmentedControl setContentHorizontalAlignment: UIControlContentHorizontalAlignmentCenter];
    }
}


- (IBAction)handleTapOnSegmentControl:(UITapGestureRecognizer *)recognizer {
    Personne * personne = [personnesArray objectAtIndex:[segmentedControl selectedSegmentIndex]];
    //textView = [[UITextView alloc] initWithFrame:CGRectMake(5, 30, 100, 30)]; 
    textView.frame = textFrame;
    [textView setText: [personne message]];
    textView.autoresizingMask = UIViewAutoresizingFlexibleHeight; 
    [textView sizeToFit];
    [self updateImageView:TRUE];
}

- (IBAction)handleSwipeFrom:(UISwipeGestureRecognizer *)recognizer {
    
    
    if (recognizer.direction == UISwipeGestureRecognizerDirectionLeft) {
        [self updateImageView:TRUE];
    } 
    else {
        [self updateImageView:FALSE];
    }
    
    [UIView beginAnimations:nil context:NULL];
    //[UIView setAnimationDuration:0.55];
   // imageView.alpha = 0.0;
   // imageView.center = location;
//     [self.view addSubview:imageView];
    [UIView commitAnimations];
}


//---handle tap gesture---
-(IBAction) handleTapGesture:(UIGestureRecognizer *) sender {
    // HOW TO ACCOMPLISH THIS PART
    if (isFullScreenMode)
        [imageView setFrame:originalFrame];
    else
        [imageView setFrame:fullScreenFrame];
    
    [imageView setCenter:CGPointMake(self.view.frame.size.width/2,self.view.frame.size.height/2)];
    isFullScreenMode = !isFullScreenMode;
    NSLog(@"Image View : %@",imageView);
}

//---handle pinch gesture---
-(IBAction) handlePinchGesture:(UIGestureRecognizer *) sender { 
    CGFloat factor = [(UIPinchGestureRecognizer *) sender scale];   
    
    if (sender.state == UIGestureRecognizerStateEnded){
        // HOW TO ACCOMPLISH THIS ---
        if (factor > 1 && !isFullScreenMode) {
            //---pinching in---
            [imageView setFrame:fullScreenFrame];
            
        } else {
            //---pinching out---
            [imageView setFrame:originalFrame];
            
        } 
        isFullScreenMode = !isFullScreenMode;
        [imageView setCenter:CGPointMake(self.view.frame.size.width/2,self.view.frame.size.height/2)];
    }   
    NSLog(@"Image View : %@",imageView);
}


/*- (void)createGestureRecognizers {
    UIGestureRecognizer *recognizer;
    //The right swipe recognizer. 
    recognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipeForm:)]; //Target est la classe qui va prendre en charge le callback
    self.swipeRightRecognizer = (UISwipeGestureRecognizer *) recognizer;
    swipeRightRecognizer.direction = UISwipeGestureRecognizerDirectionRight;
    [self.imageView addGestureRecognizer:swipeRightRecognizer];
    
    //The left swipe recognizer
    recognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipeForm:)]; //Target est la classe qui va prendre en charge le callback
    self.swipeLeftRecognizer = (UISwipeGestureRecognizer *) recognizer;
    swipeLeftRecognizer.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.imageView addGestureRecognizer:swipeLeftRecognizer];
  
 
 //
 UITapGestureRecognizer *singleFingerDTap = [[UITapGestureRecognizer alloc]
                                                initWithTarget:self action:@selector(handleSingleDoubleTap:)];
    singleFingerDTap.numberOfTapsRequired = 2;
    [s addGestureRecognizer:singleFingerDTap];
    [singleFingerDTap release];
    
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc]
                                          initWithTarget:self action:@selector(handlePanGesture:)];
    [self.theView addGestureRecognizer:panGesture];
    [panGesture release];
    
    UIPinchGestureRecognizer *pinchGesture = [[UIPinchGestureRecognizer alloc]
                                              initWithTarget:self action:@selector(handlePinchGesture:)];
    [self.theView addGestureRecognizer:pinchGesture];
    [pinchGesture release];//
}
*/

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
    
}

#pragma mark - View lifecycle

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    
    [super viewDidLoad];
    //On fait toutes les initialisations nécessaires. 
    [self initPersonnes];
    [self initSegmentControl];
    [self initImageAndTextView];
   // [self createGestureRecognizers];
    //[segmentedControl touchesBegan:<#(NSSet *)#> withEvent:<#(UIEvent *)#>]
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
	return YES;
}

@end
