# Facade Kata

Before attempting the kata, read the article, the code, and tests.

Location of the files:

- `DesignPatterns/AppleStoreFacade/FacadeArticle.md`
- `DesignPatterns/AppleStoreFacade/Sources/FacadeArticleCode.swift`
- `DesignPatterns/AppleStoreFacade/Tests/FacadeArticleTests.swift`

## Kata code and tests

Use the `NotificationFacade` class to provide a simple interface for sending notifications.

In the article, concurrency features are not used. The kata extends the article by expecting the notifications have the ability to run concurrently.

Files: `Sources/FacadeKataCode.swift` & `Tests/FacadeKataTests.swift`

### Task 1

- Add the implementation for sending mail notifications.
- Refer to the test to understand the requirements: `testSendMail()` in `Tests/FacadeKataTests.swift`
- Run the test with:

```shell
swift test --filter AppleStoreFacade.Kata/testSendMail
```

### Task 2

- Add the implementation for sending message notifications.
- Refer to the test to understand the requirements: `testSendMessage()` in `Tests/FacadeKataTests.swift`
- Run the test with:

```shell
swift test --filter AppleStoreFacade.Kata/testSendMessage
```

### Task 3

- Add the implementation for sending push notifications.
- Refer to the test to understand the requirements: `testSendPush()` in `Tests/FacadeKataTests.swift`
- Run the test with:

```shell
swift test --filter AppleStoreFacade.Kata/testSendPush
```

### Task 4

- Add the implementation for sending batch notifications.
- Batch notifications are a combination of mail, message, and push notifications in a single call.
- Refer to the test to understand the requirements: `testBatchSending()` in `Tests/FacadeKataTests.swift`
- Run the test with:

```shell
swift test --filter AppleStoreFacade.Kata/testBatchSending
```

## Task 5

- Ensure that `testManualBatchSending()` passes.
- This tests if individual notifications can run selectively and independently as part of a task group.
- Run the test with:

```shell
swift test --filter AppleStoreFacade.Kata/testManualBatchSending
```

## Final Check

Ensure that all tests pass:

```shell
swift test --filter AppleStoreFacade.Kata
```
