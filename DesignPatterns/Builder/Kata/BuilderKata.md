# Builder Kata

Before attempting the kata, read the article, code, and tests.

Location of the files:

- `DesignPatterns/Builder/Article/BuilderArticle.md`
- `DesignPatterns/Builder/Article/BuilderArticleCode.swift`
- `DesignPatterns/Builder/Article/BuilderArticleTests.swift`

The tests can either be run via Xcode or the command line.

To run them via Xcode:
- The `DesignPatterns/Builder` package directory can be opened in Xcode with: File -> Open (⌘ + O)
- Or by running the following command from the root directory: `xed DesignPatterns/Builder`

To run them via the command line:
- Navigate to the directory: `cd DesignPatterns/Builder`
- Run the following command: `swift test`
- To get an overview of the tests, run the following command: `swift test --list-tests`

## Tasks

Files:
- `DesignPatterns/Builder/Kata/BuilderKataCode.swift`
- `DesignPatterns/Builder/Kata/BuilderKataTests.swift`

### Task 1

- Complete the implementation of the engraving property for the Apple Watch Series 10.

- Ensure that the default value is `"None"`.

```shell
swift test --filter BuilderKataTests.testTask1
```

### Task 2

- Implement the default builder values for the new Apple Watch Ultra series:
    - Size: 49mm
    - Material: Natural titanium
    - Band: Trail loop
    - Engraving: None

- Make use of the enums cases to set the values.

Run the test via the command line with:

```shell
swift test --filter BuilderKataTests.testTask2
```

### Task 3

Complete the implementation of the Apple Watch Ultra series property builder methods.

Run the test via the command line with:

```shell
swift test --filter BuilderKataTests.testTask3
```

## Final Check

Ensure that all tests pass via the command line with:

```shell
swift test --filter BuilderKataTests
```
