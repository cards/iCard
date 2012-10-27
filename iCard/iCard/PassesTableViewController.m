//
//  PassesTableViewController.m
//  iCard
//
//  Created by Daniele on 27/10/12.
//  Copyright (c) 2012 Cards. All rights reserved.
//

#import "PassesTableViewController.h"

@interface PassesTableViewController ()

@end

@implementation PassesTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
	self = [super initWithStyle:style];
	if (self) {
		// Custom initialization
	}
	return self;
}

- (void)viewDidLoad
{
	[super viewDidLoad];
	
	// Uncomment the following line to preserve selection between presentations.
	// self.clearsSelectionOnViewWillAppear = NO;
	
	// Uncomment the following line to display an Edit button in the navigation bar for this view controller.
	// self.navigationItem.rightBarButtonItem = self.editButtonItem;
	
	if(![PKPassLibrary isPassLibraryAvailable])
	{
		UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"D'oh" message:@"Il tuo device non supporta PassBook" delegate:nil cancelButtonTitle:@"Uffa" otherButtonTitles:nil];
		[alert show];
		return;
	}
	
	_passes = [NSMutableArray new];
	
	
	//load passes from the resource folder
	NSArray *paths = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:[[NSBundle mainBundle] resourcePath] error:nil];
	
	for (NSString *path in paths) {
		if([path hasSuffix:@".pkpass"])
		   [_passes addObject:path];
	}
}

- (void)didReceiveMemoryWarning
{
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return _passes.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	static NSString *CellIdentifier = @"Cell";
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
	
	// Configure the cell...
	cell.textLabel.text = [_passes objectAtIndex:indexPath.row];
	
	return cell;
}

/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
 {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 }
 else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
 {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	
	NSString *currentPassName = [_passes objectAtIndex:indexPath.row];
	
	NSString *currentPassFullPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:currentPassName];
	
	NSData *currentPass = [NSData dataWithContentsOfFile:currentPassFullPath];
	
	NSError *err = nil;
	PKPass *realPass = [[PKPass alloc] initWithData:currentPass error:&err];
	
	if(err != nil)
	{
		UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"D'oh" message:err.description delegate:nil cancelButtonTitle:@"Uffa" otherButtonTitles:nil];
		[alert show];
		return;
	}
	
	
	//default viewcontroller in iOS6, for show a pkpass
	PKAddPassesViewController *pkAssPassViewController = [[PKAddPassesViewController alloc] initWithPass:realPass];
	pkAssPassViewController.delegate = self;
	[self presentViewController:pkAssPassViewController animated:YES completion:nil];
		
	
	
	// Navigation logic may go here. Create and push another view controller.
	/*
	 <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
	 // ...
	 // Pass the selected object to the new view controller.
	 [self.navigationController pushViewController:detailViewController animated:YES];
	 */
}


//delegato del PKAddPassesViewController per il dismiss dello stesso
-(void)addPassesViewControllerDidFinish:(PKAddPassesViewController *)controller
{
	[self dismissViewControllerAnimated:YES completion:nil];
}

@end
