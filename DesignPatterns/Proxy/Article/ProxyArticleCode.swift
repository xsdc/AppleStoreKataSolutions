
struct Product {
    let name: String
    let price: Double
}

protocol AnalyticsEventLogging {
    func log(event: String)
}

class AnalyticsEventLogger: AnalyticsEventLogging {
    func log(event: String) {
        print("Analytics event logged: \(event)")
    }
}

// Proxy

struct BagWithAnalyticsProxy: ProductManaging {
    let bag: ProductManaging
    let logger: AnalyticsEventLogging

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
}

// Subject

protocol ProductManaging {
    func addProduct(_ product: Product)
    func removeProduct(_ product: Product)
    func clearAllProducts()
}

// Real Subject

struct Bag: ProductManaging {
    func addProduct(_ product: Product) {
        print("Product added to bag")
    }

    func removeProduct(_ product: Product) {
        print("Product removed from bag")
    }

    func clearAllProducts() {
        print("Bag has been cleared")
    }
}
