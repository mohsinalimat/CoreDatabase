//
//  ViewController.m
//  CoreDatabase
//
//  Created by Ravi Dhorajiya on 04/06/17.
//  Copyright © 2017 Ravi Dhorajiya. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    __weak IBOutlet UITextField *txtUserID;
    __weak IBOutlet UITextField *txtName;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Insert and Update
- (IBAction)btnInsert:(id)sender
{
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                                 [NSString stringWithFormat:@"%@",txtUserID.text],USER_ID,
                                 txtName.text,USER_NAME,
                                 nil];
    
    NSMutableArray *arrayDatabase = [[NSMutableArray alloc]init];
    [arrayDatabase addObject:dict];
    [Utility insertUpdateData:arrayDatabase entityName:ACCOUNT_DETAILS prediction:nil];
}
#pragma mark - Fetch
- (IBAction)btnShowAllRecord:(id)sender {
    NSArray *arrShow = [[NSArray alloc] init];
    arrShow = [Utility fetchData:ACCOUNT_DETAILS prediction:nil];
    NSLog(@"%@",arrShow.description);
}
#pragma mark - Delete
- (void)DeleteRecord
{
    [Utility CoreDatabaseDeleteInTable:ACCOUNT_DETAILS];
}

@end
