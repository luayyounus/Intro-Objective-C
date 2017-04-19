//
//  TableViewController.m
//  Intro_to_objective-c
//
//  Created by Luay Younus on 4/18/17.
//  Copyright © 2017 Luay Younus. All rights reserved.
//

#import "TableViewController.h"
#import "Employee.h"
#import "EmployeeDatabase.h"

@interface TableViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    Employee *luay = [[Employee alloc]initWithFirstName:@"Luay" lastName:@"Younus" age:@73 yearsEmployed:@44 andManager:@"Castro"];
    Employee *brandon = [[Employee alloc]initWithFirstName:@"Brandon" lastName:@"Little" age:@22 yearsEmployed:@-43 andManager:@"Zelda"];
    Employee *sheldon = [[Employee alloc]initWithFirstName:@"Sheldon" lastName:@"Cooper" age:@37 yearsEmployed:@17 andManager:@"CBS"];
    Employee *peter = [[Employee alloc]initWithFirstName:@"Peter" lastName:@"Griffin" age:@33 yearsEmployed:@0 andManager:@"Family Guy"];
    Employee *mickey = [[Employee alloc]initWithFirstName:@"Mickey" lastName:@"Mouse" age:@10 yearsEmployed:@43 andManager:@"Walt Disney"];
    
    
    [[EmployeeDatabase shared] add:luay];
    [[EmployeeDatabase shared]add:brandon];
    [[EmployeeDatabase shared]add:sheldon];
    [[EmployeeDatabase shared]add:peter];
    [[EmployeeDatabase shared]add:mickey];
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    NSLog(@"%@", [[EmployeeDatabase shared] allEmployees]);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [[[EmployeeDatabase shared] allEmployees] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
    }
    
    Employee *employee = [[EmployeeDatabase shared] employeeAtIndex:indexPath.row];
    cell.textLabel.text = @"%@ %@",employee.firstName, employee.lastName;
//    NSLog(@"the label %@",cell.textLabel.text);
    return cell;
}



@end
