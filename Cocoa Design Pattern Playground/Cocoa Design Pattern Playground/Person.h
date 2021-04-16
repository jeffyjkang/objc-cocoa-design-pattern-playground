//
//  Person.h
//  Cocoa Design Pattern Playground
//
//  Created by Jeff Kang on 4/15/21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, PersonHairColor) {
    PersonHairColorBrown = 0,
    PersonHairColorBlonde = 1,
    PersonHairColorOrange = 2,
    PersonHairColorBlue = 3,
    PersonHairColorGreen = 4,
};

@interface Person : NSObject <NSCopying>

@property (nonatomic, copy) NSString *fullName;
@property (nonatomic) NSDate *hireDate;
@property (nonatomic) PersonHairColor hairColor;

- (instancetype)initWithName:(NSString *)aName hireDate:(NSDate *)aHireDate hairColor:(PersonHairColor)aHairColor NS_DESIGNATED_INITIALIZER;

@end

NS_ASSUME_NONNULL_END
