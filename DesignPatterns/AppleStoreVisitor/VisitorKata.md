
# Visitor Kata

## Relevant files:

### Article code

- `Sources/VisitorArticleCode.swift`
- `Tests/VisitorArticleCodeTests.swift`

### Kata challenge

- `Sources/VisitorKata.swift`
- `Tests/VisitorKataTests.swift`

## Challenge code

In addition to the current concrete visitors, add a sales tax visitor that calculates the sales tax for a product.

- Include the sales tax visitor under the correct definition

- The sales tax should be a variable initialised with the class.

### Challenge tests

- Ensure that previous tests pass.

- Run the all kata tests with:

```shell
swift test --filter KataTests
```

#### Test 1

- Location of the test: `testSalesTaxVisitorWith10Percent` in `Tests/VisitorKataTests.swift`

- Test the sales tax visitor with a rate of 10%.

- The test should verify the sales tax visitor for `MacBookProProduct` and `VisionProProduct`.

- Run the test with:

```shell
swift test --filter AppleStoreVisitor.Kata/testSalesTaxVisitorWith10Percent
```

## Test 2

- Location of the test: `testSalesTaxVisitorWith15Percent` in `Tests/VisitorKataTests.swift`

- Test the sales tax visitor with a rate of 15%.

- The test should verify the sales tax visitor for `MacBookProProduct` and `VisionProProduct`.

- Run the test with:

```shell
swift test --filter AppleStoreVisitor.Kata/testSalesTaxVisitorWith15Percent
```
