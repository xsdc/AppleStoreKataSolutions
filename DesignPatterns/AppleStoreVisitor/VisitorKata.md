
# Visitor Kata

Before attempting the kata, read the article, the code, and tests.

Location of the files:

- `DesignPatterns/AppleStoreVisitor/VisitorArticle.md`
- `DesignPatterns/AppleStoreVisitor/Sources/VisitorArticleCode.swift`
- `DesignPatterns/AppleStoreVisitor/Tests/VisitorArticleTests.swift`

## Kata code

File: `Sources/VisitorKataCode.swift`

### Task 1

In addition to the current concrete visitors, add a sales tax visitor that calculates the sales tax for a product.

- Include the sales tax visitor under the correct definition

- The sales tax should be a variable initialised with the class.

### Task 2

In addition to the `Visitor` protocol, an async version has been defined: `AsyncVisitor`.

- Update the `VisitorAccepting` protocol to accept asynchronous visitors.

- Update the concrete elements to stay in conformance.

- Add a new concrete visitor called `StockCheckVisitor` that conforms to `AsyncVisitor` instead of `Visitor`.

- The stock check visitor `VisitorResult` typealias should be assigned to the `Result<Bool, Error>` type.

- The `StockCheckVisitor` should be initialised with a `storeCode` variable of type `String`.

- For simplicity, the `StockCheckVisitor` visit method should return `.success(false)`.

## Kata tests

File: `Tests/VisitorKataTests.swift`

### Task 1

- Location of the test: `testSalesTaxVisitorWith10Percent` in `Tests/VisitorKataTests.swift`

- Test the sales tax visitor with a rate of 10%.

- The test should verify the sales tax visitor for `MacBookProProduct` and `VisionProProduct`.

- Run the test with:

```shell
swift test --filter AppleStoreVisitor.Kata/testSalesTaxVisitorWith10Percent
```

### Task 2

- Location of the test: `testSalesTaxVisitorWith15Percent` in `Tests/VisitorKataTests.swift`

- Test the sales tax visitor with a rate of 15%.

- The test should verify the sales tax visitor for `MacBookProProduct` and `VisionProProduct`.

- Run the test with:

```shell
swift test --filter AppleStoreVisitor.Kata/testSalesTaxVisitorWith15Percent
```

### Task 3

- Location of the test: `testAsyncStockCheckVisitor` in `Tests/VisitorKataTests.swift`

- The test should verify that the stock check visitor for `MacBookProProduct` and `VisionProProduct` both return a `Result` type with the success type being `false`.

- Run the test with:

```shell
swift test --filter AppleStoreVisitor.Kata/testAsyncStockCheckVisitor
```

## Final Check

Ensure that all tests pass:

```shell
swift test --filter AppleStoreVisitor.Kata
```
