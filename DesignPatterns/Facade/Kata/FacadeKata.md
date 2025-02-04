# Facade Kata

Before attempting the kata, read the article, code, and tests.

Location of the files:

- `DesignPatterns/Facade/Article/FacadeArticle.md`
- `DesignPatterns/Facade/Article/FacadeArticleCode.swift`
- `DesignPatterns/Facade/Article/FacadeArticleTests.swift`

The tests can either be run via Xcode or the command line.

To run them via Xcode:
- The `DesignPatterns/Facade` package directory can be opened in Xcode with: File -> Open (⌘ + O)
- Or by running the following command from the root directory: `xed DesignPatterns/Facade`

To run them via the command line:
- Navigate to the directory: `cd DesignPatterns/Facade`
- Run the following command: `swift test`
- To get an overview of the tests, run the following command: `swift test --list-tests`

## Tasks

Files:
- `DesignPatterns/Facade/Kata/FacadeKataCode.swift`
- `DesignPatterns/Facade/Kata/FacadeKataTests.swift`

Use the `NotificationFacade` class to provide a simple interface for sending notifications.

In the article, concurrency features are not used. The kata extends the article by expecting the notifications to have the ability to run concurrently.

### Task 1

- Add the implementation for sending mail notifications.
- Refer to the test to understand the requirements: `testSendMail()` in `Tests/FacadeKataTests.swift`
- Run the test with:

```shell
swift test --filter FacadeKataTests.testTask1
```

### Task 2

- Add the implementation for sending message notifications.
- Refer to the test to understand the requirements: `testSendMessage()` in `Tests/FacadeKataTests.swift`
- Run the test with:

```shell
swift test --filter FacadeKataTests.testTask2
```

### Task 3

- Add the implementation for sending push notifications.
- Refer to the test to understand the requirements: `testSendPush()` in `Tests/FacadeKataTests.swift`
- Run the test with:

```shell
swift test --filter FacadeKataTests.testTask3
```

### Task 4

- Add the implementation for sending batch notifications.
- Batch notifications are a combination of mail, message, and push notifications in a single call.
- Refer to the test to understand the requirements: `testBatchSending()` in `Tests/FacadeKataTests.swift`
- Run the test with:

```shell
swift test --filter FacadeKataTests.testTask4
```

## Task 5

- Ensure that `testManualBatchSending()` passes.
- This tests if individual notifications can run selectively and independently as part of a task group.
- Run the test with:

```shell
swift test --filter FacadeKataTests.testTask5
```

## Final Check

Ensure that all tests pass:

```shell
swift test --filter FacadeKataTests
```
