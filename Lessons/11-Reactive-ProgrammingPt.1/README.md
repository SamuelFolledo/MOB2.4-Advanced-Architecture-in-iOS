<!-- Run this slideshow via the following command: -->
<!-- reveal-md README.md -w -->


<!-- .slide: class="header" -->

# Reactive Programming (Part 1 of 3)

## [Slides](https://make-school-courses.github.io/MOB-2.4-Advanced-Architectural-Patterns-in-iOS/Slides/11-Reactive-ProgrammingPt.1/README.html ':ignore')


<!-- INSTRUCTOR:
1) For Activity 1:
- solutions are hidden (as graphics) below each exercise
3) for Activity 2:
- xxxx
-->

<!-- > -->

## Learning Objectives

By the end of this lesson, you should be able to...

1. Describe:
  - Reactive programming, ReactiveX (Rx), RxSwift & RxCocoa </br>
  - How to read Marble diagrams
  - Basic Building blocks of Rx
  - Basic operators
  - Key concepts: Event Streams, Sequences, Observables (and their relationships), Subscribing
  - The Lifecycle of Observables
2. Implement basic examples of Observables

<!-- > -->

## Reactive Programming

Reactive Programming can be thought of as the practice of programming with **asynchronous** data streams, or __*event streams.*__

<!-- > -->

### Initial Concepts

In Reactive Programming, an observer *subscribes* to __*an Observable.*__

Observables produce events over a period of time.

The process of Observables producing events over a time is referred to as __*emitting.*__

An observer can react to whatever item or sequence of items the Observable emits.

<!-- > -->

__*Operators*__ are __*the building blocks*__ of Reactive Programming, which you can use to:

- transform
- process
- and react to events emitted by observables.

<!-- > -->

### Event Streams

An event stream is a **sequence of events** happening over time.

An **asynchronous data stream** is a stream of data where values are *emitted*, one after another, with a delay between them, and without blocking program flow to wait for results.

And because the stream is asynchronous, the data emitted can appear anywhere in time.

<!-- > -->

### Modeling Event Streams with Marble Diagrams

The common way of modeling asynchronous streams in Rx is to place the emitted values on a time axis in what is called a **Marble Diagram**

These are interactive diagrams that show how Rx operators work with observable sequences over time.

<!-- > -->

Here, our diagram shows a simple description of a hypothetical event stream, with events represented by colored bubbles drawn at intermittent time intervals:

![Marble_diagram_breakdown](assets/Marble_diagram_breakdown.png) </br>

<!-- > -->

In a Marble Diagram, the left-to-right arrow represents time, and the numbered circles represent elements of a sequence, which are just values plotted on the timeline.

In the last diagram, pay particular attention to these symbols:
- The **Error** symbol
- The **Event Stream Complete** symbol  

<!-- > -->

<!--
### Comparing Arrays to Event Streams

Arrays are sequences in *space*; all items in an array exist in memory.

Event streams, on the other hand, may not exist in space. Events might only occur *over time,* and you may not know all the events that will or can happen, or even when they will occur.

If we consider the scenario in which `eventStreamArray` below started as an empty array (i.e., didn't exist in memory), and each element was populated one-at-a-time over a period of time, then the array will act like an event stream where event  1 (populating `eventStreamArray` with the first element, 2) might happen at the 1st second, event 2 might happen at the 4th second, and so on...

```Swift
  var eventStreamArray = [2, 30, 22, 5, 60, 1]
```

**Diagramming the `filter()` Operator** </br>
One of the most commonly-used Rx operators, `filter()` only emits items from an Observable if a specific condition is met.

In this example, the filtered condition applied to the `eventStreamArray` above is to emit into the resulting stream only those items whose values are `greater than 10`:

![filter_diag](assets/filter_diag.png)

-->

## In Class Activity

Instructions [here]()

<!-- > -->

## ReactiveX, RxSwift & RxCocoa

ReactiveX (Rx) is a combination of the best ideas from the **Observer pattern,** the **Iterator pattern,** and **Functional Programming.**

It is a library for composing **asynchronous** and **event-based** programs by using **observable sequences**.

<!-- > -->

It extends the observer pattern to support **sequences** of data and/or events, and it adds **operators** which allow you to compose sequences together declaratively while abstracting away concerns regarding concurrency.

<!-- > -->
<!--

### Brief History

Around 2009, a team at Microsoft released a new client and server side framework called Reactive Extensions for .NET that offered a solution to the problems of real-time, scalable, asynchronous app development.

It soon became a built-in core library in the .NET framework.

In 2012, it became an open-source component permitting other languages and platforms to reimplement the same functionality.

Today, it is a cross-platform standard implemented in RxJS, Rx.NET, RxScala, RxSwift, and more...

 > http://reactivex.io is the central repository of documentation about Rx’s operators and core classes.
-->

### RxSwift & RxCocoa

**RxSwift** also works with all the concepts you’ve covered so far: It tackles mutable state, it allows you to compose event sequences and improves on architectural concepts such as code isolation, reusability and decouplings.

You could think of RxSwift as the "glue" between traditionally **imperative** Cocoa Touch code and **functional** code.

It allows you to react to events by using __*immutable*__ code definitions to process __*asynchronous*__ pieces of input in a __*deterministic*__ manner.

<!-- > -->

**RxCocoa** is a standalone library that comes bundled with RxSwift.

It allows you to use many prebuilt features to integrate better with UIKit and Cocoa Touch.

RxCocoa will provide you with out-of-the-box classes to do reactive networking, react to user interactions, bind data models to UI controls, and more.

<!-- > -->

### Benefits

The [Rx Documentation](http://reactivex.io) states these as the general benefits of **ReactiveX:**

- **Functional** &mdash; Avoid intricate stateful programs
- **Less is more** &mdash; ReactiveX's operators often reduce lines of code.
- **Async error handling** &mdash;
- **Concurrency made easy** &mdash; Observables and Schedulers in ReactiveX allow the programmer to abstract away low-level threading, synchronization, and concurrency issues.

<!-- > -->

The benefits of implementing **RxSwift** are more evident in modern mobile apps which are highly interactive and have a multitude of UI events related to data events.

The benefits of **RxSwift** include:
- Asynchrony is simplified with Declarative Code.
- Multithreading is simplified.
- Cleaner Code & Architectures

<!-- > -->

### Asynchronous

At any given moment, your iOS app might be executing any of the following asynchronous tasks:
- Reacting to button taps and gestures
- Animating the keyboard as a text field loses focus
- Downloading a large photo from the Internet
- Saving bits of data to disk
- Playing audio
- Tracking GPS location updates

And if any 2 tasks occur at the same time &mdash; as they often do &mdash; one task should not block the execution of the other.

<!-- > -->
<!--
### How Rx solves them

1. **Declarative code** &mdash; RxSwift combines some of the best aspects of imperative code and functional code to resolve challenges presented by mutable state, etc.

2. **Reactive systems**

This is an abstract term covering web or iOS apps that exhibit most or all of the following qualities:
- __*Responsive:*__ Always keep the UI up to date, representing the latest app state.
- __*Resilient:*__ Each behavior is defined in isolation and provides for flexible error recovery.
- __*Elastic:*__ The code handles varied workload, often implementing features such as lazy pull-driven data collections, event throttling, and resource sharing.
- __*Message driven:*__ Components use message-based communication for improved reusability and isolation, decoupling the lifecycle and implementation of classes. Now that you have a good understanding of the problems RxSwift helps solve and how it approaches these issues, it’s time to talk about the building blocks of Rx and how they play together.
-->

##  Basic Building blocks

- Observables
- Subscribing
- Subject
- Dispose
- DisposeBag
- Schedulers
- Operators

<!--
### More on Streams

The word asynchronous means that the data emitted can appear anywhere in time, after one second or even after two minutes, for example.

An event stream can be anything like keyboard inputs, button taps, gestures, GPS location updates, accelerometer, iBeacon, and such.

You can listen to a stream and react to it accordingly.


Event streams (a sequence of events that happen over time).

“In its basic form, it deals with event streams (a sequence of events that happen over time).

Whenever an event occurs, we react to it by doing something.

We could react to events by using for loops but in Functional Programming the transformations are done via map(), filter() and other Rx operators.”


Examples of event streams.

Examples of async event streams.
at any moment, might be doing any of the following things and more:
• Reacting to button taps and gestures
• Animating the keyboard as a text field loses focus
• Downloading a large photo from the Internet
• Saving bits of data to disk
• Playing audio -->

<!-- > -->

### Observables (aka, Sequences)

The most important thing to understand about Rx is the equivalence of the observer pattern (`Observable<Element>` sequence) and normal sequences (`Sequence`).

- Every Observable sequence is just a sequence with some special powers, the most important of its powers is that it is __*asynchronous.*__
- Event Streams are called sequences.
- The key advantage for an Observable vs Swift's `Sequence Type` is that Observable can also receive elements __*asynchronously.*__

<!-- > -->

In RxSwift, everything is a sequence or something that works with a sequence.

Arrays, Strings or Dictionaries will be converted to observable sequences in RxSwift. (In fact, you might think of an array converted to an observable sequence as simply an array with time dimension.)

You can create an observable sequence of any object that conforms to the `Sequence Protocol` from the Swift Standard Library.


<!-- Observable is an array with time dimension -->

<!-- Observable(ObservableType) is equivalent to Sequence -->
<!-- Observables produce events, the process of which is referred to as emitting, over a period of time. -->

<!-- A stream is a sequence of ongoing events ordered in time. It can emit three different things: a value (of some type), an error, or a "completed" signal. -->

<!-- > -->

#### Lifecycle of an Observable

An Observable can emit (and observers can receive) only three types of events:

A **Next** event.

An event that “carries” the latest (or "next") data value.

This is the way observers “receive” values. An Observable may emit an indefinite amount of these values, until a terminating event is emitted. 

<!-- > -->

A **Completed** event.  

This event terminates the event sequence with success.

It means the Observable completed its life cycle successfully and won’t emit additional events. 

<!-- > -->

An **Error** event.

The Observable terminates with an error and will not emit additional events.

But an Observable doesn’t do anything until it receives a subscription.

<!-- > -->

### 3 simple steps to use Rx

The following example explains the the 3 simple steps required to use Reactive programming in your application.

```Swift
Observable<String> database = Observable      //Observable. This will emit the data
                .just(new String[]{"1", "2", "3", "4"});    //Operator

 Observer<String> observer = new Observer<String>() {
           @Override
            public void onCompleted() {
                //...
            }

            @Override
            public void onError(Throwable e) {
                //...
            }

            @Override
            public void onNext(String s) {
                //...
            }
        };

database.subscribeOn(Schedulers.newThread())          //Observable runs on new background thread.
        .observeOn(AndroidSchedulers.mainThread())    //Observer will run on main UI thread.
        .subscribe(observer);                         //Subscribe the observer
```

**Step-1 Create observable that emits the data:**

`database` is an observable which emits the data. In this case, it emits strings.

`just()` is an operator, which basically emits the data provided in the argument one by one.

<!-- > -->

**Step -2 Create observer that consumes data:**

`observer` is an observer that consumes the data emitted by the database observable.

It processes the data received and also handles error inside it.

<!-- > -->

**Step-3 Manage concurrency:**

At the last step, we define our schedulers that manage the concurrency.

`subscribeOn(Schedulers.newThread())` tells the database observable to run on a `background thread.`

 `observeOn(AndroidSchedulers.mainThread())` tells observer to run on the `main thread`.

This is basic code for reactive programming.

*from:* </br>
https://medium.com/@kevalpatel2106/what-is-reactive-programming-da37c1611382

<!-- > -->

### Subscribing to Observables

Observables come with a `subscribe` operator to subscribe to events being emitted by the Observable and to perform other operations, like printing each event as it is emitted.

Here is the official documentation on the actions available to the `subscribe` operator:

```swift
Subscribes an element handler, an error handler, a completion handler and disposed handler to an observable sequence.

     - parameter onNext: Action to invoke for each element in the observable sequence.
     - parameter onError: Action to invoke upon errored termination of the observable sequence.
     - parameter onCompleted: Action to invoke upon graceful termination of the observable sequence.
     - parameter onDisposed: Action to invoke upon any type of termination of sequence (if the sequence has
     gracefully completed, errored, or if the generation is canceled by disposing subscription).
     - returns: Subscription object used to unsubscribe from the observable sequence.

    public func subscribe(onNext: ((Element) -> Void)? = nil, onError: ((Swift.Error) -> Void)? = nil, onCompleted: (() -> Void)? = nil, onDisposed: (() -> Void)? = nil)
```

<!-- < compare Observables with subscribe to Notifications > -->

<!-- > -->

### Disposing and terminating

When a sequence sends the **completed** or **error** event all internal resources that compute sequence elements will be freed.

To cancel production of sequence elements and free resources immediately, call `dispose` on the returned subscription.

<!-- > -->

If a sequence does not terminate on its own, such as with a series of button taps, resources will be allocated permanently unless `dispose` is called manually, automatically inside of a `disposeBag`, with the `takeUntil` operator, or in some other way.

Using `dispose bags` or `takeUntil operator` is a robust way of making sure resources are cleaned up.

Dispose bags are used to return ARC like behavior to RX.

<!-- > -->

When a DisposeBag is deallocated, it will call dispose on each of the added disposables.

It does not have a dispose method and therefore does not allow calling explicit dispose on purpose. If immediate cleanup is required, we can just create a new bag.

```swift
  self.disposeBag = DisposeBag()
```
This will clear old references and cause disposal of resources.

*from:* </br>
https://github.com/ReactiveX/RxSwift/blob/master/Documentation/GettingStarted.md


<!-- > -->

### Part 1 - HelloRxSwift

**TODO:** Using RxSwift, write a simple function that prints out `"Hello Rx"` and call the function from `viewDidLoad()`.

```swift
  func helloRxSwift(){

      //TODO: create Observable and call its .just func
      let helloSequence = Observable.just("Hello Rx")

      //TODO: Subsubscribe to Observable, print the event passed in...

  }

```

<!-- SOLUTION FOR PART 1:
```Swift

func helloRxSwift(){

    let helloSequence = Observable.just("Hello Rx")

    _ = helloSequence.subscribe {
        event in print(event)
    }
}

``` -->

<!-- > -->

### Part 2 - Rx.playground Examples

As a class, review and discuss the behaviors in these simple Observers...

> **Step 1:** First, set up Rx.playground:

1. From **RxSwift-master** project (downloaded from RxSwift site), __*Open Rx.xcworkspace.*__
2. Build the __*RxExample-macOS__* scheme (Product → Build).
3. Open __*Rx.playground*__ in the Project navigator (under RxExample project).
4. If needed, show the Debug Area (View → Debug Area → Show Debug Area).

<!-- > -->

> **Step 2:** Navigate to the Introduction playground and run the 2 examples below...

**Q:** What behavior of Observables do these 2 examples illustrate?

```swift
  example("Observable with no subscribers") {
      _ = Observable<String>.create { observerOfString -> Disposable in
          print("This will never be printed")
          observerOfString.on(.next("😬"))
          observerOfString.on(.completed)
          return Disposables.create()
      }
  }
```

<!-- > -->

```swift
  example("Observable with subscriber") {
    _ = Observable<String>.create { observerOfString in
              print("Observable created")
              observerOfString.on(.next("😉"))
              observerOfString.on(.completed)
              return Disposables.create()
          }
          .subscribe { event in
              print(event)
      }
  }
```

<!-- > -->


> **Step 3:** Navigate to the TryYourself playground and run, first as it is, then after uncommenting out the 2 lines realated to `dispose`..

```Swift
example("Try yourself") {
  // let disposeBag = DisposeBag()
  _ = Observable.just("Hello, RxSwift!")
    .debug("Observable")
    .subscribe()
    // .disposed(by: disposeBag) // If dispose bag is used instead, sequence will terminate on scope exit
}

```
<!-- > -->

### Part 3 - Reactive Button

The following code prints out each element in an array whenever the user taps a button.

> **Step 1:** In a single view project (with RxSwift installed), create a button the view controller, add this code, and validate that it works:

```Swift
import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {

  @IBOutlet weak var buttonOne: UIButton!

    var array = [1, 2, 3, 4, 5, 6, 7]
    var currentIndex = 0

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func tapButtonOne(_ sender: Any) {
        printNext()
    }

    func printNext() {

        print(array[currentIndex])

        if currentIndex != array.count - 1 {
            currentIndex += 1
        }
    }

}
```

<!-- > -->

> **Step 2:** Add a second button called `buttonTwo` and, using the `tap` function built into __*RxCocoa,*__ call the same `printNext()` function as in the non-Reactive version above...

__*HINTS:*__
1. Consider using `.subscribe(onNext: _)`
2. Do we really need an `@IBAction` function now?


<!-- SOLUTION FOR PART 3:

```Swift

  // 1) Add button outlet
  @IBOutlet weak var buttonTwo: UIButton!

  // 2) declare DisposeBag() instance
  let disposeBag = DisposeBag()

```

```Swift
  // 3) skip the @IBAction function and just declare in viewDidLoad()
  override func viewDidLoad() {
      super.viewDidLoad()

      self.buttonTwo.rx.tap.subscribe(onNext: { _ in
          self.printNext()
      }).disposed(by: disposeBag)
  }
``` -->

<!-- > -->

## After Class

1. Research:
- RxSwift operators (standard)
- Rx Backpressure Operators
- Binding Observables
- Composability & Composable operations
- Futures_and_promises
- Concurrency & Parallelism
- Railway Oriented Programming

2. Try out this tutorial:

https://www.thedroidsonroids.com/blog/rxswift-by-examples-1-the-basics/

<!-- > -->

## Additional Resources

2. [Central repo for ReactiveX](http://reactivex.io)
3. [Reading Marble Diagrams - an article](https://medium.com/@jshvarts/read-marble-diagrams-like-a-pro-3d72934d3ef5)
4. [MathBehindRx - an article](https://github.com/ReactiveX/RxSwift/blob/master/Documentation/MathBehindRx.md) <sup>1</sup>
5. [Sequence - Apple docs](https://developer.apple.com/documentation/swift/sequence) <sup>2</sup>
6. [Asynchrony - wikipedia](https://en.wikipedia.org/wiki/Asynchrony_(computer_programming))
7. [RxSwift repo](https://github.com/ReactiveX/RxSwift)
