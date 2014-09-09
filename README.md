ReactiveQueryKit
================

ReactiveCocoa extensions for QueryKit. Currently it only supports the
Objective-C variant of QueryKit and ReactiveCocoa. Once ReactiveCocoa 3.0 comes
out we will implement a native Swift version using ReactiveCocoa 3.0.

## Usage

### Query Set

ReactiveQueryKit extends QueryKit and provides methods to evaluate and execute
operations as Signals.

#### Count

```objective-c
[[queryset count] subscribeNext:^(NSNumber *count) {
    NSLog(@"QuerySet count has been updated %@", count);
}];
```

#### Objects

```objective-c
[[queryset objects] subscribeNext:^(NSArray *objects) {
    NSLog(@"QuerySet objects has been updated %@", objects);
}];
```

### NSManagedObjectContext

We have also extended NSManagedObjectContext providing a bunch of signals.

```objective-c
@interface NSManagedObjectContext (ReactiveQueryKit)

/// Returns a signal that sends the NSNotification for
NSManagedObjectContextObjectsDidChangeNotification in the current context
- (RACSignal *)rqk_objectsDidChangeSignal;

/// Returns a signal that sends the NSNotification for
NSManagedObjectContextWillSaveNotification in the current context
- (RACSignal *)rqk_willSaveSignal;

/// Returns a signal that sends the NSNotification for
NSManagedObjectContextDidSaveNotification in the current context
- (RACSignal *)rqk_didSaveSignal;

@end
```

## Installation

[CocoaPods](http://cocoapods.org) is the recommended way to add
ReactiveQueryKit to your project.

```ruby
pod 'ReactiveQueryKit', :git => 'https://github.com/QueryKit/ReactiveQueryKit'
```

## License

QueryKit is released under the BSD license. See [LICENSE](LICENSE).

