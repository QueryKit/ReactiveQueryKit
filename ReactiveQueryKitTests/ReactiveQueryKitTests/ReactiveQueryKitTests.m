//
//  ReactiveQueryKitTests.m
//  ReactiveQueryKitTests
//
//  Created by Kyle Fuller on 09/09/2014.
//
//

#import "ReactiveQueryKitTests.h"

@implementation Person

@dynamic name;

+ (QKAttribute *)name {
    return [[QKAttribute alloc] initWithName:@"name"];
}

+ (QKQuerySet *)querySetInManagedObjectContext:(NSManagedObjectContext *)context {
    NSEntityDescription *entityDescription = [NSEntityDescription entityForName:@"Person" inManagedObjectContext:context];
    return [[QKQuerySet alloc] initWithManagedObjectContext:context entityDescription:entityDescription];
}

+ (instancetype)createInManagedobjectContext:(NSManagedObjectContext *)context {
    NSEntityDescription *entityDescription = [NSEntityDescription entityForName:@"Person" inManagedObjectContext:context];
    return [[self alloc] initWithEntity:entityDescription insertIntoManagedObjectContext:context];
}

@end

NSManagedObjectModel *rqk_testManagedObjectModel() {
    NSEntityDescription *personEntity = [[NSEntityDescription alloc] init];
    personEntity.name = NSStringFromClass([Person class]);
    personEntity.managedObjectClassName = NSStringFromClass([Person class]);

    NSAttributeDescription *personNameAttribute = [[NSAttributeDescription alloc] init];
    personNameAttribute.name = NSStringFromSelector(@selector(name));
    personNameAttribute.attributeType = NSStringAttributeType;
    personNameAttribute.optional = NO;
    personEntity.properties = @[personNameAttribute];

    NSManagedObjectModel *model = [[NSManagedObjectModel alloc] init];
    model.entities = @[personEntity];

    return model;
}

NSManagedObjectContext *rqk_testManagedObjectContext() {
    NSManagedObjectModel *model = rqk_testManagedObjectModel();
    NSPersistentStoreCoordinator *persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:model];
    [persistentStoreCoordinator addPersistentStoreWithType:NSInMemoryStoreType configuration:nil URL:nil options:nil error:nil];

    NSManagedObjectContext *context = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
    context.persistentStoreCoordinator = persistentStoreCoordinator;

    return context;
}
