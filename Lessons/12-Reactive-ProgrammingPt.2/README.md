<!-- Run this slideshow via the following command: -->
<!-- reveal-md README.md -w -->


<!-- .slide: class="header" -->

# Reactive Programming (Part 2 of 3)

## [Slides](https://make-school-courses.github.io/MOB-2.4-Advanced-Architectural-Patterns-in-iOS/Slides/11-Reactive-ProgrammingPt.1/README.html ':ignore')

<!-- > -->

<!-- INSTRUCTOR:
1) For Activity 1:
- solutions are inline below each exercise
2) for Activity 2:
- xxxx
-->

## Learning Objectives

By the end of this lesson, you should be able to...

1. Describe and implement basic examples of:
- Optional ways for creating **Observables**  
  - **Subjects** - A special type of Observable
  - **Schedulers**
- Key Rx **Operators** selected from the roster of operator types available in RxSwift/RxCocoa

<!--
### Part 1 - Questions from Previous Class

1. How does `distinctUntilChanged` work?

It's a variation of `Distinct`. It suppresses sequential duplicate elements emitted by an Observable sequence.

This method will emit values *only* if they are different from the previous value.

Note that in the example below, the 🐱 image was listed 3 times in a row in the middle of the sequence. But because the 🐱 at positions 4 and 5 were both preceded by the same 🐱 element, the 🐱 elements at those positions are ignored and not emitted:

```Swift
  example("distinctUntilChanged") {
      let disposeBag = DisposeBag()

      Observable.of("🐱", "🐷", "🐱", "🐱", "🐱", "🐵", "🐱")
          .distinctUntilChanged()
          .subscribe(onNext: { print($0) })
          .disposed(by: disposeBag)
  }

// OUTPUT:
🐷
🐱
🐵
🐱
```

![distinctUntilChanged](assets/distinctUntilChanged.png) </br>

*From:* </br>
http://reactivex.io/documentation/operators/distinct.html
http://introtorx.com/Content/v1.0.10621.0/05_Filtering.html#Distinct


2. What does `race` operator do?

Returns an Observable that mirrors the first source Observable to emit an item.

**TODO:** Bring up the image of the  `race` operator in the URL below and move the 1, 2, and 3 circles past the first 0 circle. Result: the sequence returned will now be 20, 40, 60...

![race](assets/race.png) </br>


https://rxmarbles.com/#race


*Definition from:* </br>
https://rxjs-dev.firebaseapp.com/api/index/function/race

> *Note: It is inconclusive, but the `race` operator may also be the same as the `amb` operator listed in the generic Rx operators.*


3. `buffertoggle` and `bufferWhen` operators?


`Buffer`
periodically gather items emitted by an Observable into bundles and emit these bundles rather than emitting the items one at a time

`buffertoggle`
Collects values from the past as an array. Starts collecting only when opening emits, and calls the closingSelector function to get an Observable that tells when to close the buffer.

`bufferWhen`
Collects values from the past as an array. When it starts collecting values, it calls a function that returns an Observable that tells when to close the buffer and restart collecting.

**TODO:** To understand these operators, experiment with their interactive Marble Diagrams...

https://rxmarbles.com/#buffer
https://rxmarbles.com/#bufferToggle
https://rxmarbles.com/#bufferWhen


*Definitions from:* </br>
http://reactivex.io/documentation/operators/buffer.html
http://reactivex.io/rxjs/class/es6/Observable.js~Observable.html#instance-method-bufferToggle
http://reactivex.io/rxjs/class/es6/Observable.js~Observable.html#instance-method-bufferWhen

> *Note: It is inconclusive so far whether or not these operators exist in RxSwift of RxCocoa.*

4. Why would there be __*retain cycles*__ with __*Observables*__?

__*Inside closures*__

> "When working with closures when you are pointing to self inside closure... a retain cycle gets created if you DON'T use `[weak/unowned self]`."

https://stackoverflow.com/questions/35003355/weak-self-in-rxswift-closures

__*DisposeBags*__
> "using a DisposeBag sometimes leads to memory leaks. Remember that every operator keeps a strong reference to dependencies used in its closure. If it is self it is also kept by the Observable. As a result, you have a retain cycle."

http://adamborek.com/memory-managment-rxswift/

-->

<!-- > -->

### Part 2 - Activity 2 from Previous Class

Last class -> Activity 2 -> Exercise 3

<!-- > -->

The three building blocks of Rx code are __*Observables,*__ __*Operators*__ and __*Schedulers.*__

Today's class will highlight key aspects of each of these core Rx building blocks...

<!-- > -->

### Observables (continued...)

**Creating Observables**

Observables come with a variety of creation operators. Each has its own set of attributes and behavioral advantages, but also its own limitations.

The following opearators  were selected to introduce you to some of the more commonly-used Observable creation operators and some readily-identifiable advantages and limitations...

<!-- > -->

1. **`create()`** &mdash; Creates a custom Observable sequence.

`create()` is the most flexible way to create a custom Observable: You can use it to *wrap* any API you want, whether synchronous or asynchronous.

And it lets you decide when to send `next`, `error` or `completed` events.

On the other hand, it is up to you to remember to close the stream (by sending the `completed` event) and to return a `Disposable`.

<!-- > -->

`create()` takes a closure &mdash; `(AnyObserver<T>) -> Disposable` &mdash; as a parameter. Inside the closure, you need to send at least one event to the Observer. It can be `next()`, `error()` or `completed()`. Usually you will send `next()` and `completed()` (one after another), or `error()` instead of `completed()`.

```Swift
example("create") {
    let disposeBag = DisposeBag()

    let myJust = { (element: String) -> Observable<String> in
        return Observable.create { observer in
            observer.on(.next(element))
            observer.on(.completed)
            return Disposables.create()
        }
    }

    myJust("🔴")
        .subscribe { print($0) }
        .disposed(by: disposeBag)
}
```

*From:* </br>
http://adamborek.com/creating-observable-create-just-deferred/

<!-- > -->

2. **`from()`** &mdash; Creates an Observable sequence from a Sequence, such as an Array, Dictionary, or Set.

- Iterables (arrays, etc.) can be thought of as a sort of synchronous Observable.
- Futures, as a sort of Observable that always emits only a single item.

By explicitly converting such objects to Observables, you allow them to interact as peers with other Observables.

<!-- > -->

Each element of an array, for example, is produced as a single emission.

```Swift
  example("from") {
      let disposeBag = DisposeBag()

      Observable.from(["🐶", "🐱", "🐭", "🐹"])
          .subscribe(onNext: { print($0) })
          .disposed(by: disposeBag)
  }
```

<!-- > -->

3. **just()**  &mdash; Creates an Observable sequence with a single element.

`just()` is just a simple operator which wraps a single value.

If you want only to transform a single value into the Observable, then `just()` is probably the most readable option to choose.

`just()` takes an argument and sends it as `next`, and then it sends `completed` right after `next`.

<!-- > -->

The difference between this operator and `create()` is that `just()` emits *the whole array* as one emission.

```Swift
  example("just") {
      let disposeBag = DisposeBag()

      Observable.just("🔴")
          .subscribe { event in
              print(event)
          }
          .disposed(by: disposeBag)
  }
```

<!-- > -->

4. **`error()`** &mdash; Creates an Observable sequence that emits no items and immediately terminates with an error.

This works similar to `just()` but creates an Observable with a given error.

```Swift
  example("error") {
      let disposeBag = DisposeBag()

      Observable<Int>.error(TestError.test)
          .subscribe { print($0) }
          .disposed(by: disposeBag)
  }
```

*From:* </br>
`Rx.playground` in RxSwift library

<!-- > -->

**Other Ways to Create Observables**

By no means complete, here are a few other Observable creation operators which may come in handy...

1. `just()` has a few additional siblings:

- `empty()` – returns an Observable which caries only a completed event
- `never()` – returns an Observable which never sends events to its observers

These are useful for testing purposes, and sometimes also for combining with other Observables or as parameters to operators that expect other Observables as parameters.

Operators like `just`, `error`, `empty` or `never` might sometimes be enough to create an Observable you need, and they don’t require that you write a lot of boilerplate code.

<!-- > -->

2. `generate`  &mdash; Creates an Observable sequence that generates values for as long as the provided condition evaluates to true.

<!-- > -->

3. `repeatElement`  &mdash; Creates an Observable sequence that emits the given element indefinitely.

<!-- > -->

4. `doOn`  &mdash; Invokes a side-effect action for each emitted event and returns (passes through) the original event.

<!-- > -->

5. `range`  &mdash; Creates an Observable sequence that emits a range of sequential integers and then terminates.

<!-- > -->

6. `of()` &mdash; Creates an Observable sequence with a fixed number of elements. (Similar to `from()`)

*From:* </br>
- http://adamborek.com/creating-observable-create-just-deferred/ </br>
- `Rx.playground` in RxSwift library

<!-- > -->

## In Class Activity I (10 min)

1. Convert the array in the following code to an Observable:

```Swift
  let numbers = [1,2,3,4,5]

  //TODO: Create Observable here..

  source.subscribe {
      print($0)
  }

/*
OUTPUT:
next(1)
next(2)
next(3)
next(4)
next(5)
completed
*/
```

<!-- SOLUTION TO EX 1:
```Swift
let numbers = [1,2,3,4,5]

let source = Observable.from(numbers)

source.subscribe {
    print($0)
}
``` -->

<!-- > -->

2. Complete the code below that creates an Observable from scratch:

> **HINT:** For clues, see requirements for the `create()` operator in its description above.

```Swift
let source : Observable<Int> = Observable.create { observer in

           for i in 1...5 {
               // TODO: iterate through the range, processing each element in the Observable
           }
           // TODO: process completion of Observable

           return Disposables.create {
               print("disposed")
           }
       }
       source.subscribe {
           print($0)
       }

/* OUTPUT:
next(1)
next(2)
next(3)
next(4)
next(5)
completed
disposed
*/
```

<!-- SOLUTION TO EX 2:
```Swift
let source : Observable<Int> = Observable.create { observer in

           for i in 1...5 {
               observer.on(.next(i))
           }
           observer.on(.completed)

           return Disposables.create {
               print("disposed")
           }
       }
       source.subscribe {
           print($0)
       }

/* OUTPUT:
next(1)
next(2)
next(3)
next(4)
next(5)
completed
disposed
*/
```
-->

<!-- > -->

### Subject

<!-- TODO: start with stating it is a Hot, then describe.  -->

<!-- subject is a Hot Observable -->

A special type in RxSwift, a **Subject** is a sort of bridge or proxy that can behave as both of these:
- An __*Observable sequence*__
- An __*Observer*__

As an Observer, it can subscribe to one or more Observables.

And as an Observable, it can pass through the items it observes by reemitting them, and it can add new elements that can be emitted to all subscribers.

<!-- > -->

Subject does not call `onCompleted()` until it is unsubscribed/deregistered (i.e., until the `deinit()` of `DisposeBag` or the `dispose()` method is explicitly called.)

<!-- > -->

#### Three Main Types

There are three primary Subject types in RxSwift, each with unique characteristics that can be useful in different scenarios:
- PublishSubject
- BehaviorSubject
- ReplaySubject

> Other emerging Subject types worth knowing include: AsyncSubject, PublishRelay and BehaviorRelay.

<!-- > -->

1. **PublishSubject** &mdash; Subscriber of this Subject will only receive *new* events that are emitted *after* a subscription.

A PublishSubject starts empty, and only emits new elements (`next` events) to its subscribers; in other words, elements added to a PublishSubject *before* a subscriber subscribes will not be received by that subscriber.

<!-- > -->

> Note: The concept of emitting previous `next` events to new subscribers is called __*replaying,*__ and publish subjects __*DO NOT replay.*__

```Swift
  class PublishSubjectExample {
  	let disposeBag = DisposeBag()

  	func publishSubject() {
  		let title = PublishSubject<String>()
  		title.onNext("Before Subscribe")

  		title.subscribe(onNext: {
  			print($0)
  		}).disposed(by: disposeBag)

  		title.onNext("After Subscribe")
  	}
  }


```

<!--
/* Output:
After Subscribe
*/

-->

<!-- > -->

2. **BehaviorSubject** &mdash; A subscriber of this Subject will receive the last event emitted before subscription and all the event emitted after the subscription.

Broadcasts *new* events to *all* subscribers, and the *most recent* (or initial) value to *new* subscribers.

It starts with an initial value and __*replays*__ it or the latest element to *new* subscribers.

<!-- > -->

> This example demonstrate how to unsubscribe explicitly by calling `dispose()` (as opposed to using `DisposeBag`).

```Swift
  class BehaviorSubjectExample {

  	func behaviorSubject() {
  		let subtitle = BehaviorSubject<String>(value: "InitialValue")

  		let subscribedTitle = subtitle.subscribe(onNext: { (subtitle) in
  			print(subtitle)
  		}, onError: { (error) in
  			print(error)
  		}, onCompleted: {
  			print("Completed")
  		}, onDisposed: {
  			print("Disposed")
  		})

  		subtitle.onNext("UpdatedValue")
  		subscribedTitle.dispose()
  		subtitle.onNext("FinalValue - Won't get it!!")
  	}
  }

```


<!--
/* Output:
InitialValue
UpdatedValue
Disposed*/
-->

<!-- > -->

3. **ReplaySubject** &mdash; As it name states, it allows us to replay the earlier events and will be received on the initial subscription. We can decide, how many previous events will be replayed/cached/stacked.

Initialized with a buffer size and will maintain a buffer of elements up to that size and __*replay*__ it to new subscribers

Broadcasts new events to *all* subscribers, and the specified `bufferSize` number of previous events to *new* subscribers.

<!-- > -->

```Swift
  class ReplaySubjectExample {
  	let disposeBag = DisposeBag()

  	func replaySubject() {
  		let chatStack = ReplaySubject<String>.create(bufferSize: 3)

  		chatStack.onNext("hello")
  		chatStack.onNext("world")
  		chatStack.onNext("!!!")
  		chatStack.onNext("you will not recieve hello :)")
  		chatStack.subscribe(onNext: { value in
  				print(value)
  		}, onError: { error in
  			print(error)
  		} , onCompleted: {
  			print("completed")
  		}, onDisposed: {
  			print("disposed")
  		}).disposed(by: disposeBag)

  	}
  }

```

<!--
  /* Output:
  world
  !!!
  you will not receive hello :)
  */
  -->

<!-- > -->

- What's missing in these previous examples?

<!-- > -->

A `Completed` event. PublishSubject, ReplaySubject, and BehaviorSubject __*do not automatically*__ emit `Completed` events when they are about to be disposed of.

- These examples introduce the use of the `onNext(_:)` convenience method, equivalent to `on(.next(_:)`, which causes a new `Next` event to be emitted to subscribers with the provided element.

There are also `onError(_:)` and `onCompleted()` convenience methods, equivalent to `on(.error(_:))` and `on(.completed)`, respectively.

*From:* </br>
- https://codeburst.io/rxswift-reactive-thinking-part-2-efb209237e6e </br>
- `Rx.playground` in RxSwift library


<!-- TODO: Add the examples of each of the 4 from Rx.playground -->

<!-- > -->

## Schedulers

If you want to introduce __*multithreading*__ into your cascade of Observable operators, you can do so by instructing those operators (or particular Observables) to operate on specific __*Schedulers.*__

Schedulers abstract away the mechanism for performing work.

To summarize, a scheduler is a context where a process takes place. This context can be a thread, a dispatch queue or similar entities, or even an Operation used inside the OperationQueueScheduler.

<!-- > -->

<!-- Different mechanisms for performing work include the current thread, dispatch queues, operation queues, new threads, thread pools, and run loops. -->

### Two Main Operators

By __*default,*__ an Observable and the chain of operators that you apply to it will do its work, and will notify its observers, on the same thread on which its `subscribe()` method is called.

<!-- > -->

There are two main operators that work with schedulers:

- `observeOn()` &mdash; Specifies a different Scheduler that the Observable will use to send notifications to its observers. For this reason, you may call ObserveOn multiple times at various points during the chain of Observable operators in order to change on which threads certain of those operators operate.

<!-- > -->


- `subscribeOn()` &mdash; Designates which thread the Observable will begin operating on, no matter at what point in the chain of operators that operator is called. It changes the default behavior by specifying a different Scheduler on which the Observable should operate.

<!-- > -->

If you want to perform work on a different scheduler, just use the `observeOn(scheduler)` operator.

You usually use `observeOn()` a lot more often than `subscribeOn()`.

<!-- TODO: show example of observeOn -- from Rx.playground -->

<!--

### Serial vs Concurrent Schedulers

Since schedulers can really be anything, and all operators that transform sequences need to preserve additional [implicit guarantees](GettingStarted.md#implicit-observable-guarantees), it is important what kind of schedulers are you creating.

In case the scheduler is concurrent, Rx's `observeOn` and `subscribeOn` operators will make sure everything works perfectly.

If you use some scheduler that Rx can prove is *serial,* it will be able to perform additional optimizations.

-->

<!-- > -->

### Builtin schedulers

Schedulers are the Rx equivalent of dispatch queues — but more powerful (for developers) and much easier to use.

RxSwift comes with a number of predefined schedulers, which cover 99% of use cases and hopefully means you will never have to go about creating your own schedulers.

> You can also create your own __*custom schedulers.*__

<!-- > -->

### &mdash; MainScheduler (Serial scheduler)

MainScheduler sits on top of the **main thread**.

MainScheduler processes changes on the user interface and performs other high-priority tasks.

In case `schedule` methods are called from main thread, it will perform the action immediately without scheduling.

<!-- > -->

As a general practice when developing applications on iOS, long-running tasks should not be performed using this scheduler; avoid things like server requests or other heavy tasks.

If your code creates side effects that update the UI, you must switch to the MainScheduler to guarantee those updates make it to the screen.

<!-- > -->

### &mdash; CurrentThreadScheduler (Serial scheduler)

Schedules units of work on the current thread.

This is the __*default scheduler*__ for operators that generate elements.

<!-- > -->

### &mdash; SerialDispatchQueueScheduler (Serial scheduler)

Abstracts the work that needs to be performed on a specific `dispatch_queue_t`. It will make sure that even if a concurrent dispatch queue is passed, it's transformed into a serial one.

Serial schedulers enable certain optimizations for `observeOn`.

The main scheduler is an instance of `SerialDispatchQueueScheduler`.

<!-- > -->

### &mdash; ConcurrentDispatchQueueScheduler (Concurrent scheduler)

Abstracts the work that needs to be performed on a specific `dispatch_queue_t`. You can also pass a serial dispatch queue, it shouldn't cause any problems.

This scheduler is suitable when some work needs to be performed in the __*background.*__

<!-- > -->

### &mdash; OperationQueueScheduler (Concurrent scheduler)

Abstracts the work that needs to be performed on a specific `NSOperationQueue`.

Suitable for cases when there is some bigger chunk of work that needs to be performed in the __*background*__ and you want to fine tune concurrent processing using `maxConcurrentOperationCount`.

<!-- > -->

<!--

#### Example:

Here is a simple example &mdash; in **pseudocode** &mdash; of how how to call `observeOn()` and `subscribeOn()` to switch between 2 schedulers:

```Swift
  catObservable // 1
      .breatheFreshAir() // 2
      .observeOn(MainRouteScheduler.instance) // 3
      .subscribeOn(TwoLaneFreewayScheduler.instance) // 4
      .subscribeNext { cat in // 5
          if cat is Ethan {
              hug(cat)
          }
      }
      .addDisposableTo(disposeBag)
```    


__*Step-by-step:*__
1. We subscribe to Cat observable, which emits Cat signals.
2. We should be on the same scheduler we were before the subscription (which is the default behavior of Rx).
3. Switch the scheduler to the `MainRouteScheduler`. Now every operation below this one will be scheduled on `MainRouteScheduler` (of course if we don’t change the scheduler again later in the pipeline).
4. Now we say that we start the chain on `TwoLaneFreewayScheduler`. So `breatheFreshAir()` will be scheduled on `TwoLaneFreewayScheduler`, and then the scheduler is changed again using `observeOn()`.
5. `subscribeNext()` gets scheduled by `MainRouteScheduler`. If we didn’t add the `observeOn()` before, it would get scheduled by `TwoLaneFreewayScheduler`.

*From:* </br>
https://www.thedroidsonroids.com/blog/rxswift-examples-4-multithreading/

-->

<!-- TODO: SHOW EXAMPLE -->

<!-- TODO: briefly spell out each type -->


<!-- compare Notifications to Observables? -->
<!--

#### Comparing Observables with iOS Notifications -->

<!-- TODO: both use Observer pattern -->

<!-- THIS needs the same example as an Observable
- also, most examples converting notifications have MainScheduler -->

<!--
, you may be familiar with NotificationCenter; it broadcasts notifications to observers, which are different than RxSwift Observables. Here’s an example of an observer of the UIKeyboardDidChangeFrame notification, with a handler as a trailing closure:


Subscribing to an RxSwift observable is fairly similar; you call observing an observable subscribing to it. So instead of addObserver(), you use subscribe(). Unlike NotificationCenter, where developers typically use only its .default singleton instance, each observable in Rx is different.


More importantly, an observable won’t send events, or perform any work, until it has a
subscriber.
Remember that an observable is really a sequence definition; subscribing to an observable is really more like calling next() on an Iterator in the Swift standard library. -->

<!-- > -->

## In Class Activity II

1. Complete the code below to match the output:

```Swift
  example("PublishSubject") {
      let disposeBag = DisposeBag()
      let subject = PublishSubject<String>()

      subject.addObserver("1").disposed(by: disposeBag)
      subject.onNext("🐶")
      subject.onNext("🐱")

      subject.addObserver("2").disposed(by: disposeBag)
      subject.onNext("🅰️")
      subject.onNext("🅱️")

        //TODO: Add a 3rd observer
  }

  /*OUTPUT:
  Subscription: 3 Event: next(🍐)
  Subscription: 1 Event: next(🍊)
  Subscription: 2 Event: next(🍊)
  Subscription: 3 Event: next(🍊
    */
  ```

<!--
  SOLUTION TO EX 1:
```Swift
  example("PublishSubject") {
      let disposeBag = DisposeBag()
      let subject = PublishSubject<String>()

      subject.addObserver("1").disposed(by: disposeBag)
      subject.onNext("🐶")
      subject.onNext("🐱")

      subject.addObserver("2").disposed(by: disposeBag)
      subject.onNext("🅰️")
      subject.onNext("🅱️")

      subject.addObserver("3").disposed(by: disposeBag)
      subject.onNext("🍐")
      subject.onNext("🍊")
  }

  /*OUTPUT:
  Subscription: 3 Event: next(🍐)
  Subscription: 1 Event: next(🍊)
  Subscription: 2 Event: next(🍊)
  Subscription: 3 Event: next(🍊
    */
  ``` -->


<!-- > -->

2. In the incomplete code below, complete the line `let subject = ???` in the following code in **3 different ways** to match 3 different expected outputs:

- For `PublishSubject`, replace the line with:

```Swift
  let subject = PublishSubject<String>()
```
... and its output should be:

```Swift
  After Subscribe
```

- For `ReplaySubject`, replace the line with:

```Swift
 let subject = ReplaySubject<String>.create(bufferSize: 4)
```
... and its output should be:

```Swift
  Before Subscribe Value First
  Before Subscribe Value Second
  Before Subscribe Value Third
  After Subscribe
```

- For `BehaviorSubject`, replace the line with:

```Swift
  let subject = BehaviorSubject<String>(value: "Initial value")

```
... and its output should be:

```Swift
  Before Subscribe Value Third
  After Subscribe
```

**Incomplete Code:**
```swift
  let subject = ???

  let observable : Observable<String> = subject
  subject.onNext("Before Subscribe Value First")
  subject.onNext("Before Subscribe Value Second")
  subject.onNext("Before Subscribe Value Third")
  observable.subscribe(onNext: { text in
      print(text)

  }).disposed(by: disposeBag)
  subject.onNext("After Subscribe")
```

*from:* </br>
https://medium.com/@arnavgupta180/rxswift-subjects-and-variables-83c8b2ae1f5

<!-- > -->

<!-- TODO: get exercises for subject  -->

<!-- TODO: from the Rx.playground? -->

<!-- TODO: from the simple Ray W example? see my Subject notes doc -->

<!-- TODO: convert a Notification to an Observable? -->

<!-- TODO: convert a dictionary to an Observable?
- with debugging options ??-->

<!-- > -->

## After Class

1. Research:

- Single, Completable, and Maybe (special types of Observables, aka "traits")
- Hot & Cold Observables
- Review Rx Operators, especially: </br>
&nbsp;&nbsp;&nbsp; - the 4 types of Operators </br>
&nbsp;&nbsp;&nbsp; - scan </br>
&nbsp;&nbsp;&nbsp; - flatMap and flatMapLatest </br>
&nbsp;&nbsp;&nbsp; - zip </br>
&nbsp;&nbsp;&nbsp; - toArray </br>
&nbsp;&nbsp;&nbsp; - concat </br>
&nbsp;&nbsp;&nbsp; - takeUntil </br>
&nbsp;&nbsp;&nbsp; - combineLatest </br>

> __*TIP:*__ You an find some info on these in the `Rx.playground` that comes in the RxSwift library. That's a good starting point, but these are limited and basic. Spend some time finding other examples...

2. RxSwift Debugging

RxSwift comes with two ways to help debug Rx code:
- The `debug()` operator &mdash; Prints out all subscriptions, events, and disposals.
- `RxSwift.Resources.total` &mdash; Provides a count of all Rx resource allocations, which is useful for detecting leaks during development.

Using the Xcode debugger alone is useful, but usually using `debug` operator will be more efficient. `debug` operator will print out all events to standard output and you can add also label those events.

`debug` acts like a probe. Here is an example of using it:

```swift
let subscription = myInterval(.milliseconds(100))
    .debug("my probe")
    .map { e in
        return "This is simply \(e)"
    }
    .subscribe(onNext: { n in
        print(n)
    })

Thread.sleepForTimeInterval(0.5)

subscription.dispose()
```

will print

```
[my probe] subscribed
Subscribed
[my probe] -> Event next(Box(0))
This is simply 0
[my probe] -> Event next(Box(1))
This is simply 1
[my probe] -> Event next(Box(2))
This is simply 2
[my probe] -> Event next(Box(3))
This is simply 3
[my probe] -> Event next(Box(4))
This is simply 4
[my probe] dispose
Disposed
```

__*Challenges 1:*__ For `debug()` operator &mdash; Experiment with the example given here:

https://www.caseyliss.com/2016/12/16/rxswift-primer-part-2

...and/or learn what `debug()` does by adding it to some of the RxSwift code you've already worked with in these last 2 classes.

__*Challenges 2:*__ For `RxSwift.Resources.total` &mdash; `RxSwift.Resources.total` is not enabled by default, and should generally not be enabled in Release builds.

However, it is easy to practice using it..

**TODO:**
- In the `RxExample` project in the RxSwift library, look for the `Debugging_Operators` playground. Find and follow the "...instructions on how to enable..." `RxSwift.Resources.total` and enable it in the RxSwift project you've been working with in class.
- Add some Observable code and examine the output.
- Find or create some Observable code which has a `weak` self inside a closure. Remove the `weak` modifier to see if you can create and detect a memory leak.

> Don't forget to disable `RxSwift.Resources.total` in your project when you are done using it...


<!-- TODO: get an exercise for Schedulers; 1st, review it in rx.playground, then do an exercise (convert something?) -->

<!-- < TODO: exercise on debugging with RxSwift.Resources.total -->


<!-- > -->

## Additional Resources

1. [Reactor_pattern - wikipedia](https://en.wikipedia.org/wiki/Reactor_pattern)
2. [RxSwiftExt](https://github.com/RxSwiftCommunity/RxSwiftExt)
3. [RxSwiftCommunity](https://github.com/RxSwiftCommunity)
4. [community.rxswift.org](community.rxswift.org)
5. [Rx Resources Repo](https://github.com/DroidsOnRoids/RxSwiftExamples)
6. [RxSwift repo](https://github.com/ReactiveX/RxSwift)
