
# Prototype Kata

Before attempting the kata, read the article, the code, and tests.

Location of the files:

- `DesignPatterns/AppleStorePrototype/PrototypeArticle.md`
- `DesignPatterns/AppleStorePrototype/Sources/PrototypeArticleCode.swift`
- `DesignPatterns/AppleStorePrototype/Tests/PrototypeArticleTests.swift`

## Kata code

File: `Sources/PrototypeKataCode.swift`

### Task 1

- The `currencyCode` property has been added to `ConfigurationOption`

- The cloning method has been updated to accept the currency code.

```swift
func cloneWithConversionRate(of conversionRate: Double, toCurrency currencyCode: String) -> iPhoneProductConfiguration
```

- Ensure the currency is updated when cloning.

### Task 2

- Add a new concrete prototype for `CloneableProductConfiguration` for the Apple 4K: `AppleTVProductConfiguration`

- `AppleTVProductConfiguration` should have a single property: `networkingOptions` of type `[ConfigurationOption]`

## Kata tests

File: `Tests/PrototypeKataTests.swift`

## Task 1

Update the `testPhoneCloningPhoneEuroConfigurationFromDollarConfiguration` test to include the currency code.

Run the test with:

```shell
swift test --filter AppleStorePrototype.Kata/testPhoneCloningPhoneEuroConfigurationFromDollarConfiguration
```

### Task 2

Update `tvConfigurationOptions` according to the following:

Option 1 - Name: "WiFi", Price: 129.00, Currency: "USD"
Option 2 - Name: "WiFi with Ethernet", Price: 149.00, Currency: "USD"

## Task 2

Complete the `testTVCloningYenConfigurationFromDollarConfiguration` test.

- The conversion rate should be 160 yen per dollar

- The currency code for yen: JPY

Run the test with:

```shell
swift test --filter AppleStorePrototype.Kata/testTVCloningYenConfigurationFromDollarConfiguration
```

## Final Check

Ensure that all tests pass:

```shell
swift test --filter AppleStorePrototype.Kata
```
