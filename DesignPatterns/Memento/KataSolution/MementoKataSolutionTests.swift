import Testing

@testable import MementoKataSolutionCode

@Test func testTask1() {
    let products = Stub.bagProducts
    let bag = Bag(products: products)
    let bagManager = BagManager(bag: bag)
    
    #expect(bag.products.count == 2)
    #expect(bagManager.isAbleToRedo == false)
    #expect(bagManager.isAbleToUndo == false)

    bagManager.removeProduct(withID: "A")
    
    #expect(bag.products.count == 1)
    #expect(bagManager.isAbleToRedo == false)
    #expect(bagManager.isAbleToUndo == true)

    bagManager.removeProduct(withID: "B")

    #expect(bag.products.count == 0)
    #expect(bagManager.isAbleToRedo == false)
    #expect(bagManager.isAbleToUndo == true)

    bagManager.undo()
    
    #expect(bag.products.count == 1)
    #expect(bagManager.isAbleToRedo == true)
    #expect(bagManager.isAbleToUndo == true)

    bagManager.undo()
    
    #expect(bag.products.count == 2)
    #expect(bagManager.isAbleToRedo == true)
    #expect(bagManager.isAbleToUndo == false)
    
    bagManager.redo()
    
    #expect(bag.products.count == 1)
    #expect(bagManager.isAbleToRedo == true)
    #expect(bagManager.isAbleToUndo == true)
    
    bagManager.redo()
    
    #expect(bag.products.count == 0)
    #expect(bagManager.isAbleToRedo == false)
    #expect(bagManager.isAbleToUndo == true)
}

@Test func testTask2() {
    let products = Stub.bagProducts
    let bag = Bag(products: products)
    let bagManager = BagManager(bag: bag)
    
    #expect(bag.products.count == 2)
    #expect(bag.products.first?.quantity == 1)
    #expect(bag.products.last?.quantity == 1)
    #expect(bagManager.isAbleToRedo == false)
    #expect(bagManager.isAbleToUndo == false)

    bagManager.updateProduct(withID: "A", quantity: 3)
    
    #expect(bag.products.count == 2)
    #expect(bag.products.first?.quantity == 3)
    #expect(bag.products.last?.quantity == 1)
    #expect(bagManager.isAbleToRedo == false)
    #expect(bagManager.isAbleToUndo == true)
    
    bagManager.updateProduct(withID: "A", quantity: 2)
    
    #expect(bag.products.count == 2)
    #expect(bag.products.first?.quantity == 2)
    #expect(bag.products.last?.quantity == 1)
    #expect(bagManager.isAbleToRedo == false)
    #expect(bagManager.isAbleToUndo == true)
    
    bagManager.updateProduct(withID: "B", quantity: 2)
    
    #expect(bag.products.count == 2)
    #expect(bag.products.first?.quantity == 2)
    #expect(bag.products.last?.quantity == 2)
    #expect(bagManager.isAbleToRedo == false)
    #expect(bagManager.isAbleToUndo == true)
    
    bagManager.undo()
    
    #expect(bag.products.count == 2)
    #expect(bag.products.first?.quantity == 2)
    #expect(bag.products.last?.quantity == 1)
    #expect(bagManager.isAbleToRedo == true)
    #expect(bagManager.isAbleToUndo == true)
    
    bagManager.redo()
    
    #expect(bag.products.count == 2)
    #expect(bag.products.first?.quantity == 2)
    #expect(bag.products.last?.quantity == 2)
    #expect(bagManager.isAbleToRedo == false)
    #expect(bagManager.isAbleToUndo == true)
}

struct Stub {
    static let bagProducts = [
        Product(id: "A", name: "iPhone 16 Pro", quantity: 1),
        Product(id: "B", name: "AirPods Pro", quantity: 1)
    ]
}
