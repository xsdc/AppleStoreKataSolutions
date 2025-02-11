# Factory Method Kata

Before attempting the kata, read the article, code, and tests.

Location of the files:

- `DesignPatterns/FactoryMethod/Article/FactoryMethodArticle.md`
- `DesignPatterns/FactoryMethod/Article/FactoryMethodArticleCode.swift`
- `DesignPatterns/FactoryMethod/Article/FactoryMethodArticleTests.swift`

The tests can either be run via Xcode or the command line.

To run them via Xcode:
- The `DesignPatterns/FactoryMethod` package directory can be opened in Xcode with: File -> Open (⌘ + O)
- Or by running the following command from the root directory: `xed DesignPatterns/FactoryMethod`

To run them via the command line:
- Navigate to the directory: `cd DesignPatterns/FactoryMethod`
- Run the following command: `swift test`
- To get an overview of the tests, run the following command: `swift test --list-tests`

## Tasks

Files:
- `DesignPatterns/FactoryMethod/Kata/FactoryMethodKataCode.swift`
- `DesignPatterns/FactoryMethod/Kata/FactoryMethodKataTests.swift`

### Task

- Add a new shipping method for drone delivery.

- The title should be "Drone Shipping"

- The delivery estimate: "Same day"

- The shipping cost should return 0.

```shell
swift test --filter FactoryMethodKataTests.testTask1
```

## Final Check

Ensure that all tests pass via the command line with:

```shell
swift test --filter FactoryMethodKataTests
```
