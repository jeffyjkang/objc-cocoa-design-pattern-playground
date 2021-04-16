//
//  ViewController.m
//  Cocoa Design Pattern Playground
//
//  Created by Jeff Kang on 4/15/21.
//

#import "ViewController.h"
#import "PersonController.h"

@interface ViewController () <PersonControllerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    PersonController *sharedInstanceA = PersonController.sharedPersonController;
    NSLog(@"Person Controller A: %@", sharedInstanceA);
    
    PersonController *sharedInstanceB = PersonController.sharedPersonController;
    NSLog(@"Person Controller B: %@", sharedInstanceB);
    
    PersonController.sharedPersonController.delegate = self;
}

// MARK: - PersonControllerDelegate

- (void)personController:(PersonController *)personController didHireNewPerson:(id)person
{
    if ([person isKindOfClass:NSString.class]) {
//        NSLog(@"%@ is a string! Its length is: %lu", person, (unsigned long)[person length]);
        NSLog(@"%@ is a string! Its length is: %lu", person, (unsigned long)((NSString *)person).length);
    }
    
    if ([person isMemberOfClass:NSString.class]) {
        NSLog(@"%@ is a member of NSString!", person);
    } else {
        NSLog(@"%@ is actually %@!!", person, NSStringFromClass([person class]));
    }
    
    NSLog(@"We detected a new hire! %@", person);
}

@end
