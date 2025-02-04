
class Request {
    var responses: [HandlerResponse] = []
    
    let productId: String
    var productIsInStock: Bool? = nil
    
    init(productId: String) {
        self.productId = productId
    }
}

// Handler

protocol Handler {
    var next: Handler? { get }

    func handle(request: Request) async -> HandlerResponse
}

struct HandlerResponse {
    let success: Bool
    let message: String
}

// Concrete Handler

class StockCheckHandler: Handler {
    private(set) var next: Handler?

    init(next: Handler?) {
        self.next = next
    }

    func handle(request: Request) async -> HandlerResponse {
        let successResponse = successResponse(for: request)
        request.responses.append(successResponse)
                                              
        return await next?.handle(request: request) ?? successResponse
    }
    
    private func successResponse(for request: Request) -> HandlerResponse {
        return HandlerResponse(success: true, message: "Product \(request.productId) is in stock")
    }
}

class AddToBagHandler: Handler {
    private(set) var next: Handler?

    init(next: Handler?) {
        self.next = next
    }

    func handle(request: Request) async -> HandlerResponse {
        if request.productIsInStock == false {
            let failureResponse = failureResponse(for: request)
            request.responses.append(failureResponse)
            
            return await next?.handle(request: request) ?? failureResponse
        }
        else {
            let successResponse = successResponse(for: request)
            request.responses.append(successResponse)
            
            return await next?.handle(request: request) ?? successResponse
        }
    }
    
    private func successResponse(for request: Request) -> HandlerResponse {
        return HandlerResponse(success: true, message: "Product \(request.productId) added to bag")
    }
    
    private func failureResponse(for request: Request) -> HandlerResponse {
        return HandlerResponse(success: false, message: "Product \(request.productId) not added to bag")
    }
}

class LoggingHandler: Handler {
    private(set) var next: Handler?

    init(next: Handler?) {
        self.next = next
    }

    func handle(request: Request) async -> HandlerResponse {
        let successResponse = successResponse(for: request)
        request.responses.append(successResponse)
        
        return await next?.handle(request: request) ?? successResponse
    }
            
    private func successResponse(for request: Request) -> HandlerResponse {
        return HandlerResponse(success: true, message: "Logging analytics event for product \(request.productId)")
    }
}

class InStoreStockCheckHandler: Handler {
    private(set) var next: Handler?
    private(set) var storeId: String

    init(next: Handler?, storeId: String) {
        self.next = next
        self.storeId = storeId
    }

    func handle(request: Request) async -> HandlerResponse {
        let failureResponse = failureResponse(for: request)
        request.responses.append(failureResponse)
        
        request.productIsInStock = false
        
        return await next?.handle(request: request) ?? failureResponse
    }
    
    private func failureResponse(for request: Request) -> HandlerResponse {
        return HandlerResponse(success: false, message: "Product \(request.productId) is out of stock at store: \(storeId)")
    }
}
