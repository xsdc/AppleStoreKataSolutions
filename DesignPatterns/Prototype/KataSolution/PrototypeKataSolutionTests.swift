import Testing

@testable import PrototypeKataSolutionCode

struct Stub {
    static let phoneConfigurationOptions = [
        ConfigurationOption(name: "64GB", price: 700, currencyCode: "USD"),
        ConfigurationOption(name: "128GB", price: 800, currencyCode: "USD"),
        ConfigurationOption(name: "256GB", price: 900, currencyCode: "USD")
    ]
    
    static let tvConfigurationOptions = [
        ConfigurationOption(name: "WiFi", price: 129, currencyCode: "USD"),
        ConfigurationOption(name: "WiFi with Ethernet", price: 149, currencyCode: "USD")
    ]
}

@Test func testCloningEuroConfigurationFromDollarConfiguration() {
    let configurationOptions = Stub.phoneConfigurationOptions

    let dollarConfiguration = iPhoneProductConfiguration(storageOptions: configurationOptions)
    let euroConfiguration = dollarConfiguration.cloneWithConversionRate(of: 0.9, toCurrency: "EUR")
    
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

@Test func testCloningYenConfigurationFromDollarConfiguration() {
    let configurationOptions = Stub.tvConfigurationOptions

    let dollarConfiguration = AppleTVProductConfiguration(networkingOptions: configurationOptions)
    let yenConfiguration = dollarConfiguration.cloneWithConversionRate(of: 160, toCurrency: "JPY")
    
    #expect(yenConfiguration.networkingOptions.count == 2)
    
    #expect(yenConfiguration.networkingOptions[0].name == "WiFi")
    #expect(yenConfiguration.networkingOptions[0].price == 20640)
    #expect(yenConfiguration.networkingOptions[0].currencyCode == "JPY")
    
    #expect(yenConfiguration.networkingOptions[1].name == "WiFi with Ethernet")
    #expect(yenConfiguration.networkingOptions[1].price == 23840)
    #expect(yenConfiguration.networkingOptions[1].currencyCode == "JPY")
}
