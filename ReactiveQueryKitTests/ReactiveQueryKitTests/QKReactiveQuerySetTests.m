//
//  QKReactiveQuerySetTests.m
//  ReactiveQueryKitTests
//
//  Created by Kyle Fuller on 09/09/2014.
//
//

#import "ReactiveQueryKitTests.h"

@interface QKReactiveQuerySetTests : XCTestCase

@property (nonatomic, strong) NSManagedObjectContext *context;
@property (nonatomic, strong) QKQuerySet *queryset;
@property (nonatomic, strong) Person *kyle;

@end

@implementation QKReactiveQuerySetTests

- (void)setUp {
    [super setUp];

    self.context = rqk_testManagedObjectContext();
    self.kyle = [Person createInManagedobjectContext:self.context];
    self.kyle.name = @"Kyle";
    [self.context save:nil];

    self.queryset = [[Person querySetInManagedObjectContext:self.context] orderBy:@[[Person name].ascending]];
}

#pragma mark - Objects

- (void)testObjectsSignalEmitsObjectsInitially {
    RACSignal *signal = [[self.queryset objects] take:1];

    expect(signal).to.completeSending(@[@[self.kyle]]);
}

- (void)testObjectsSignalEmitsObjectsWhenChanged {
    RACSignal *signal = [[self.queryset objects] take:2];

    Person *katie = [[Person alloc] initWithEntity:self.queryset.entityDescription insertIntoManagedObjectContext:nil];
    katie.name = @"Katie";

    dispatch_async(dispatch_get_main_queue(), ^{
        [self.context insertObject:katie];
    });

    expect(signal).will.completeSending(@[@[self.kyle], @[katie, self.kyle]]);
}

#pragma mark - Count

- (void)testCountSignalEmitsCountInitially {
    RACSignal *signal = [[self.queryset count] take:1];

    expect(signal).to.completeSending(@[@1]);
}

- (void)testCountSignalEmitsCountWhenChanged {
    RACSignal *signal = [[self.queryset count] take:2];

    dispatch_async(dispatch_get_main_queue(), ^{
        [self.context deleteObject:self.kyle];
    });

    expect(signal).will.completeSending(@[@1, @0]);
}

@end
