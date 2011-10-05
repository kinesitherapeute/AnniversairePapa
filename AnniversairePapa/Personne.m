//
//  Personne.m
//  NotrePapa
//
//  Created by Pierre Besson on 01/10/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "Personne.h"

@implementation Personne

@synthesize nom;
@synthesize prenom;
@synthesize surnom;
@synthesize message;
@synthesize photosName;

//Méthode qui permet d'avoir une initialisation de la personne avec un dictionnaire récupéré du fichier .plist
- (id) initWithDictionaryFromPlist: (NSDictionary *) dictionnary {
    numPhoto = 0;
    self.nom = [dictionnary objectForKey:@"Nom"];
    self.prenom = [dictionnary objectForKey:@"Prenom"];
    self.surnom = [dictionnary objectForKey:@"Surnom"];
    self.message = [dictionnary objectForKey:@"Message"];
    self.photosName = [dictionnary objectForKey:@"Photos"];
    return self;
}

//Methode qui permet d'obtenir la prochaine photo que l'on veut afficher.
-(NSString*) getNextPhoto{
    NSLog(@"Next Photo is called");
    NSLog([@"Current photo number:" stringByAppendingString:[NSString stringWithFormat:@"%d", numPhoto]]);
    NSString *photofileName = [self.photosName objectAtIndex:numPhoto];
    if( numPhoto == [self.photosName count]-1){
        numPhoto = 0;
    } else{
        numPhoto ++;
    }
    return photofileName;
}
//Permet de récupérer la photo précédente.
-(NSString*) getPreviousPhoto{
    NSLog(@"Previous photo is called");
    NSLog([@"Numero de photo" stringByAppendingString:[NSString stringWithFormat:@"%d", numPhoto]]);
    if(numPhoto == 0){
        numPhoto = [self.photosName count]-1;
    }else{
        numPhoto --;
    }
    return [self.photosName objectAtIndex:numPhoto];
}

/*- (void)dealloc {
    [nom release];
    [prenom release];
    [surnom release];
    [message release];
    [super dealloc];
}*/

@end
