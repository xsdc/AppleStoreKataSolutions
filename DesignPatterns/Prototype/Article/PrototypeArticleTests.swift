import Testing

@testable import PrototypeArticleCode

@Test func testCloningEuroConfigurationFromDollarConfiguration() {
    let configurationOptions = Stub.configurationOptions

    let dollarConfiguration = iPhoneProductConfiguration(storageOptions: configurationOptions)
    let euroConfiguration = dollarConfiguration.cloneWithConversionRate(of: 0.9)
    
    #expect(euroConfiguration.storageOptions.count == 3)
    
    #expect(euroConfiguration.storageOptions[0].name == "64GB")
    #expect(euroConfiguration.storageOptions[0].price == 630)
    
    #expect(euroConfiguration.storageOptions[1].name == "128GB")
    #expect(euroConfiguration.storageOptions[1].price == 720)
    
    #expect(euroConfiguration.storageOptions[2].name == "256GB")
    #expect(euroConfiguration.storageOptions[2].price == 810)
}

struct Stub {
    static let configurationOptions = [
        ConfigurationOption(name: "64GB", price: 700),
        ConfigurationOption(name: "128GB", price: 800),
        ConfigurationOption(name: "256GB", price: 900)
    ]
}
