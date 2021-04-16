//
//  Person.m
//  Cocoa Design Pattern Playground
//
//  Created by Jeff Kang on 4/15/21.
//

#import "Person.h"

//NSString *PersonGenerateRandomName() {
//
//}

@implementation Person

- (instancetype)init
{
    return [self initWithName:[self.class generateRandomName] hireDate:NSDate.now hairColor:arc4random_uniform(5)];
//    return [self initWithName:PersonGenerateRandomName() hireDate:NSDate.now hairColor:PersonHairColorBlonde];
}

- (instancetype)initWithName:(NSString *)aName hireDate:(NSDate *)aHireDate hairColor:(PersonHairColor)aHairColor
{
    if (self = [super init]) {
        _fullName = aName.copy;
        _hireDate = aHireDate;
        _hairColor = aHairColor;
    }
    return self;
}

+ (NSString *)generateRandomName
{
    static NSArray *firstNames = nil;
    static NSArray *lastNames = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        firstNames = @[@"Adam", @"Bob", @"Charles", @"David"];
        lastNames = @[@"Edwards", @"Franklin", @"Grimes", @"Ham"];
    });
    
    NSUInteger randomIndex = arc4random_uniform((uint32_t)firstNames.count);
    NSString *randomFirstName = [firstNames objectAtIndex:randomIndex];
    
    NSString *randomLastName = [lastNames objectAtIndex: arc4random_uniform((uint32_t)lastNames.count)];
    
    return [NSString stringWithFormat:@"%@ %@", randomFirstName, randomLastName];
}

- (NSString *)description
{
    static NSDictionary<NSNumber *, NSString *> *hairLookup = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        hairLookup = @{
            @(PersonHairColorBrown): @"Brown",
            @(PersonHairColorBlonde): @"Blonde",
            @(PersonHairColorOrange): @"Orange",
            @(PersonHairColorBlue): @"Blue",
            @(PersonHairColorGreen): @"Green",
        };
    });
    
    NSString *hairColorString = [hairLookup objectForKey:@(self.hairColor)];
    
    return [NSString stringWithFormat:@"<%@: %p; %@ hired on %@, has %@ hair>", NSStringFromClass(self.class), self, self.fullName, self.hireDate, hairColorString];
}

- (nonnull id)copyWithZone: (nullable NSZone *)zone
{
//    Person *copy = [[Person alloc] initWithName:self.fullName
//                                       hireDate:NSDate.now
//                                      hairColor:self.hairColor];
    
    Person *copy = [[Person alloc] init];
    copy.fullName = self.fullName;
    copy.hireDate = self.hireDate;
    copy.hairColor = self.hairColor;
    
    return copy;
}

- (BOOL)isEqual:(Person *)object
{
    if (![object isKindOfClass:Person.class]) return NO;
    if (self == object) return YES;
    
    return [self.fullName isEqualToString:object.fullName]
    && [self.hireDate isEqualToDate:object.hireDate]
    && self.hairColor == object.hairColor;
}

- (NSUInteger)hash
{
    return self.fullName.hash
    ^ self.hireDate.hash
    ^ @(self.hairColor).hash;
}

@end
