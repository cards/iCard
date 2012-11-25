//
//  ThePassbook.h
//  iCard
//
//  Created by Daniele on 25/11/12.
//  Copyright (c) 2012 Cards. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ThePassbook : NSObject

@property (nonatomic, strong) NSMutableDictionary *package;
@property (nonatomic, strong) NSMutableDictionary *topLevel;
@property (nonatomic, strong) NSMutableDictionary *lowerLevel;
@property (nonatomic, strong) NSMutableDictionary *fields;

@end
