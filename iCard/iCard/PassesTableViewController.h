//
//  PassesTableViewController.h
//  iCard
//
//  Created by Daniele on 27/10/12.
//  Copyright (c) 2012 Cards. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <PassKit/PassKit.h>

@interface PassesTableViewController : UITableViewController <PKAddPassesViewControllerDelegate>
{
	NSMutableArray *_passes;
}
@end
