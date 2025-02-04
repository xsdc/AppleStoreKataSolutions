
struct ConfigurationOption {
    let name: String
    let price: Double
    let currencyCode: String
}

// Prototype

protocol CloneableProductConfiguration {
    func cloneWithConversionRate(of conversionRate: Double, toCurrency currencyCode: String) -> Self
}

// Concrete Prototype

struct iPhoneProductConfiguration: CloneableProductConfiguration {
    let storageOptions: [ConfigurationOption]

    func cloneWithConversionRate(of conversionRate: Double, toCurrency currencyCode: String) -> iPhoneProductConfiguration {
        let storageOptions = self.storageOptions.map { option in
            ConfigurationOption(name: option.name, price: option.price * conversionRate, currencyCode: currencyCode)
        }

        return iPhoneProductConfiguration(storageOptions: storageOptions)
    }
}

/// Add the Apple TV product configuration here
