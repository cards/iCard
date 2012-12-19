//
//  PassSlotService.m
//  iCard
//
//  Created by Daniele on 19/12/12.
//  Copyright (c) 2012 Cards. All rights reserved.
//

#import "PassSlotService.h"
#import <PassSlot/PassSlot.h>

@implementation PassSlotService

+ (id) startPassService:(NSString*)appKey login:(NSString*)login password:(NSString*)password
{
	@try {
		[PassSlot start:appKey];
		return [NSNumber numberWithBool:YES];
	}
	@catch (NSException *exception) {
		return [NSNumber numberWithBool:NO];
	}
}

+ (id) listTemplates
{
	@try {
		[PassSlot listTemplates:nil];
		return [NSNumber numberWithBool:YES];
	}
	@catch (NSException *exception) {
		return [NSNumber numberWithBool:NO];
	}
}

+ (id) listTemplates:(id)templates
{
//	NSArray *result2 = nil;
//	@try {
//		[PassSlot listTemplates:^(NSArray *templateList) {
//			__block NSArray *result = templateList;
//			result2 = result;
//		}];
//	}
//	@finally {
//		return result;
//	}
}
+ (id) downloadPass:(id)pass
{}
+ (id) downloadPassWithPassTypeIdentifier:(NSString*)passTypeIdentifier serialNumber:(NSString*)serialNumber
{}

+ (id) requestPassInstallation:(id)pass inViewController:(UIViewController*)viewController
{}

+ (id) createPassFromTemplateWithName:(NSString*)templateName withValues:(NSDictionary*)values fromView:(UIViewController*)viewController
{}
+ (id) createPassFromTemplateWithName:(NSString*)templateName withValues:(NSDictionary*)values withImages:(NSArray*)images fromView:(UIViewController*)viewController
{}

+ (id) passFromTemplateWithName:(NSString*)templateName withValues:(NSDictionary*)values
{}
+ (id) passFromTemplateWithName:(NSString*)templateName withValues:(NSDictionary*)values withImages:(NSArray*)images
{}

+ (id) setValues:(NSDictionary*)values forPass:(id)pass
{}
+ (id) setImages:(NSArray*)images forPass:(id)pass
{}

+ (id) valuesForPass:(id)pass
{}
+ (id) imagesForPass:(id)pass
{}

@end
