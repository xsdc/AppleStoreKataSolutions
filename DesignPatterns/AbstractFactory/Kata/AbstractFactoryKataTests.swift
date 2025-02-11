import Testing

@testable import AbstractFactoryKataCode

@Test func testTask1() {
    let macComponentFactory = MacComponentFactory()
    
    let macProductView = ProductView(factory: macComponentFactory)
    
    #expect(macProductView.bentoBoxView is MacBentoBoxView)
    #expect(macProductView.bentoBoxView.type == .large)
    #expect(macProductView.carouselView is MacCarouselView)
}

@Test func testTask2() {
    let macComponentFactory = MacComponentFactory()
    let iPadComponentFactory = iPadComponentFactory()
    let iPhoneComponentFactory = iPhoneComponentFactory()
    
    let macProductView = ProductView(factory: macComponentFactory)
    let iPadProductView = ProductView(factory: iPadComponentFactory)
    let iPhoneProductView = ProductView(factory: iPhoneComponentFactory)
    
    #expect(macProductView.cardStackView is MacCardStackView)
    #expect(macProductView.cardStackView?.type == .horizontal)
    #expect(iPadProductView.cardStackView is iPadCardStackView)
    #expect(iPadProductView.cardStackView?.type == .horizontal)
    #expect(iPhoneProductView.cardStackView is iPhoneCardStackView)
    #expect(iPhoneProductView.cardStackView?.type == .vertical)
}

@Test func testPhoneFactory() {
    let iPhoneComponentFactory = iPhoneComponentFactory()
    
    let iPhoneProductView = ProductView(factory: iPhoneComponentFactory)
    
    #expect(iPhoneProductView.bentoBoxView is iPhoneBentoBoxView)
    #expect(iPhoneProductView.bentoBoxView.type == .small)
    #expect(iPhoneProductView.carouselView is iPhoneCarouselView)
}

@Test func testPadFactory() {
    let iPadComponentFactory = iPadComponentFactory()
    let iPadProductView = ProductView(factory: iPadComponentFactory)
    
    #expect(iPadProductView.bentoBoxView is iPadBentoBoxView)
    #expect(iPadProductView.bentoBoxView.type == .large)
    #expect(iPadProductView.carouselView is iPadCarouselView)
}
