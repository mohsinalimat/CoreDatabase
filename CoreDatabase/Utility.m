//
//  Utility.m
//  CoreDatabase
//
//  Created by Ravi Dhorajiya on 04/06/17.
//  Copyright © 2017 Ravi Dhorajiya. All rights reserved.
//

#import "Utility.h"

@implementation Utility

#pragma mark - Retrive From Core Data Database
+(NSArray *)fetchData:(NSString *)entityName prediction:(NSString *)prediction
{
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    NSManagedObjectContext *managedObjectContext = [appDelegate managedObjectContext];
    
    NSEntityDescription *entityDesc = [NSEntityDescription entityForName:entityName inManagedObjectContext:managedObjectContext];
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entityDesc];
    [request setReturnsObjectsAsFaults:NO];
    
    NSPredicate *predicate;
    
    if (prediction != nil)
    {
        predicate = [NSPredicate predicateWithFormat:@"userid == %@", prediction];
    }
    else
    {
        predicate = nil;
    }
    
    [request setPredicate:predicate];
    
    NSError *error;
    NSArray *objects = [managedObjectContext executeFetchRequest:request error:&error];
    
    if ([objects count] == 0)
    {
        return nil;
    }
    else
    {
        return objects;
    }
}
+(BOOL)insertUpdateData:(NSMutableArray *)entityData entityName:(NSString *)entityName prediction:(NSString *)prediction
{
    BOOL insertSuccess = false;
    
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:[NSEntityDescription entityForName:entityName inManagedObjectContext:context]];
    
    NSPredicate *predicate;
    predicate = [NSPredicate predicateWithFormat:@"userid == %@", prediction];
    
    [request setPredicate:predicate];
    
    NSError *error = nil;
    NSArray *results = [context executeFetchRequest:request error:&error];
    
    //  NSLog(@"predicate: %@",predicate);
    
    if ([results count] == 0)
    {
        NSManagedObject *insertData = [NSEntityDescription insertNewObjectForEntityForName:entityName inManagedObjectContext:context];
        
        for (int i=0; i< [entityData count]; i++)
        {
            id objectRecord = [entityData objectAtIndex:i];
            for (NSString *key in [objectRecord allKeys])
            {
                [insertData setValue: [objectRecord valueForKey:key] forKey:key];
            }
        }
        
        NSError *error;
        [context save:&error];
        if (error == nil)
        {
            insertSuccess = true;
        }
    }
    else
    {
        for (id insertData in results)
        {
            for (int i=0; i< [entityData count]; i++)
            {
                id objectRecord = [entityData objectAtIndex:i];
                for (NSString *key in [objectRecord allKeys])
                {
                    [insertData setValue: [objectRecord valueForKey:key] forKey:key];
                }
            }
            
        }
        
        NSError *error;
        [context save:&error];
        if (error == nil)
        {
            insertSuccess = true;
        }
    }
    
    return insertSuccess;
}
+ (void)CoreDatabaseDeleteInTable:(NSString *)tableName
{
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    NSManagedObjectContext *managedObjectContext = [appDelegate managedObjectContext];
    NSError *error;
    NSArray *itemsUserChatList = [self fetchData:ACCOUNT_DETAILS prediction:nil];
    if (!error && itemsUserChatList.count > 0) {
        for (NSManagedObject *context in itemsUserChatList) {
            [managedObjectContext deleteObject:context];
        }
        [managedObjectContext save:nil];
    }
    
//    OPTION ONE RECORD DELETE IN TABLE
//        NSArray *arrayResult = [Utility fetchData:ACCOUNT_DETAILS prediction:[[NSUserDefaults standardUserDefaults] valueForKey:@"UniqueIdLast"]];
//        AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
//        NSManagedObjectContext *managedObjectContext = [appDelegate managedObjectContext];
//        for (int i = 0; i < [arrayResult  count]; i++)
//        {
//    
//    
//            [managedObjectContext deleteObject:[arrayResult  objectAtIndex:i]];
//            
//        }
}



@end
