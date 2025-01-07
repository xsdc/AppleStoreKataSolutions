![TemplateMethod](https://github.com/user-attachments/assets/54b05943-1687-4761-8f07-5f51f6206aae)

<br />

# Template Method

> Define the skeleton of an algorithm in an operation, deferring some steps to subclasses. Template Method lets subclasses redefine certain steps of an algorithm without changing the algorithm's structure.
>
> _Reference: Design Patterns: Elements of Reusable Object-Oriented Software_

## Pattern overview

- The Template Method pattern is a pattern that defines the skeleton of an algorithm in an operation, deferring some steps to subclasses.
- For example, consider an onboarding process that consists of multiple steps, such as creating an account, setting up a profile, and selecting preferences.
- The onboarding process can be implemented using the Template Method pattern by defining a template method that calls a series of steps to complete the onboarding process.
- The steps can be overridden by subclasses to customize the onboarding process based on the user's preferences.

## Problem statement

- We would like to define a set of steps to rebuild an Apple Watch Studio configuration based on user input.
- The Template Method pattern allows us to define a template method that calls a series of steps to configure an Apple Watch Studio.
- The steps can be overridden by subclasses to customize the configuration based on the Apple Watch series.

## Domain application

AbstractClass:

- Defines abstract primitive operations that concrete subclasses define to implement steps of an algorithm.
- Implements a template method defining the skeleton of an algorithm.
- The template method calls primitive operations as well as operations defined in AbstractClass or those of other objects.

```swift
protocol AppleWatchConfiguration {
    func templateMethod()

    func selectWatchCaseSize()
    func selectWatchCaseMaterial()
    func selectWatchBand()
    func selectWatchBandSize()
    func selectWatchEngraving()
}

extension AppleWatchConfiguration {
    func templateMethod() {
        selectWatchCaseSize()
        selectWatchCaseMaterial()
        selectWatchBand()
        selectWatchBandSize()
        selectWatchEngraving()
    }

    func selectWatchCaseMaterial() {
        print("Configure default Apple Watch case material.")
    }

    func selectWatchBand() {
        print("Configure default Apple Watch band.")
    }

    func selectWatchCaseSize() {
        print("Configure default Apple Watch case size.")
    }

    func selectWatchBandSize() {
        print("Configure Apple Watch band size.")
    }

    func selectWatchEngraving() {
        print("No engraving by default.")
    }
}
```

ConcreteClass:

Implements the primitive operations to carry out subclass-specific steps of the algorithm.

```swift
class Series10AppleWatchConfiguration: AppleWatchConfiguration {
    func templateMethod() {
        selectWatchCaseSize()
        selectWatchCaseMaterial()
        selectWatchBand()
        selectWatchBandSize()
        selectWatchEngraving()
    }
}

class HermèsSeries10AppleWatchConfiguration: AppleWatchConfiguration {
    func templateMethod() {
        selectWatchCaseSize()
        selectWatchCaseMaterial()
        selectWatchBand()
        selectWatchBandSize()
    }

    func selectWatchCaseMaterial() {
        print("Configure titanium for Apple Watch Hermès Series case material.")
    }

    func selectWatchBand() {
        print("Configure Apple Watch Hermès Series specific band.")
    }
}
```
