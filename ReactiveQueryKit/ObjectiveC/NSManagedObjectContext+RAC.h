//
//  NSManagedObjectContext+RAC.h
//  QueryKit
//
//  Created by Kyle Fuller on 09/09/2014.
//
//

#import <CoreData/CoreData.h>
#import <ReactiveCocoa/ReactiveCocoa.h>

/// Extensions to QKQuerySet providing ReactiveCocoa signals
@interface NSManagedObjectContext (ReactiveQueryKit)

/// Returns a signal that sends the NSNotification for NSManagedObjectContextObjectsDidChangeNotification in the current context
- (RACSignal *)rqk_objectsDidChangeSignal;

/// Returns a signal that sends the NSNotification for NSManagedObjectContextWillSaveNotification in the current context
- (RACSignal *)rqk_willSaveSignal;

/// Returns a signal that sends the NSNotification for NSManagedObjectContextDidSaveNotification in the current context
- (RACSignal *)rqk_didSaveSignal;

@end
