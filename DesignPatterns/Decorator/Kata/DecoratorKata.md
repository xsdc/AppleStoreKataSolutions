# Decorator Kata

Before attempting the kata, read the article, code, and tests.

Location of the files:

- `DesignPatterns/Decorator/Article/DecoratorArticle.md`
- `DesignPatterns/Decorator/Article/DecoratorArticleCode.swift`
- `DesignPatterns/Decorator/Article/DecoratorArticleTests.swift`

The tests can either be run via Xcode or the command line.

To run them via Xcode:
- The `DesignPatterns/Decorator` package directory can be opened in Xcode with: File -> Open (⌘ + O)
- Or by running the following command from the root directory: `xed DesignPatterns/Decorator`

To run them via the command line:
- Navigate to the directory: `cd DesignPatterns/Decorator`
- Run the following command: `swift test`
- To get an overview of the tests, run the following command: `swift test --list-tests`

## Tasks

Files:
- `DesignPatterns/Decorator/Kata/DecoratorKataCode.swift`
- `DesignPatterns/Decorator/Kata/DecoratorKataTests.swift`

### Task 1

We would like to calculate the final price for a MacBook Pro with the 1TB storage option and a student discount of 20%.

Complete the implementation of the `StudentDiscountPriceDecorator` class.

Run the tests via the command line with:

```shell
swift test --filter DecoratorKataTests.testTask1
```

### Task 2

The employee discount is 30% when the price is less than or equal to $3500, otherwise it is 25%.

Complete the implementation of the `EmployeeDiscountPriceDecorator` class.

For this task, we would like to calculate the final price for:

- MacBook Pro with the 1TB storage option
- AppleCare selected
- Employee discount applied

Run the test via the command line with:

```shell
swift test --filter DecoratorKataTests.testTask2
```

### Task 3

Sales taxes can vary by location. For this, a decorator can be created with a dynamic percentage value.

Complete the implementation of the `SalesTaxPriceDecorator` class to apply a sales tax percentage to the price.

For this task, we would like to calculate the final price for:

- Vision Pro with the 512GB storage option
- AppleCare selected
- Employee discount applied according to the specification of task 2
- Sales tax of 12.5% applied

Run the test via the command line with:

```shell
swift test --filter DecoratorKataTests.testTask3
```

## Final Check

Ensure that all tests pass via the command line with:

```shell
swift test --filter DecoratorKataTests
```
