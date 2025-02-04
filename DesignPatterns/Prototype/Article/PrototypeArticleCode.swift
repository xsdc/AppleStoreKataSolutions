
struct ConfigurationOption {
    let name: String
    let price: Double
}

// Prototype

protocol CloneableProductConfiguration {
    func cloneWithConversionRate(of conversionRate: Double) -> Self
}

// Concrete Prototype

struct iPhoneProductConfiguration: CloneableProductConfiguration {
    let storageOptions: [ConfigurationOption]

    func cloneWithConversionRate(of conversionRate: Double) -> iPhoneProductConfiguration {
        let storageOptions = self.storageOptions.map { option in
            ConfigurationOption(name: option.name, price: option.price * conversionRate)
        }

        return iPhoneProductConfiguration(storageOptions: storageOptions)
    }
}
