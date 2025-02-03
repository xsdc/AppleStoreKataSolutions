import Testing

@testable import DecoratorArticleCode

@Test func testMacBookProWithStorageAndAppleCareDecorators() {
    let macBookPro = MacBookProProduct()
    let macBookProWithStorage = StoragePriceDecorator(product: macBookPro, storageOption: .tb1)
    let macBookProWithAppleCare = AppleCarePriceDecorator(product: macBookProWithStorage)

    #expect(macBookPro.price == 5000.0)
    #expect(macBookProWithStorage.price == 5500.0)
    #expect(macBookProWithAppleCare.price == 5700.0)
}

@Test func testVisionProWithStorageAndAppleCareDecorators() {
    let visionPro = VisionProProduct()
    let visionProWithStorage = StoragePriceDecorator(product: visionPro, storageOption: .gb512)
    let visionProWithAppleCare = AppleCarePriceDecorator(product: visionProWithStorage)

    #expect(visionPro.price == 3500.0)
    #expect(visionProWithStorage.price == 3800.0)
    #expect(visionProWithAppleCare.price == 4000.0)
}

