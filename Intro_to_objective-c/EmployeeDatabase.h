//
//  EmployeeDatabase.h
//  Intro_to_objective-c
//
//  Created by Luay Younus on 4/18/17.
//  Copyright © 2017 Luay Younus. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Employee.h"

@interface EmployeeDatabase : NSObject

+(instancetype)shared;

-(NSMutableArray *)allEmployees;
-(NSInteger)count;

-(Employee *)employeeAtIndex:(int)index;

-(void)add:(Employee *)employee;
-(void)remove:(Employee *)employee;
-(void)removeEmployeeAtIndex:(Employee *)employee atIndex:(int)index;
-(void)removeAllEmployees;

@end
