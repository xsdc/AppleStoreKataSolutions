# Abstract Factory Kata

Before attempting the kata, read the article, code, and tests.

Location of the files:

- `DesignPatterns/AbstractFactory/Article/AbstractFactoryArticle.md`
- `DesignPatterns/AbstractFactory/Article/AbstractFactoryArticleCode.swift`
- `DesignPatterns/AbstractFactory/Article/AbstractFactoryArticleTests.swift`

The tests can either be run via Xcode or the command line.

To run them via Xcode:
- The `DesignPatterns/AbstractFactory` package directory can be opened in Xcode with: File -> Open (⌘ + O)
- Or by running the following command from the root directory: `xed DesignPatterns/AbstractFactory`

To run them via the command line:
- Navigate to the directory: `cd DesignPatterns/AbstractFactory`
- Run the following command: `swift test`
- To get an overview of the tests, run the following command: `swift test --list-tests`

## Tasks

Files:
- `DesignPatterns/AbstractFactory/Kata/AbstractFactoryKataCode.swift`
- `DesignPatterns/AbstractFactory/Kata/AbstractFactoryKataTests.swift`

### Task 1

- A new concrete product, `MacComponentFactory`, has been added.

- Ensure that when a product view is built using the MacComponentFactory, it correctly uses Mac specific views.

```shell
swift test --filter AbstractFactoryKataTests.testTask1
```

### Task 2

- Add support for producing the new `CardStackView` components in each concrete component factory.

- The card stack type should be horizontal for Mac and iPad, and vertical for iPhone.

- The adaptive type can be removed.

Run the test via the command line with:

```shell
swift test --filter AbstractFactoryKataTests.testTask2
```

### Task 3



Run the test via the command line with:

```shell
swift test --filter AbstractFactoryKataTests.testTask3
```

## Final Check

Ensure that all tests pass via the command line with:

```shell
swift test --filter AbstractFactoryKataTests
```
