import Testing

@testable import ChainOfResponsibilityKataCode

@Test func testTask1() async {
    // Task: Remove the stock check handler from the chain

    let handlerC = Stub.TempHandler(next: nil)
    let handlerB = Stub.TempHandler(next: handlerC)
    let handlerA = Stub.TempHandler(next: handlerB)

    let request = Stub.request()
    let response = await handlerA.handle(request: request)

    #expect(response.success == true)
    #expect(request.responses.count == 2)

    #expect(request.responses[0].success == true)
    #expect(request.responses[0].message == "Product 1234 added to bag")

    #expect(request.responses[1].success == true)
    #expect(request.responses[1].message == "Logging analytics event for product 1234")
}

@Test func testTask2() async {
    let handlerD = Stub.TempHandler(next: nil)
    let handlerC = Stub.TempHandler(next: handlerD)
    let handlerB = Stub.TempHandler(next: handlerC)
    let handlerA = Stub.TempHandler(next: handlerB)

    let request = Stub.request()
    let response = await handlerA.handle(request: request)

    #expect(response.success == true)
    #expect(request.responses.count == 3)

    #expect(request.responses[0].success == false)
    #expect(request.responses[0].message == "Product 1234 is out of stock at store: SF")

    #expect(request.responses[1].success == false)
    #expect(request.responses[1].message == "Product 1234 not added to bag")

    #expect(request.responses[2].success == true)
    #expect(request.responses[2].message == "Logging analytics event for product 1234")
}

@Test func testChain_StockCheck_AddToBag_Logging() async {
    let loggingHandler = LoggingHandler(next: nil)
    let addToBagHandler = AddToBagHandler(next: loggingHandler)
    let stockCheckHandler = StockCheckHandler(next: addToBagHandler)

    let request = Stub.request()
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

struct Stub {
    static func request() -> Request {
        return Request(productId: "1234")
    }

    class TempHandler {
        private(set) var next: Stub.TempHandler?

        init(next: Stub.TempHandler?) {
            self.next = next
        }

        func handle(request: Request) async -> HandlerResponse {
            let response = HandlerResponse(success: false, message: "Stub")
            request.responses.append(response)

            return await next?.handle(request: request) ?? response
        }
    }
}
