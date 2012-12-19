//
//  PassServiceProtocol.h
//  iCard
//
//  Created by Daniele on 15/12/12.
//  Copyright (c) 2012 Cards. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol PassServiceProtocol <NSObject>


+ (id) startPassService:(NSString*)appKey login:(NSString*)login password:(NSString*)password;

+ (id) listTemplates;
+ (id) listTemplates:(id)templates;
+ (id) downloadPass:(id)pass;
+ (id) downloadPassWithPassTypeIdentifier:(NSString*)passTypeIdentifier serialNumber:(NSString*)serialNumber;

+ (id) requestPassInstallation:(id)pass inViewController:(UIViewController*)viewController;

+ (id) createPassFromTemplateWithName:(NSString*)templateName withValues:(NSDictionary*)values fromView:(UIViewController*)viewController;
+ (id) createPassFromTemplateWithName:(NSString*)templateName withValues:(NSDictionary*)values withImages:(NSArray*)images fromView:(UIViewController*)viewController;

+ (id) passFromTemplateWithName:(NSString*)templateName withValues:(NSDictionary*)values;
+ (id) passFromTemplateWithName:(NSString*)templateName withValues:(NSDictionary*)values withImages:(NSArray*)images;

+ (id) setValues:(NSDictionary*)values forPass:(id)pass;
+ (id) setImages:(NSArray*)images forPass:(id)pass;

+ (id) valuesForPass:(id)pass;
+ (id) imagesForPass:(id)pass;


//Registering a Device to Receive Push Notifications for a Pass
//POST request to webServiceURL/version/devices/deviceLibraryIdentifier/registrations/passTypeIdentifier/serialNumber

//Getting the Serial Numbers for Passes Associated with a Device
//GET request to webServiceURL/version/devices/deviceLibraryIdentifier/registrations/passTypeIdentifier?passesUpdatedSince=tag

//Getting the Latest Version of a Pass
//GET request to webServiceURL/version/passes/passTypeIdentifier/serialNumber

//Unregistering a Device
//DELETE request to webServiceURL/version/devices/deviceLibraryIdentifier/registrations/passTypeIdentifier/serialNumber

//Logging Errors
//POST request to webServiceURL/version/log

//start service
//get templates
//get template
//creae from template
//update campi pass
//aggiungi immagini
//get img
//update template con push opzionale
//invalida template


//http://www.passsource.com/apiAllTemplates.php
//http://www.passsource.com/apiTemplatePasses.php?template_id=[YOUR_TEMPLATE_ID]
//http://www.passsource.com/apiLogin.php?email=[YOUR_EMAIL]&password=[YOUR_PASSWORD]
//http://www.passsource.com/templateHash.php?template_id=[YOUR_TEMPLATE_ID]
//http://www.passsource.com/create.php?templateHash=eNortjIysVIycEwyDskvM85PL3DOSU4pDvUyczZKt7VVsgZcMJ5yCZk,&coupon_primaryFields_offer_value=%2410%20off&coupon_primaryFields_offer_label=any%20purchase%20over%20%2480&generate=true
//http://www.passsource.com/create.php?hashedSerialNumber=eNortjIysVJyDcpONfdNDUsqL8mxMNN29NMPzPdLt7VVsgZcMJ3lCXI,
//http://www.passsource.com/create.php?hashedSerialNumber=eNortjIysVJyDcpONfdNDUsqL8mxMNN29NMPzPdLt7VVsgZcMJ3lCXI,&templateHash=eNortjIysVIycEwyDskvM85PL3DOSU4pDvUyczZKt7VVsgZcMJ5yCZk,&coupon_auxiliaryFields_expires_value=1%2F1%2F2013&generate=true
//
//
//https://api.passkit.com/v1/template/{templateName}/fieldnames
//https://api.passkit.com/v1/image/add/{imageType}
//https://api.passkit.com/v1/image/{imageID}
//https://api.passkit.com/v1/pass/issue/template/{templateName}
//https://api.passkit.com/v1/pass/issue/batch/template/{templateName}
//https://api.passkit.com/v1/pass/update/template/{templateName}/serial/{serialNumber} /push (optional)
//https://api.passkit.com/v1/pass/invalidate/template/{templateName}/serial/{serialNumber}
//
//https://api.passtool.com/v1/template/{templateId}
//https://api.passtool.com/v1/pass/{passId}
//https://api.passtool.com/v1/pass/{templateId}

@end
