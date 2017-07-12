# CoreDatabase

Insert, Update, Delete and Fetch from CoreDatabase.

# Fatch Ascending Order
when coreDatabase value set in ascending order. so you can use below code.

```
NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"ADD_TABLE_NAME"];
NSSortDescriptor *sort = [[NSSortDescriptor alloc] initWithKey:@"ADD_KEY_OF_ASCENDING_ORDER" ascending:YES selector:@selector(localizedStandardCompare:)];
NSArray *sortDescription = [[NSArray alloc] initWithObjects:sort, nil];
[request setSortDescriptors:sortDescription];
        
NSError *error;
NSArray *objects = [managedObjectContext executeFetchRequest:request error:&error];
NSLog(@"Array : %@",objects);
```
