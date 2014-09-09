//
//  NSManagedObjectContext+RAC.m
//  QueryKit
//
//  Created by Kyle Fuller on 09/09/2014.
//
//

#import "NSManagedObjectContext+RAC.h"

@implementation NSManagedObjectContext (ReactiveQueryKit)

- (RACSignal *)rqk_objectsDidChangeSignal {
    return [[[NSNotificationCenter defaultCenter] rac_addObserverForName:NSManagedObjectContextObjectsDidChangeNotification object:self] takeUntil:self.rac_willDeallocSignal];
}

- (RACSignal *)rqk_willSaveSignal {
    return [[[NSNotificationCenter defaultCenter] rac_addObserverForName:NSManagedObjectContextWillSaveNotification object:self] takeUntil:self.rac_willDeallocSignal];
}

- (RACSignal *)rqk_didSaveSignal {
    return [[[NSNotificationCenter defaultCenter] rac_addObserverForName:NSManagedObjectContextDidSaveNotification object:self] takeUntil:self.rac_willDeallocSignal];
}

@end
