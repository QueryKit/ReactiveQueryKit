//
//  QKQuerySet+RAC.h
//  QueryKit
//
//  Created by Kyle Fuller on 09/09/2014.
//
//

#import <QueryKit/QueryKit.h>
#import <ReactiveCocoa/ReactiveCocoa.h>

/// Extensions to QKQuerySet providing ReactiveCocoa signals
@interface QKQuerySet (RAC)

/** Performs a query for all objects matching the set predicate ordered by any set sort descriptors.
Emits a value include an array of all objects when the managed object context is changed.
 */
- (RACSignal /* NSArray */ *)objects;

/** Performs a query for the count of all objects matching the set predicate.
 Emits an NSNumber containing the amount of objects matching the predicate and updates when the managed object context is changed.
 */
- (RACSignal /* NSNumber */ *)count;

@end
