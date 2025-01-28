
class Request {
    let productId: String
    var log: [String] = []
    
    init(productId: String) {
        self.productId = productId
    }
}

// Handler

protocol Handler {
    var next: Handler? { get }

    func handle(request: Request, completion: @escaping (String) -> Void)
}

// Concrete Handler

class StockCheckHandler: Handler {
    private(set) var next: Handler?

    init(next: Handler?) {
        self.next = next
    }

    func handle(request: Request, completion: @escaping (String) -> Void) {
        let isInStock = true

        if isInStock {
            request.log.append("Product \(request.productId) is in stock")
            next?.handle(request: request, completion: completion)
        } else {
            completion("Product \(request.productId) is out of stock")
        }
    }
}

class AddToBagHandler: Handler {
    private(set) var next: Handler?

    init(next: Handler?) {
        self.next = next
    }

    func handle(request: Request, completion: @escaping (String) -> Void) {
        let addToBagSucceeded = true

        if addToBagSucceeded {
            request.log.append("Product \(request.productId) added to bag")
            next?.handle(request: request, completion: completion)
        } else {
            request.log.append("Failed to add product \(request.productId) to bag")
            completion("Failed to add product \(request.productId) to bag")
        }
    }
}

class LoggingHandler: Handler {
    private(set) var next: Handler?

    init(next: Handler?) {
        self.next = next
    }

    func handle(request: Request, completion: @escaping (String) -> Void) {
        request.log.append("Logging analytics event for product \(request.productId)")
        completion("Request completed")
    }
}
