import Foundation
import Testing

@testable import ObserverKataCode

@Test func testTask1() {
    let notifier = WebSocketBagNotifier()
    let bagListViewModel = BagListViewModel(notifier: notifier)
    let bagIconViewModel = BagIconViewModel(notifier: notifier)
    
    Mocks.twoProducts.forEach { notifier.addProduct($0) }
    
    #expect(bagListViewModel.products.count == 2)
    #expect(bagIconViewModel.badgeCount == 2)

    Mocks.oneProduct.forEach { notifier.removeProduct($0) }
    
    #expect(bagListViewModel.products.count == 1)
    #expect(bagIconViewModel.badgeCount == 1)
}

@Test func testTask2() {
    let notifier = WebSocketBagNotifier()
    let bagListViewModel = BagListViewModel(notifier: notifier)
    let bagIconViewModel = BagIconViewModel(notifier: notifier)
    
    #expect(bagListViewModel.products.isEmpty)
    #expect(bagIconViewModel.badgeCount == 0)

    Mocks.twoProducts.forEach { notifier.addProduct($0) }
    
    #expect(bagListViewModel.products.count == 2)
    #expect(bagIconViewModel.badgeCount == 2)
    
    notifier.detachObserver(bagIconViewModel)
    
    Mocks.oneProduct.forEach { notifier.removeProduct($0) }
    
    #expect(bagListViewModel.products.count == 1)
    #expect(bagIconViewModel.badgeCount == 2)
}

struct Mocks {
    static let product1ID = UUID(uuidString: "11111111-1111-1111-1111-111111111111")!
    static let product2ID = UUID(uuidString: "22222222-2222-2222-2222-222222222222")!
    static let product3ID = UUID(uuidString: "33333333-3333-3333-3333-333333333333")!
    
    static var product1: Product {
        Product(id: product1ID, name: "iPad Pro", price: 999.99)
    }
    
    static var product2: Product {
        Product(id: product2ID, name: "Apple Pencil", price: 99.99)
    }
    
    static var product3: Product {
        Product(id: product3ID, name: "Smart Keyboard", price: 169.99)
    }
    
    static var oneProduct: [Product] {
        [product1]
    }
    
    static var twoProducts: [Product] {
        [product1, product2]
    }
    
    static var threeProducts: [Product] {
        [product1, product2, product3]
    }
}
