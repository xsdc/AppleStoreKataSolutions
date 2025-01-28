# Observer Kata

Before attempting the kata, read the article, the article code, and article tests.

Location of the files:

- `DesignPatterns/Observer/Article/ObserverArticle.md`
- `DesignPatterns/Observer/Article/ObserverArticleCode.swift`
- `DesignPatterns/Observer/Article/ObserverArticleTests.swift`

The tests can either be run via Xcode or the command line.

To run them via Xcode:
- The `DesignPatterns/Observer` package directory can be opened in Xcode with: File -> Open (⌘ + O)
- Or by running the following command from the root directory: `xed DesignPatterns/Observer`

To run them via the command line:
- Navigate to the directory: `cd DesignPatterns/Observer`
- Run the following command: `swift test`
- To get an overview of the tests, run the following command: `swift test --list-tests`

## Kata

Files:
- `DesignPatterns/Observer/Kata/ObserverKataCode.swift`
- `DesignPatterns/Observer/Kata/ObserverKataTests.swift`

### Task 1

- At the moment, only adding products is supported by the notification system.
- Implement the ability to remove products in `func removeProduct(_ product: Product)`

Run the test via the command line with:

```shell
swift test --filter ObserverKataTests.testTask1
```

### Task 2

- Implement the missing `detachObserver` method in `WebSocketBagNotifier`.

Run the test via the command line with:

```shell
swift test --filter ObserverKataTests.testTask2
```

## Final Check

Ensure that all tests pass via the command line with:

```shell
swift test --filter ObserverKataTests
```
