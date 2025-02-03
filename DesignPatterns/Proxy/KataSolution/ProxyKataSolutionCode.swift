import Foundation

struct Product: Equatable {
    let id: UUID
    let name: String
    let price: Double
}

protocol AnalyticsEventLogging {
    var eventsLogged: [String] { get set }
    func log(event: String)
}

class AnalyticsEventLogger: AnalyticsEventLogging {
    var eventsLogged = [String]()
    
    func log(event: String) {
        eventsLogged.append("Analytics event logged: \(event)")
    }
}

protocol EventLogging {
    var eventsLogged: [String] { get set }
    func log(event: String)
}

class GoogleAnalyticsEventLogger: EventLogging {
    var eventsLogged = [String]()
    
    func log(event: String) {
        eventsLogged.append("Google Analytics event logged: \(event)")
    }
}

class SalesforceAnalyticsEventLogger: EventLogging {
    var eventsLogged = [String]()
    
    func log(event: String) {
        eventsLogged.append("Salesforce Analytics event logged: \(event)")
    }
}

// Proxy

struct BagWithAnalyticsProxy: ProductManaging {
    private let bag: ProductManaging
    private let logger: AnalyticsEventLogging
    
    init(bag: ProductManaging, logger: AnalyticsEventLogging) {
        self.bag = bag
        self.logger = logger
    }
    
    func addProduct(_ product: Product) {
        bag.addProduct(product)
        
        logger.log(event: "productAddedToBag")
    }
    
    func removeProduct(_ product: Product) {
        bag.removeProduct(product)
        
        logger.log(event: "productRemovedFromBag")
    }
    
    func clearAllProducts() {
        bag.clearAllProducts()
        
        logger.log(event: "allProductsRemovedFromBag")
    }
    
    var productCount: Int {
        guard let bag = bag as? Bag else { return 0 }
        
        return bag.products.count
    }
}

class BagWithEventLoggersProxy: ProductManaging {
    private let bag: ProductManaging
    private let eventLoggers: [EventLogging]
    
    init(bag: ProductManaging, eventLoggers: [EventLogging]) {
        self.bag = bag
        self.eventLoggers = eventLoggers
    }
    
    func addProduct(_ product: Product) {
        bag.addProduct(product)
        
        eventLoggers.forEach {
            $0.log(event: "productAddedToBag")
        }
    }
    
    func removeProduct(_ product: Product) {
        bag.removeProduct(product)
        
        eventLoggers.forEach {
            $0.log(event: "productRemovedFromBag")
        }
    }
    
    func clearAllProducts() {
        bag.clearAllProducts()
        
        eventLoggers.forEach {
            $0.log(event: "allProductsRemovedFromBag")
        }
    }
    
    var productCount: Int {
        guard let bag = bag as? Bag else { return 0 }
        
        return bag.products.count
    }
}

// Subject

protocol ProductManaging {
    func addProduct(_ product: Product)
    func removeProduct(_ product: Product)
    func clearAllProducts()
}

// Real Subject

class Bag: ProductManaging {
    var products = [Product]()
    
    func addProduct(_ product: Product) {
        products.append(product)
    }
    
    func removeProduct(_ product: Product) {
        products.removeAll { $0 == product }
    }
    
    func clearAllProducts() {
        products.removeAll()
    }
}
