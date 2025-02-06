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
        // Task 2A
    }
    
    func removeProduct(_ product: Product) {
        // Task 2B
    }
    
    func clearAllProducts() {
        // Task 2C
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
        // Task 3A
    }
    
    func removeProduct(_ product: Product) {
        // Task 3B
    }
    
    func clearAllProducts() {
        // Task 3C
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
        // Task 1A
    }
    
    func removeProduct(_ product: Product) {
        // Task 1B
    }
    
    func clearAllProducts() {
        // Task 1C
    }
}
