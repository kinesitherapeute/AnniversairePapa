//
//  MessageCo,troller.m
//  AnniversairePapa
//
//  Created by Pierre Besson on 01/10/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "MessageTableViewController.h"
#import "Personne.h"
#import "PDetailViewController.h"

@implementation MessageTableViewController
@synthesize detailViewController = _detailViewController;
@synthesize personnesArray;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

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

- (void)awakeFromNib
{
    self.clearsSelectionOnViewWillAppear = NO;
    self.contentSizeForViewInPopover = CGSizeMake(320.0, 600.0);
    [super awakeFromNib];
}
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    //On charge les données depuis le fihier .plist
    NSString *path = [[NSBundle mainBundle] pathForResource:@"NomPrenom" ofType:@"plist"];
    NSDictionary *dictFromFile = [[NSDictionary alloc] initWithContentsOfFile:path];
    NSArray *arrayFromFile = [dictFromFile objectForKey:@"Root"];
    
    // Créons un tableau temporaire que nous allons remplir avec un objet Personnes par NSDictionnary contenu dans le fichier .plist
    // Notez l'utilisation de NSEnumerator pour parcourir un tableau
    NSMutableArray *personnesToAdd = [[NSMutableArray alloc] init];
    NSEnumerator *enumerator = [arrayFromFile objectEnumerator];
    NSDictionary *anObject;
    //On ajoute tous les éléments de la liste du fichier .plist.
    while ((anObject = [enumerator nextObject])) {
        Personne *personne = [[Personne alloc] initWithDictionaryFromPlist: anObject];
        [personnesToAdd addObject: personne];
        //[personne release];
    }
    
    //On remplie la prop personnesArray avec l'objet qu'on vient de remplir.
     self.personnesArray = [NSArray arrayWithArray:personnesToAdd];
    
    // Gestion de la mémoire : pour chaque alloc, n'oubliez pas le release qui va avec !
    //[personnesToAdd release];
    //[arrayFromFile release];
    
    // Do any additional setup after loading the view, typically from a nib.
  /*  self.detailViewController = (PDetailViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];*/
    // Set up the edit and add buttons.

}

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

// Customize the number of sections in the table view.
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // On n'a besoin que d'une section pour nos personnes
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Nous ne tenons pas compte du numéro de section puisqu'il n'y en a qu'une
    // Dans cette unique section il y a tous les éléments du tableau, on retourne donc le nombre
    return [self.personnesArray count];
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    // Les cellules sont mises en cache pour accélérer le traitement, sous l'identifiant "Cell",
    // on essaie récupère ce modèle de cellule s'il est déjà en cache
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // Si on n'a pas réussi à sortir une cellule du cache, on crée un nouveau modèle de cellule
    // et on l'enregistre dans le cache
   if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    // On récupère l'objet Website qui correspon à la ligne que l'on souhaite afficher
    Personne *personne = [self.personnesArray objectAtIndex:indexPath.row];
    
    // On configure la cellule avec le titre du site et sa description
    cell.textLabel.text = personne.surnom;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@/%@/%@", personne.nom, @" ", personne.prenom];
    // On renvoie la cellule configurée pour l'affichage
    return cell;
}

@end
