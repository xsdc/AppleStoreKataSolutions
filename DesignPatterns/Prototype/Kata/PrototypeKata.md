# Prototype Kata

Before attempting the kata, read the article, code, and tests.

Location of the files:

- `DesignPatterns/Prototype/Article/PrototypeArticle.md`
- `DesignPatterns/Prototype/Article/PrototypeArticleCode.swift`
- `DesignPatterns/Prototype/Article/PrototypeArticleTests.swift`

The tests can either be run via Xcode or the command line.

To run them via Xcode:
- The `DesignPatterns/Prototype` package directory can be opened in Xcode with: File -> Open (⌘ + O)
- Or open the package by running the following command from the root directory: `xed DesignPatterns/Prototype`

To run them via the command line:
- Navigate to the directory: `cd DesignPatterns/Prototype`
- Run the following command: `swift test`
- To get an overview of the tests, run the following command: `swift test --list-tests`

## Tasks

Files:
- `DesignPatterns/Prototype/Kata/PrototypeKataCode.swift`
- `DesignPatterns/Prototype/Kata/PrototypeKataTests.swift`

### Task 1

- The `currencyCode` property has been added to `ConfigurationOption`

- The cloning method has been updated to accept the currency code.

```swift
func cloneWithConversionRate(of conversionRate: Double, toCurrency currencyCode: String) -> iPhoneProductConfiguration
```

- Ensure the currency is updated when cloning.

Run the test via the command line with:

```shell
swift test --filter PrototypeKataTests.testTask1
```

### Task 2

- Add a new concrete prototype of `CloneableProductConfiguration` for the Apple 4K: `AppleTVProductConfiguration`

- `AppleTVProductConfiguration` should have a single property: `networkingOptions` of type `[ConfigurationOption]`

Run the test via the command line with:

```shell
swift test --filter PrototypeKataTests.testTask2
```

## Task 3

Test method: `testPhoneCloningPhoneEuroConfigurationFromDollarConfiguration()`

- Update the test to include the currency code.

Run the test via the command line with:

```shell
swift test --filter PrototypeKataTests.testTask3
```

## Task 4

Test method: `testTVCloningYenConfigurationFromDollarConfiguration()`

- Update `tvConfigurationOptions` according to the following:

Option 1 - Name: "WiFi", Price: 129.00, Currency: "USD"
Option 2 - Name: "WiFi with Ethernet", Price: 149.00, Currency: "USD"

- Complete the `testTVCloningYenConfigurationFromDollarConfiguration` test.

- The conversion rate should be 160 yen per dollar

- The currency code for yen: JPY

Run the test via the command line with:

```shell
swift test --filter PrototypeKataTests.testTask4
```

## Final Check

Ensure that all tests pass:

```shell
swift test --filter PrototypeKataTests.Kata
```
