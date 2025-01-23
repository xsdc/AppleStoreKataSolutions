# Chain of Responsibility Kata

Before attempting the kata, read the article, the code, and tests.

Location of the files:

- `DesignPatterns/AppleStoreChainOfResponsibility/ChainOfResponsibilityArticle.md`
- `DesignPatterns/AppleStoreChainOfResponsibility/Sources/ChainOfResponsibilityArticleCode.swift`
- `DesignPatterns/AppleStoreChainOfResponsibility/Tests/ChainOfResponsibilityArticleTests.swift`

## Kata code

File: `Sources/ChainOfResponsibilityKataCode.swift`

### Task 1

Remove the stock check handler from the chain. See the following test: `testChain_AddToBag_Logging`

The order of the handler queue should be:
1. Add to bag handler
2. Logging handler

For simplicity, the implementations are omitted.

Run the test with:

```shell
swift test --filter AppleStoreChainOfResponsibility.Kata/testChain_AddToBag_Logging
```

### Task 2

Based on the the `StockCheckHandler`, create a new handler called `InStoreStockCheckHandler`.

- It should be initialized with a `storeCode` string.
- For simplicity, only return the failed path.
- In `InStoreStockCheckHandler` the handle method, set `request.productIsInStock` to `false`.
- Notice how this changes the flow taken by `AddToBagHandler`.

See the expected outputs in: `testChain_InStoreStockCheck_AddToBag_Logging`

The handler queue order should be:
1. In-store stock check handler
2. Add to bag handler
3. Logging handler

Run the test with:

```shell
swift test --filter AppleStoreChainOfResponsibility.Kata/testChain_InStoreStockCheck_AddToBag_Logging
```

## Final Check

Ensure that all tests pass:

```shell
swift test --filter AppleStoreChainOfResponsibility.Kata
```
