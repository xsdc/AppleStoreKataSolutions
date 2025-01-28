import Testing

@testable import ChainOfResponsibilityKataSolutionCode

@Test func testChain_StockCheck_AddToBag_Logging() async {
    let loggingHandler = LoggingHandler(next: nil)
    let addToBagHandler = AddToBagHandler(next: loggingHandler)
    let stockCheckHandler = StockCheckHandler(next: addToBagHandler)

    let request = Mocks.request()
    let response = await stockCheckHandler.handle(request: request)

    #expect(response.success == true)
    #expect(request.responses.count == 3)

    #expect(request.responses[0].success == true)
    #expect(request.responses[0].message == "Product 1234 is in stock")

    #expect(request.responses[1].success == true)
    #expect(request.responses[1].message == "Product 1234 added to bag")

    #expect(request.responses[2].success == true)
    #expect(request.responses[2].message == "Logging analytics event for product 1234")
}

@Test func testChain_AddToBag_Logging() async {
    let loggingHandler = LoggingHandler(next: nil)
    let addToBagHandler = AddToBagHandler(next: loggingHandler)

    let request = Mocks.request()
    let response = await addToBagHandler.handle(request: request)

    #expect(response.success == true)
    #expect(request.responses.count == 2)

    #expect(request.responses[0].success == true)
    #expect(request.responses[0].message == "Product 1234 added to bag")

    #expect(request.responses[1].success == true)
    #expect(request.responses[1].message == "Logging analytics event for product 1234")
}

@Test func testChain_InStoreStockCheck_AddToBag_Logging() async {
    let loggingHandler = LoggingHandler(next: nil)
    let addToBagHandler = AddToBagHandler(next: loggingHandler)
    let inStoreStockCheckHandler = InStoreStockCheckHandler(next: addToBagHandler, storeId: "SF")

    let request = Mocks.request()
    let response = await inStoreStockCheckHandler.handle(request: request)

    #expect(response.success == true)
    #expect(request.responses.count == 3)

    #expect(request.responses[0].success == false)
    #expect(request.responses[0].message == "Product 1234 is out of stock at store: SF")

    #expect(request.responses[1].success == false)
    #expect(request.responses[1].message == "Product 1234 not added to bag")

    #expect(request.responses[2].success == true)
    #expect(request.responses[2].message == "Logging analytics event for product 1234")
}

struct Mocks {
    static func request() -> Request {
        return Request(productId: "1234")
    }

    class TempHandler {
        private(set) var next: Mocks.TempHandler?

        init(next: Mocks.TempHandler?) {
            self.next = next
        }

        func handle(request: Request) async -> HandlerResponse {
            let response = HandlerResponse(success: false, message: "Mock")
            request.responses.append(response)

            return await next?.handle(request: request) ?? response
        }
    }
}
