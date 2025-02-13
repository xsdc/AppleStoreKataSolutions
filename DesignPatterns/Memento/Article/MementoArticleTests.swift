import Testing

@testable import MementoArticleCode

@Test func testBasicFlow() {
    let products = Stub.bagProducts
    let bag = Bag(products: products)
    let bagManager = BagManager(bag: bag)
    
    #expect(bag.products.count == 2)
    #expect(bagManager.isAbleToUndo == false)

    bagManager.removeProduct(withID: "A")
    
    #expect(bag.products.count == 1)
    #expect(bagManager.isAbleToUndo == true)

    bagManager.removeProduct(withID: "B")

    #expect(bag.products.count == 0)
    #expect(bagManager.isAbleToUndo == true)

    bagManager.undo()
    
    #expect(bag.products.count == 1)
    #expect(bagManager.isAbleToUndo == true)

    bagManager.undo()
    
    #expect(bag.products.count == 2)
    #expect(bagManager.isAbleToUndo == false)
}

struct Stub {
    static let bagProducts = [
        Product(id: "A", name: "iPhone 16 Pro"),
        Product(id: "B", name: "AirPods Pro")
    ]
}
