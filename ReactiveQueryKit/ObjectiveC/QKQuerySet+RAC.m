//
//  QKQuerySet+RAC.m
//  QueryKit
//
//  Created by Kyle Fuller on 09/09/2014.
//
//

#import "QKQuerySet+RAC.h"
#import "NSManagedObjectContext+RAC.h"

@implementation RACSignal (QKRInitialValue)

- (RACSignal *)initialValue:(id (^)(void))initialValue {
	return [RACSignal createSignal:^(id<RACSubscriber> subscriber) {
        [subscriber sendNext:initialValue()];

		return [self subscribeNext:^(id x) {
            [subscriber sendNext:x];
        } error:^(NSError *error) {
            [subscriber sendError:error];
        } completed:^{
            [subscriber sendCompleted];
        }];
	}];
}

@end

@implementation QKQuerySet (RAC)

- (RACSignal *)objects {
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        {
            NSError *error;
            NSArray *objects = [self array:&error];

            if (error) {
                [subscriber sendError:error];
                return nil;
            }

            [subscriber sendNext:objects];
        }

        __block RACDisposable *disposable = [[self.managedObjectContext rqk_objectsDidChangeSignal] subscribeNext:^(id x) {
            NSError *error;
            NSArray *objects = [[self copy] array:&error];

            if (error) {
                [subscriber sendError:error];
                [disposable dispose];
            } else {
                [subscriber sendNext:objects];
            }
        } error:^(NSError *error) {
            [subscriber sendError:error];
        } completed:^{
            [subscriber sendCompleted];
        }];

        return disposable;
    }];
}

- (RACSignal *)count {
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        {
            NSError *error;
            NSUInteger count = [self count:&error];

            if (error) {
                [subscriber sendError:error];
                return nil;
            }

            [subscriber sendNext:@(count)];
        }

        __block RACDisposable *disposable = [[self.managedObjectContext rqk_objectsDidChangeSignal] subscribeNext:^(id x) {
            NSError *error;
            NSUInteger count = [self count:&error];

            if (error) {
                [subscriber sendError:error];
                [disposable dispose];
            } else {
                [subscriber sendNext:@(count)];
            }
        } error:^(NSError *error) {
            [subscriber sendError:error];
        } completed:^{
            [subscriber sendCompleted];
        }];

        return disposable;
    }];
}

@end
