
# Template Method Kata

Before attempting the kata, read the article, the article code, and article tests.

Location of the files:

- `DesignPatterns/TemplateMethod/Article/TemplateMethodArticle.md`
- `DesignPatterns/TemplateMethod/Article/TemplateMethodArticleCode.swift`
- `DesignPatterns/TemplateMethod/Article/TemplateMethodArticleTests.swift`

The tests can either be run via Xcode or the command line.

To run them via Xcode:
- The `DesignPatterns/TemplateMethod` package directory can be opened in Xcode with: File -> Open (⌘ + O)
- Or open the package by running the following command from the root directory: `xed DesignPatterns/TemplateMethod`

To run them via the command line:
- Navigate to the directory: `cd DesignPatterns/TemplateMethod`
- Run the following command: `swift test`
- To get an overview of the tests, run the following command: `swift test --list-tests`

## Kata

Files:
- `DesignPatterns/TemplateMethod/Kata/TemplateMethodKataCode.swift`
- `DesignPatterns/TemplateMethod/Kata/TemplateMethodKataTests.swift`

### Task 1

Implement the new process order for the `DefaultAppleWatchConfiguration`:

1. mapDataForWatchBand()
2. mapDataForWatchBandSize()
3. mapDataForWatchEngraving()
3. mapDataForWatchCaseMaterial()
4. mapDataForWatchCaseSize()

Run the test via the command line with:

```shell
swift test --filter TemplateMethodKataTests.testTask1
```

### Task 2

- A new configuration called `ReverseOrderAppleWatchConfiguration` has been created.
- This is conformed to by the `ReverseOrderSeries10AppleWatchConfiguration`.
- Reverse the process method order found in `DefaultAppleWatchConfiguration`.

Run the test via the command line with:

```shell
swift test --filter TemplateMethodKataTests.testTask2
```

### Task 3

- The Hermès Series 10 Apple Watch doesn't the option to engrave.
- Add the ability to skip the engraving step in the `DefaultAppleWatchConfiguration`.
- Only the `HermèsSeries10AppleWatchConfiguration` should skip the engraving step.

Run the test via the command line with:

```shell
swift test --filter TemplateMethodKataTests.testTask3
```

## Final Check

Ensure that all tests pass via the command line with:

```shell
swift test --filter TemplateMethodKataTests
```
