//
//  PersonController.m
//  Cocoa Design Pattern Playground
//
//  Created by Jeff Kang on 4/15/21.
//

#import "PersonController.h"
#import "Person.h"

@implementation PersonController

+ (instancetype)sharedPersonController
{
    static PersonController *personController = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        personController = [[self alloc] initSharedInstance];
    });
    
//    if (!personController) {
//        personController = [[self alloc] init];
//    }
    
    return personController;
}

- (instancetype)initSharedInstance
{
    if (self = [super init]) {
        // configure the shared instance any way we like
        
        [NSTimer scheduledTimerWithTimeInterval:5
                                         target:self
                                       selector:@selector(registerNewHire:)
                                       userInfo:nil repeats:YES];
    }
    return self;
}

//- (instancetype)init
//{
//    return nil;
//}

- (void)registerNewHire:(id)sender
{
//    if ([self.delegate conformsToProtocol:@protocol(PersonControllerDelegate)])
    if ([self.delegate respondsToSelector:@selector(personController:didHireNewPerson:)])
//    [self.delegate personController:self didHireNewPerson:@"🧑‍💻"];
    [self.delegate personController:self didHireNewPerson:[[Person alloc] init]];

}

@end
