# Proxy Kata

Before attempting the kata, read the article, code, and tests.

Location of the files:

- `DesignPatterns/Proxy/Article/ProxyArticle.md`
- `DesignPatterns/Proxy/Article/ProxyArticleCode.swift`
- `DesignPatterns/Proxy/Article/ProxyArticleTests.swift`

The tests can either be run via Xcode or the command line.

To run them via Xcode:
- The `DesignPatterns/Proxy` package directory can be opened in Xcode with: File -> Open (⌘ + O)
- Or by running the following command from the root directory: `xed DesignPatterns/Proxy`

To run them via the command line:
- Navigate to the directory: `cd DesignPatterns/Proxy`
- Run the following command: `swift test`
- To get an overview of the tests, run the following command: `swift test --list-tests`

## Kata

Files:
- `DesignPatterns/Proxy/Kata/ProxyKataCode.swift`
- `DesignPatterns/Proxy/Kata/ProxyKataTests.swift`

### Task 1

For our real subject, we have a `Bag` object that manages products users add while shopping.

Complete the `Bag` implementation:

- Task 1A: Adding a product to the bag
- Task 1B: Removing a product from the bag
- Task 1C: Removing all products from the bag

Run the tests via the command line with:

```shell
swift test --filter ProxyKataTests.testTask1A
swift test --filter ProxyKataTests.testTask1B
swift test --filter ProxyKataTests.testTask1C
```

### Task 2

Now that the `Bag` object is implemented, we can successfully implement `BagWithAnalyticsProxy` as its proxy.

Complete the implementation of the `BagWithAnalyticsProxy`:

- Task 2A: Adding a product to the bag via the proxy, and logging the event
- Task 2B: Removing a product from the bag via the proxy, and logging the event
- Task 2C: Removing all products from the bag via the proxy, and logging the event

Run the tests via the command line with:

```shell
swift test --filter ProxyKataTests.testTask2A
swift test --filter ProxyKataTests.testTask2B
swift test --filter ProxyKataTests.testTask2C
```

### Task 3

In the article, we used the proxy pattern to add analytics logging to the `Bag` object. In this task, we will implement multiple providers for analytics logging.

We are able to add the feature while still conforming to `ProductManaging`. This allows us to swap out `BagWithAnalyticsProxy` for the new `BagWithEventLoggersProxy`.

Complete the implementation of the `BagWithEventLoggersProxy` for:

- Task 3A: Adding a product to the bag and logging the event with multiple providers
- Task 3B: Removing a product from the bag and logging the event with multiple providers
- Task 3C: Removing all products from the bag and logging the event with multiple providers

Run the tests via the command line with:

```shell
swift test --filter ProxyKataTests.testTask3A
swift test --filter ProxyKataTests.testTask3B
swift test --filter ProxyKataTests.testTask3C
```

## Final Check

Ensure that all tests pass via the command line with:

```shell
swift test --filter ProxyKataTests
```
