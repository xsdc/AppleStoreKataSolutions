import Testing

@testable import ProxyArticleCode

@Test func testAnalyticsProxy() {
    let bag = Bag()
    let logger = MockAnalyticsEventLogger()
    let bagWithAnalyticsProxy = BagWithAnalyticsProxy(bag: bag, logger: logger)

    bagWithAnalyticsProxy.addProduct(
        Mocks.product()
    )

    #expect(logger.eventsLogged.contains("productAddedToBag"))

    bagWithAnalyticsProxy.removeProduct(
        Product(name: "iPhone", price: 999.99)
    )

    #expect(logger.eventsLogged.contains("productRemovedFromBag"))

    bagWithAnalyticsProxy.clearAllProducts()

    #expect(logger.eventsLogged.contains("allProductsRemovedFromBag"))
}

struct Mocks {
    static func product() -> Product {
        Product(name: "iPhone", price: 999.99)
    }
}

class MockAnalyticsEventLogger: AnalyticsEventLogging {
    var eventsLogged: [String] = []

    func log(event: String) {
        eventsLogged.append(event)
    }
}
