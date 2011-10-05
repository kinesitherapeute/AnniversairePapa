//
//  Personne.h
//  NotrePapa
//
//  Created by Pierre Besson on 01/10/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Personne : NSObject{
    NSString *nom;
    NSString *prenom;
    NSString *surnom;
    NSString *message;
    
}

@property (nonatomic, retain)  NSString *nom;
@property (nonatomic, retain)  NSString *prenom;
@property (nonatomic, retain)  NSString *surnom;
@property (nonatomic, retain)  NSString *message;

- (id) initWithDictionaryFromPlist: (NSDictionary *) dictionnary;
@end
