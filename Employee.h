//
//  Employee.h
//  Intro_to_objective-c
//
//  Created by Luay Younus on 4/17/17.
//  Copyright © 2017 Luay Younus. All rights reserved.
//

#import "Person.h"

@interface Employee : Person

@property NSInteger employeeNumber;
@property NSInteger yearsEmployed;
@property(strong,nonatomic) NSString *managerName;


@end