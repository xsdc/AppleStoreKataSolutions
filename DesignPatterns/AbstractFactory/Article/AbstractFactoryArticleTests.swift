import Testing

@testable import AbstractFactoryArticleCode

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
