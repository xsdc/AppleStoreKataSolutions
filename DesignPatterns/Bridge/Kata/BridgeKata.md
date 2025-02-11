# Bridge Kata

Before attempting the kata, read the article, code, and tests.

Location of the files:

- `DesignPatterns/Bridge/Article/BridgeArticle.md`
- `DesignPatterns/Bridge/Article/BridgeArticleCode.swift`
- `DesignPatterns/Bridge/Article/BridgeArticleTests.swift`

The tests can either be run via Xcode or the command line.

To run them via Xcode:
- The `DesignPatterns/Bridge` package directory can be opened in Xcode with: File -> Open (⌘ + O)
- Or by running the following command from the root directory: `xed DesignPatterns/Bridge`

To run them via the command line:
- Navigate to the directory: `cd DesignPatterns/Bridge`
- Run the following command: `swift test`
- To get an overview of the tests, run the following command: `swift test --list-tests`

## Tasks

Files:
- `DesignPatterns/Bridge/Kata/BridgeKataCode.swift`
- `DesignPatterns/Bridge/Kata/BridgeKataTests.swift`

### Task 1

- In the article, the component views were generic. Now, device specific views have been created.

- Update the `iPhoneProductComponentRenderer` to return device specific views.

```shell
swift test --filter BridgeKataTests.testTask1
```

### Task 2

Update the `iPadProductComponentRenderer` to return its device specific views.

Run the test via the command line with:

```shell
swift test --filter BridgeKataTests.testTask2
```

### Task 3

- In addition to the Apple Watch Series 11, refined abstraction views have been added for the MacBook Air.

- Abstractors and implementors can vary indepedently.

- The order of the `MacBookAirSummaryView` view stacks needs to be updated to: carousel, price, title.

Run the test via the command line with:

```shell
swift test --filter BridgeKataTests.testTask3
```

### Task 4

Update the order of the `MacBookAirTechSpecsView` view stack: title, price, tech specs.

Run the test via the command line with:

```shell
swift test --filter BridgeKataTests.testTask3
```

## Final Check

Ensure that all tests pass via the command line with:

```shell
swift test --filter BridgeKataTests
```
