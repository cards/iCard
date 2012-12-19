//
//  PassesTestViewController.m
//  iCard
//
//  Created by Daniele on 08/12/12.
//  Copyright (c) 2012 Cards. All rights reserved.
//

#import "PassesTestViewController.h"
#import <PassSlot/PassSlot.h>
#import <objc/objc-runtime.h>

@interface PassesTestViewController ()

@end

@implementation PassesTestViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
	
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
	
	
	[PassSlot createPassFromTemplateWithName:@"MokaPPGeneric" withValues:nil andRequestInstallation:self completion:^{
		NSLog(@"PassLot addes");
	}];
	
	
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
