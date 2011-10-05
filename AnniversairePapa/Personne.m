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

- (id) initWithDictionaryFromPlist: (NSDictionary *) dictionnary {
    self.nom = [dictionnary objectForKey:@"Nom"];
    self.prenom = [dictionnary objectForKey:@"Prenom"];
    self.surnom = [dictionnary objectForKey:@"Surnom"];
    self.message = [dictionnary objectForKey:@"Message"];
    return self;
}

/*- (void)dealloc {
    [nom release];
    [prenom release];
    [surnom release];
    [message release];
    [super dealloc];
}*/

@end
