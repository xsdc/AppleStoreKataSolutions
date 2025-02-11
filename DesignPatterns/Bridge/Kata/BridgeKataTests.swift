import Testing

@testable import BridgeKataCode

@Test func testTask1() {
    let product = Stub.product

    let iPhoneRenderer = iPhoneProductComponentRenderer()
    let summaryView = AppleWatchSeries11SummaryView(product: product, componentRenderer: iPhoneRenderer)
    summaryView.render()

    #expect(summaryView.views.count == 3)
    #expect(summaryView.views.contains { $0 is iPhoneTitleView })
    #expect(summaryView.views.contains { $0 is iPhonePriceView })
    #expect(summaryView.views.contains { $0 is iPhoneCarouselView })
    #expect(summaryView.views[0] is iPhoneTitleView)
    #expect(summaryView.views[1] is iPhonePriceView)
    #expect(summaryView.views[2] is iPhoneCarouselView)
}

@Test func testTask2() {
    let product = Stub.product

    let iPadRenderer = iPadProductComponentRenderer()
    let techSpecsView = AppleWatchSeries11TechSpecsView(product: product, componentRenderer: iPadRenderer)
    techSpecsView.render()

    #expect(techSpecsView.views.count == 3)
    #expect(techSpecsView.views.contains { $0 is iPadTitleView })
    #expect(techSpecsView.views.contains { $0 is iPadPriceView })
    #expect(techSpecsView.views.contains { $0 is iPadTechSpecsView })
    #expect(techSpecsView.views[0] is iPadTitleView)
    #expect(techSpecsView.views[1] is iPadPriceView)
    #expect(techSpecsView.views[2] is iPadTechSpecsView)
}

@Test func testTask3() {
    let product = Stub.product

    let iPhoneRenderer = iPhoneProductComponentRenderer()
    let summaryView = MacBookAirSummaryView(product: product, componentRenderer: iPhoneRenderer)
    summaryView.render()

    #expect(summaryView.views.count == 3)
    #expect(summaryView.views.contains { $0 is iPhoneTitleView })
    #expect(summaryView.views.contains { $0 is iPhonePriceView })
    #expect(summaryView.views.contains { $0 is iPhoneCarouselView })
    #expect(summaryView.views[0] is iPhoneCarouselView)
    #expect(summaryView.views[1] is iPhonePriceView)
    #expect(summaryView.views[2] is iPhoneTitleView)
}

@Test func testTask4() {
    let product = Stub.product

    let iPadRenderer = iPadProductComponentRenderer()
    let techSpecsView = MacBookAirTechSpecsView(product: product, componentRenderer: iPadRenderer)
    techSpecsView.render()

    #expect(techSpecsView.views.count == 3)
    #expect(techSpecsView.views.contains { $0 is iPadTitleView })
    #expect(techSpecsView.views.contains { $0 is iPadPriceView })
    #expect(techSpecsView.views.contains { $0 is iPadTechSpecsView })
    #expect(techSpecsView.views[0] is iPadTitleView)
    #expect(techSpecsView.views[1] is iPadPriceView)
    #expect(techSpecsView.views[2] is iPadTechSpecsView)
}

struct Stub {
    static let product = Product(name: "Apple Watch Ultra", price: 399.99)
}

