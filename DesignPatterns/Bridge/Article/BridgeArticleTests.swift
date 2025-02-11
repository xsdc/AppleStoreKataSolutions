import Testing

@testable import BridgeArticleCode

@Test func testAppleWatchSummaryViewWithPhoneRenderer() {
    let product = Stub.product

    let iPhoneRenderer = iPhoneProductComponentRenderer()
    let summaryView = AppleWatchSummaryView(product: product, componentRenderer: iPhoneRenderer)
    summaryView.render()

    #expect(summaryView.views.count == 3)
    #expect(summaryView.views.contains { $0 is TitleView })
    #expect(summaryView.views.contains { $0 is PriceView })
    #expect(summaryView.views.contains { $0 is CarouselView })
}

@Test func testAppleWatchTechSpecsViewWithPadRenderer() {
    let product = Stub.product

    let iPadRenderer = iPadProductComponentRenderer()
    let techSpecsView = AppleWatchTechSpecsView(product: product, componentRenderer: iPadRenderer)
    techSpecsView.render()

    #expect(techSpecsView.views.count == 3)
    #expect(techSpecsView.views.contains { $0 is TitleView })
    #expect(techSpecsView.views.contains { $0 is PriceView })
    #expect(techSpecsView.views.contains { $0 is TechSpecsView })
}

struct Stub {
    static let product = Product(name: "Apple Watch Ultra", price: 399.99)
}
