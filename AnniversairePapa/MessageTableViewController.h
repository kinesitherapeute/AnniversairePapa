//
//  MessageCo,troller.h
//  AnniversairePapa
//
//  Created by Pierre Besson on 01/10/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class PDetailViewController;

@interface MessageTableViewController : UITableViewController   {
    NSArray *personnesArray;
}
@property (strong, nonatomic) PDetailViewController *detailViewController;
@property (nonatomic, retain) NSArray *personnesArray;
@end;
