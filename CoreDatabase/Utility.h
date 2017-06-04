//
//  Utility.h
//  CoreDatabase
//
//  Created by Ravi Dhorajiya on 04/06/17.
//  Copyright © 2017 Ravi Dhorajiya. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Utility : NSObject

+(NSArray *)fetchData:(NSString *)entityName prediction:(NSString *)prediction;

+(BOOL)insertUpdateData:(NSMutableArray *)entityData entityName:(NSString *)entityName prediction:(NSString *)prediction;

+ (void)CoreDatabaseDeleteInTable:(NSString *)tableName;

@end
