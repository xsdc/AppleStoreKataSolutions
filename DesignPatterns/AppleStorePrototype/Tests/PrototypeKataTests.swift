import Testing

@testable import AppleStorePrototype

extension Kata {
    struct Mocks {
        static let phoneConfigurationOptions: [ConfigurationOption] = [
            ConfigurationOption(name: "64GB", price: 700, currencyCode: "USD"),
            ConfigurationOption(name: "128GB", price: 800, currencyCode: "USD"),
            ConfigurationOption(name: "256GB", price: 900, currencyCode: "USD")
        ]
        
        static let tvConfigurationOptions: [ConfigurationOption] = [
            // Add options
        ]
    }
    
    @Test func testPhoneCloningPhoneEuroConfigurationFromDollarConfiguration() {
        let configurationOptions = Mocks.phoneConfigurationOptions

        let dollarConfiguration = iPhoneProductConfiguration(storageOptions: configurationOptions)
        let euroConfiguration = dollarConfiguration.cloneWithConversionRate(of: 0.9, toCurrency: "")
        
        #expect(euroConfiguration.storageOptions.count == 3)
        
        #expect(euroConfiguration.storageOptions[0].name == "64GB")
        #expect(euroConfiguration.storageOptions[0].price == 630)
        #expect(euroConfiguration.storageOptions[0].currencyCode == "EUR")
        
        #expect(euroConfiguration.storageOptions[1].name == "128GB")
        #expect(euroConfiguration.storageOptions[1].price == 720)
        #expect(euroConfiguration.storageOptions[1].currencyCode == "EUR")
        
        #expect(euroConfiguration.storageOptions[2].name == "256GB")
        #expect(euroConfiguration.storageOptions[2].price == 810)
        #expect(euroConfiguration.storageOptions[2].currencyCode == "EUR")
    }
    
    @Test func testTVCloningYenConfigurationFromDollarConfiguration() {
        let configurationOptions = Mocks.tvConfigurationOptions
        
        // Write the Apple TV cloning test here
        
        let yenConfigurationOptions = Mocks.phoneConfigurationOptions
        
        #expect(yenConfigurationOptions.count == 2)
        
        #expect(yenConfigurationOptions[0].name == "WiFi")
        #expect(yenConfigurationOptions[0].price == 20640)
        #expect(yenConfigurationOptions[0].currencyCode == "JPY")
        
        #expect(yenConfigurationOptions[1].name == "WiFi with Ethernet")
        #expect(yenConfigurationOptions[1].price == 23840)
        #expect(yenConfigurationOptions[1].currencyCode == "JPY")
    }
}
