import Foundation
import Testing

@testable import ProxyKataSolutionCode

@Test func test1A() {
    let product = Product(
        id: UUID(),
        name: "iPhone 20 Pro Max",
        price: 1000.0
    )
    
    let bag = Bag()
    bag.addProduct(product)
    
    #expect(bag.products.count == 1)
}

@Test func test1B() {
    let productA = Product(
        id: UUID(),
        name: "iPhone 19 Pro",
        price: 1000.0
    )
    
    let productB = Product(
        id: UUID(),
        name: "iPhone 20 Pro Max",
        price: 1000.0
    )
    
    let bag = Bag()
    bag.addProduct(productA)
    bag.addProduct(productB)
    bag.removeProduct(productA)
    
    #expect(bag.products.count == 1)
}

@Test func test1C() {
    let productA = Product(
        id: UUID(),
        name: "iPhone 19 Pro",
        price: 1000.0
    )
    
    let productB = Product(
        id: UUID(),
        name: "iPhone 20 Pro Max",
        price: 1000.0
    )
    
    let bag = Bag()
    bag.addProduct(productA)
    bag.addProduct(productB)
    bag.clearAllProducts()
    
    #expect(bag.products.count == 0)
}

@Test func task2() {
    let productA = Product(
        id: UUID(),
        name: "iPhone 19 Pro",
        price: 1000.0
    )
    
    let productB = Product(
        id: UUID(),
        name: "iPhone 20 Pro Max",
        price: 1000.0
    )
    
    let bag = Bag()
    
    let analyticsEventLogger = AnalyticsEventLogger()
    
    let bagWithAnalyticsProxy = BagWithAnalyticsProxy(
        bag: bag,
        logger: analyticsEventLogger
    )
    
    bagWithAnalyticsProxy.addProduct(productA)
    bagWithAnalyticsProxy.addProduct(productB)
    
    #expect(bagWithAnalyticsProxy.productCount == 2)
    #expect(analyticsEventLogger.eventsLogged.count == 2)
    
    bagWithAnalyticsProxy.removeProduct(productA)
    
    #expect(bagWithAnalyticsProxy.productCount == 1)
    #expect(analyticsEventLogger.eventsLogged.count == 3)
    
    bagWithAnalyticsProxy.clearAllProducts()
    
    #expect(bagWithAnalyticsProxy.productCount == 0)
    #expect(analyticsEventLogger.eventsLogged.count == 4)
}

@Test func test3A() {
    let bag = Bag()
    
    let googleAnalyticsEventLogger = GoogleAnalyticsEventLogger()
    let salesforceEventLogger = SalesforceAnalyticsEventLogger()
    
    let bagWithProxy = BagWithEventLoggersProxy(
        bag: bag,
        eventLoggers: [
            googleAnalyticsEventLogger,
            salesforceEventLogger
        ]
    )
    
    let productA = Product(
        id: UUID(),
        name: "iPhone 19 Pro",
        price: 1000.0
    )
    
    let productB = Product(
        id: UUID(),
        name: "iPhone 20 Pro Max",
        price: 1000.0
    )
    
    bagWithProxy.addProduct(productA)
    bagWithProxy.addProduct(productB)
    
    #expect(bagWithProxy.productCount == 2)
    #expect(googleAnalyticsEventLogger.eventsLogged.count == 2)
    #expect(salesforceEventLogger.eventsLogged.count == 2)
}

@Test func test3B() {
    let bag = Bag()
    
    let googleAnalyticsEventLogger = GoogleAnalyticsEventLogger()
    let salesforceEventLogger = SalesforceAnalyticsEventLogger()
    
    let bagWithProxy = BagWithEventLoggersProxy(
        bag: bag,
        eventLoggers: [
            googleAnalyticsEventLogger,
            salesforceEventLogger
        ]
    )
    
    let productA = Product(
        id: UUID(),
        name: "iPhone 19 Pro",
        price: 1000.0
    )
    
    let productB = Product(
        id: UUID(),
        name: "iPhone 20 Pro Max",
        price: 1000.0
    )
    
    bagWithProxy.addProduct(productA)
    bagWithProxy.addProduct(productB)
    
    #expect(bagWithProxy.productCount == 2)
    #expect(googleAnalyticsEventLogger.eventsLogged.count == 2)
    #expect(salesforceEventLogger.eventsLogged.count == 2)
    
    bagWithProxy.removeProduct(productA)
    
    #expect(bagWithProxy.productCount == 1)
    #expect(googleAnalyticsEventLogger.eventsLogged.count == 3)
    #expect(salesforceEventLogger.eventsLogged.count == 3)
}

@Test func test3C() {
    let bag = Bag()
    
    let googleAnalyticsEventLogger = GoogleAnalyticsEventLogger()
    let salesforceEventLogger = SalesforceAnalyticsEventLogger()
    
    let bagWithProxy = BagWithEventLoggersProxy(
        bag: bag,
        eventLoggers: [
            googleAnalyticsEventLogger,
            salesforceEventLogger
        ]
    )
    
    let productA = Product(
        id: UUID(),
        name: "iPhone 19 Pro",
        price: 1000.0
    )
    
    let productB = Product(
        id: UUID(),
        name: "iPhone 20 Pro Max",
        price: 1000.0
    )
    
    bagWithProxy.addProduct(productA)
    bagWithProxy.addProduct(productB)
    
    #expect(bagWithProxy.productCount == 2)
    #expect(googleAnalyticsEventLogger.eventsLogged.count == 2)
    #expect(salesforceEventLogger.eventsLogged.count == 2)
    
    bagWithProxy.removeProduct(productA)
    
    #expect(bagWithProxy.productCount == 1)
    #expect(googleAnalyticsEventLogger.eventsLogged.count == 3)
    #expect(salesforceEventLogger.eventsLogged.count == 3)
    
    bagWithProxy.clearAllProducts()
    
    #expect(bagWithProxy.productCount == 0)
    #expect(googleAnalyticsEventLogger.eventsLogged.count == 4)
    #expect(salesforceEventLogger.eventsLogged.count == 4)
}
