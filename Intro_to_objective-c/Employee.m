//
//  Employee.m
//  Intro_to_objective-c
//
//  Created by Luay Younus on 4/17/17.
//  Copyright © 2017 Luay Younus. All rights reserved.
//

#import "Employee.h"

@implementation Employee

-(instancetype)initWithFirstName:(NSString *)firstName
                        lastName:(NSString *)lastName
                             age:(NSNumber *)age
                           email:(NSString *)email
                   yearsEmployed:(NSNumber *)yearsEmployed
                      andManager:(NSString *)managerName{
    self = [super initWithFirstName:firstName lastName:lastName andAge:age];
    if(self){
        _yearsEmployed = yearsEmployed;
        _managerName = managerName;
        _email = email;
        _employeeNumber = [NSNumber numberWithInt:arc4random_uniform(1000)];
    }
    return self;
}

-(void)setEmployeeNumber:(NSNumber *)employeeNumber{
    if (_employeeNumber != employeeNumber){
        [employeeNumber retain];
        _employeeNumber = employeeNumber;
        [_employeeNumber release];
    }
}

-(void)setEmail:(NSString *)email{
    if (_email != email){
        [email retain];
        _email = email;
        [_email release];
    }
}

-(void)setYearsEmployed:(NSNumber *)yearsEmployed{
    if(_yearsEmployed != yearsEmployed){
        [yearsEmployed retain];
        _yearsEmployed = yearsEmployed;
        [yearsEmployed release];
    }
}

-(void)setManagerName:(NSString *)managerName{
    if(_managerName != managerName){
        [managerName retain];
        _managerName = managerName;
        [_managerName release];
    }
}

+(BOOL)automaticallyNotifiesObserversOfEmployees{
    return NO;
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super init];
    if (self){
        self.firstName = [aDecoder decodeObjectForKey:@"firstName"];
        self.lastName = [aDecoder decodeObjectForKey:@"lastName"];
        self.age = [aDecoder decodeObjectForKey:@"age"];
        self.email = [aDecoder decodeObjectForKey:@"email"];
        self.yearsEmployed = [aDecoder decodeObjectForKey:@"yearsEmployed"];
        self.managerName = [aDecoder decodeObjectForKey:@"managerName"];
        self.employeeNumber = [aDecoder decodeObjectForKey:@"employeeNumber"];
    }
    return self;
}

-(void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.firstName forKey:@"firstName"];
    [aCoder encodeObject:self.lastName forKey:@"lastName"];
    [aCoder encodeObject:self.age forKey:@"age"];
    [aCoder encodeObject:self.email forKey:@"email"];
    [aCoder encodeObject:self.yearsEmployed forKey:@"yearsEmployed"];
    [aCoder encodeObject:self.managerName forKey:@"managerName"];
    [aCoder encodeObject:self.employeeNumber forKey:@"employeeNumber"];
}

-(id)copyWithZone:(NSZone *)zone{
    Employee *employee = [super copyWithZone:zone];
    employee.employeeNumber = self.employeeNumber;
    employee.managerName = self.managerName;
    employee.yearsEmployed = self.yearsEmployed;
    return employee;
}

-(void)dealloc{
    
    [_employeeNumber release];
    [_email release];
    [_yearsEmployed release];
    [_managerName release];
    
    [super dealloc];
}
@end
