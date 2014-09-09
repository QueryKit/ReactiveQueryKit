//
//  ReactiveQueryKitTests.h
//  ReactiveQueryKitTests
//
//  Created by Kyle Fuller on 09/09/2014.
//
//

#define EXP_SHORTHAND

#import <XCTest/XCTest.h>
#import <CoreData/CoreData.h>
#import <QueryKit/QueryKit.h>
#import <ReactiveQueryKit/ReactiveQueryKit.h>
#import <Expecta/Expecta.h>
#import <Expecta+ReactiveCocoa/Expecta+ReactiveCocoa.h>

@interface Person : NSManagedObject

+ (QKAttribute *)name;

@property (nonatomic, strong) NSString *name;

+ (QKQuerySet *)querySetInManagedObjectContext:(NSManagedObjectContext *)context;
+ (instancetype)createInManagedobjectContext:(NSManagedObjectContext *)context;

@end

NSManagedObjectContext *rqk_testManagedObjectContext();
