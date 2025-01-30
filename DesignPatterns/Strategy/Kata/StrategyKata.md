# Strategy Kata

Before attempting the kata, read the article, the article code, and article tests.

Location of the files:

- `DesignPatterns/Strategy/Article/StrategyArticle.md`
- `DesignPatterns/Strategy/Article/StrategyArticleCode.swift`
- `DesignPatterns/Strategy/Article/StrategyArticleTests.swift`

The tests can either be run via Xcode or the command line.

To run them via Xcode:
- The `DesignPatterns/Strategy` package directory can be opened in Xcode with: File -> Open (⌘ + O)
- Or by running the following command from the root directory: `xed DesignPatterns/Strategy`

To run them via the command line:
- Navigate to the directory: `cd DesignPatterns/Strategy`
- Run the following command: `swift test`
- To get an overview of the tests, run the following command: `swift test --list-tests`

## Kata

Files:
- `DesignPatterns/Strategy/Kata/StrategyKataCode.swift`
- `DesignPatterns/Strategy/Kata/StrategyKataTests.swift`

### Task 1

- There are two strategy protocols: One for a legacy payment system (`LegacyPaymentStrategy`) and one for a new payment system (`PaymentStrategy`).

- Refactor the Apple Pay and credit card payment strategies to conform to the `NewPaymentStrategy` protocol.

- They should then be compatible with the new checkout system: `NewCheckout`.

Run the tests via the command line with:

```shell
swift test --filter StrategyKataTests.testTask1A
swift test --filter StrategyKataTests.testTask1B
```

### Task 2

- Refactor the gift card payment strategy to conform to the `LegacyPaymentStrategy` protocol.

- It should then be compatible with the old checkout system: `LegacyCheckout`.

Run the test via the command line with:

```shell
swift test --filter StrategyKataTests.testTask2
```

## Final Check

Ensure that all tests pass via the command line with:

```shell
swift test --filter StrategyKataTests
```
