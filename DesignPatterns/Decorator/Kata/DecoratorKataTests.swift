import Testing

@testable import DecoratorKataCode

@Test func testTask1() {
    let macBookPro = MacBookProProduct()
    let macBookProWithStorage = StoragePriceDecorator(product: macBookPro, storageOption: .tb1)
    let macBookProWithStudentDiscountPriceDecorator = StudentDiscountPriceDecorator(product: macBookProWithStorage)
    
    #expect(macBookPro.price == 5000.0)
    #expect(macBookProWithStorage.price == 5500.0)
    #expect(macBookProWithStudentDiscountPriceDecorator.price == 4400.0)
}

@Test func testTask2() {
    let macBookPro = MacBookProProduct()
    let macBookProWithStorage = StoragePriceDecorator(product: macBookPro, storageOption: .tb1)
    let macBookProWithAppleCare = AppleCarePriceDecorator(product: macBookProWithStorage)
    let macBookProWithEmployeeDiscount = EmployeeDiscountPriceDecorator(product: macBookProWithAppleCare)
    
    #expect(macBookPro.price == 5000.0)
    #expect(macBookProWithStorage.price == 5500.0)
    #expect(macBookProWithAppleCare.price == 5700.0)
    #expect(macBookProWithEmployeeDiscount.price == 4275.0)
}

@Test func testTask3() {
    let visionPro = VisionProProduct()
    let visionProWithStorage = StoragePriceDecorator(product: visionPro, storageOption: .gb512)
    let visionProWithAppleCare = AppleCarePriceDecorator(product: visionProWithStorage)
    let visionProWithEmployeeDiscount = EmployeeDiscountPriceDecorator(product: visionProWithAppleCare)
    let visionProWithSalesTaxPercentPriceDecorator = SalesTaxPercentPriceDecorator(product: visionProWithEmployeeDiscount, salesTaxPercent: 0.125)
    
    #expect(visionPro.price == 3500.0)
    #expect(visionProWithStorage.price == 3800.0)
    #expect(visionProWithAppleCare.price == 4000.0)
    #expect(visionProWithEmployeeDiscount.price == 3000.0)
    #expect(visionProWithSalesTaxPercentPriceDecorator.price == 3375.0)
}

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
