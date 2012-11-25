//
//  ThePassbook.m
//  iCard
//
//  Created by Daniele on 25/11/12.
//  Copyright (c) 2012 Cards. All rights reserved.
//

#import "ThePassbook.h"

@interface ThePassbook()
{
	NSArray *requiredTopLevelKeys;
	NSArray *requiredLowLevelKeys;
	NSArray *requiredFieldsKeys;
}

@end

@implementation ThePassbook
-(id)init
{
	
	if(self = [super init])
	{
		
#pragma required top level keys
		requiredTopLevelKeys = [NSArray arrayWithObjects:@"description", @"formatVersion",
						@"organizationName",@"passTypeIdentifier",@"serialNumber",
						@"teamIdentifier",nil];
		requiredLowLevelKeys = [NSArray arrayWithObjects:@"latitude",@"longitude",@"format",
						@"message",@"messageEncoding",@"",@"",@"",@"",nil];
		requiredFieldsKeys = [NSArray arrayWithObjects:@"key", @"value", nil];
		
		
		
		
#pragma mark - package
		self.package = [NSMutableDictionary new];
		
		[self.package setValue:nil forKey:@"background.png"];
		[self.package setValue:nil forKey:@"background@2x.png"];
		//	The image displayed as the background of the front of the pass.
		[self.package setValue:nil forKey:@"footer.png"];
		[self.package setValue:nil forKey:@"footer@2x.png"];
		//	The image displayed on the front of the pass near the barcode.
		[self.package setValue:nil forKey:@"icon.png"];
		[self.package setValue:nil forKey:@"icon@2x.png"];
		//	The pass’s icon. This is displayed in notifications and in emails that have a pass attached, and on the lock screen.
		//	When it is displayed, the icon gets a shine effect and rounded corners.
		[self.package setValue:nil forKey:@"logo.png"];
		[self.package setValue:nil forKey:@"logo@2x.png"];
		//	The image displayed on the front of the pass in the top left.
		[self.package setValue:nil forKey:@"manifest.json"];
		//	A JSON dictionary. Each key is the path to a file (relative to the top level of the bundle) and the key’s value is the SHA-1 hash for that file. Every file in the bundle appears in the manifest, except for the manifest itself and the signature.
		[self.package setValue:nil forKey:@"pass.json"];
		//	A JSON dictionary that defines the pass. Its contents are described in detail in “Top-Level Keys.”
		[self.package setValue:nil forKey:@"signature"];
		//	A detached PKCS#7 signature of the manifest.json file.
		[self.package setValue:nil forKey:@"strip.png"];
		[self.package setValue:nil forKey:@"strip@2x.png"];
		//	The image displayed behind the primary fields on the front of the pass.
		[self.package setValue:nil forKey:@"thumbnail.png"];
		[self.package setValue:nil forKey:@"thumbnail@2x.png"];
		//	An additional image displayed on the front of the pass. For example, on a membership card, the thumbnail could be used to a picture of the cardholder.
		
		
		
		
		
#pragma mark - top level 
		//Keys that are used at the lowest level of the pass.json file, which define an individual field.
		
		//http://developer.apple.com/library/ios/#documentation/userexperience/Reference/PassKit_Bundle/Chapters/TopLevel.html#//apple_ref/doc/uid/TP40012026-CH2-SW1
		self.topLevel = [NSMutableDictionary new];
		
#pragma Standard Keys
		[self.topLevel setValue:nil forKey:@"description"]; //localizablestring
		[self.topLevel setValue:nil forKey:@"formatVersion"]; //integer
		[self.topLevel setValue:nil forKey:@"organizationName"]; //localizablestring
		[self.topLevel setValue:nil forKey:@"passTypeIdentifier"]; //string
		[self.topLevel setValue:nil forKey:@"serialNumber"]; //string
		[self.topLevel setValue:nil forKey:@"teamIdentifier"]; //string
		
#pragma Associated App Keys
		[self.topLevel setValue:nil forKey:@"associatedStoreIdentifiers"]; //array of strings
		
#pragma Relevance Keys
		[self.topLevel setValue:nil forKey:@"locations"]; //array of location dictionaries
		[self.topLevel setValue:nil forKey:@"relevantDate"]; //ISO 8601 date, as a string
		
#pragma Style Keys
		[self.topLevel setValue:nil forKey:@"boardingPass"]; //pass-structure dictionary
		[self.topLevel setValue:nil forKey:@"coupon"]; //pass-structure dictionary
		[self.topLevel setValue:nil forKey:@"eventTicket"]; //pass-structure dictionary
		[self.topLevel setValue:nil forKey:@"generic"]; //pass-structure dictionary
		[self.topLevel setValue:nil forKey:@"storeCard"]; //pass-structure dictionary
		
#pragma Visual Appearance Keys
		[self.topLevel setValue:nil forKey:@"barcode"]; //barcode dictionary
		[self.topLevel setValue:nil forKey:@"backgroundColor"]; //color, as a string rgb(23, 187, 82)
		[self.topLevel setValue:nil forKey:@"foregroundColor"]; //color, as a string rgb(23, 187, 82)
		[self.topLevel setValue:nil forKey:@"labelColor"]; //color, as a string rgb(23, 187, 82)
		[self.topLevel setValue:nil forKey:@"logoText"]; //localizable string rgb(23, 187, 82)
		[self.topLevel setValue:nil forKey:@"suppressStripShine"]; //bool
		
#pragma Web Service Keys
		[self.topLevel setValue:nil forKey:@"authenticationToken"]; //string
		[self.topLevel setValue:nil forKey:@"webServiceURL"]; //string. Must be a HTTPS webservice, http://developer.apple.com/library/ios/#documentation/PassKit/Reference/PassKit_WebService/WebService.html#//apple_ref/doc/uid/TP40011988
		
		
		
		
		
#pragma mark - lower level
		//http://developer.apple.com/library/ios/#documentation/userexperience/Reference/PassKit_Bundle/Chapters/LowerLevel.html#//apple_ref/doc/uid/TP40012026-CH3-SW1
		self.lowerLevel = [NSMutableDictionary new];
		
#pragma Pass Structure Dictionary Keys
		[self.lowerLevel setValue:nil forKey:@"headerFields"]; //array of field dictionaries
		[self.lowerLevel setValue:nil forKey:@"primaryFields"]; //array of field dictionaries
		[self.lowerLevel setValue:nil forKey:@"secondaryFields"]; //array of field dictionaries
		[self.lowerLevel setValue:nil forKey:@"auxiliaryFields"]; //array of field dictionaries
		[self.lowerLevel setValue:nil forKey:@"backFields"]; //array of field dictionaries
		[self.lowerLevel setValue:nil forKey:@"transitType"]; //string, Required for boarding passes; otherwise not allowed. Type of transit. Must be one of the following values: PKTransitTypeAir, PKTransitTypeBoat, PKTransitTypeBus, PKTransitTypeGeneric,PKTransitTypeTrain.
		
#pragma Location Dictionary Keys
		[self.lowerLevel setValue:nil forKey:@"altitude"]; //double
		[self.lowerLevel setValue:nil forKey:@"latitude"]; //double
		[self.lowerLevel setValue:nil forKey:@"longitude"]; //double
		[self.lowerLevel setValue:nil forKey:@"relevantText"]; //string
		
#pragma Barcode Dictionary Keys
		[self.lowerLevel setValue:nil forKey:@"altText"]; //string
		[self.lowerLevel setValue:nil forKey:@"format"]; //string
		[self.lowerLevel setValue:nil forKey:@"message"]; //string
		[self.lowerLevel setValue:@"iso-8859-1" forKey:@"messageEncoding"]; //IANA character set name, as a string. Typically is iso-8859-1
		
		
		
		
		
#pragma mark - lower level
		//http://developer.apple.com/library/ios/#documentation/userexperience/Reference/PassKit_Bundle/Chapters/FieldDictionary.html#//apple_ref/doc/uid/TP40012026-CH4-SW1
		self.fields = [NSMutableDictionary new];

#pragma Standard Field Dictionary Keys
		[self.fields setValue:nil forKey:@"changeMessage"]; //localizable format string
		[self.fields setValue:nil forKey:@"key"]; //string
		[self.fields setValue:nil forKey:@"label"]; //localizable string
		[self.fields setValue:nil forKey:@"textAlignment"]; //Must be one of the following values: PKTextAlignmentLeft, PKTextAlignmentCenter, PKTextAlignmentRight, PKTextAlignmentNatural. This key is not allowed for primary fields.
		[self.fields setValue:nil forKey:@"value"]; //ocalizable string, ISO 8601 date as a string, or number
		
#pragma Date Style Keys
		[self.fields setValue:nil forKey:@"dateStyle"]; //string
		[self.fields setValue:nil forKey:@"timeStyle"]; //string
		//Date and time styles
		//PKDateStyleNone, PKDateStyleShort, PKDateStyleMedium, PKDateStyleLong, PKDateStyleFull
		[self.fields setValue:nil forKey:@"isRelative"]; //bool, If true, the label’s value is displayed as a relative date; otherwise, it is displayed as an absolute date. The default value is false.
		
#pragma Number Style Keys
		[self.fields setValue:nil forKey:@"currencyCode"]; //string, ISO 4217 currency code for the field’s value.
		[self.fields setValue:nil forKey:@"numberStyle"]; //string, Style of number to display. Must be one of the following values: PKNumberStyleDecimal, PKNumberStylePercent, PKNumberStyleScientific, PKNumberStyleSpellOut.

		
		
	}
	return self;
}
@end
