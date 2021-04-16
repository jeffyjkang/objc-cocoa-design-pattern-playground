//
//  PersonController.h
//  Cocoa Design Pattern Playground
//
//  Created by Jeff Kang on 4/15/21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol PersonControllerDelegate;
//@class PersonController;

@interface PersonController : NSObject

// static let shared = PersonContoller()
+ (instancetype)sharedPersonController;
// @property (nonatomic, class, readonly) PersonController *sharedPersonController;

@property (nonatomic, weak) id<PersonControllerDelegate> delegate;

@end

@protocol PersonControllerDelegate <NSObject>

//@required

@optional

- (void)personController:(PersonController *)personController didHireNewPerson:(id)person;

@end

NS_ASSUME_NONNULL_END
