import Testing

@testable import CompositeArticleCode

@Test func testHierarchy() {
    let rootCategory = Category(name: "Catalog", parent: nil)
    let macCategory = Category(name: "Mac", parent: rootCategory)
    let macBookCategory = Category(name: "MacBook", parent: macCategory)

    let macBookPro = Product(name: "MacBook Pro", price: 1299.99)
    macBookPro.setParent(macBookCategory)

    let macBookAir = Product(name: "MacBook Air", price: 999.99)
    macBookAir.setParent(macBookCategory)

    macBookCategory.addChild(macBookPro)
    macBookCategory.addChild(macBookAir)
    
    #expect(rootCategory.breadcrumbs == ["Catalog"])
    #expect(macCategory.breadcrumbs == ["Catalog", "Mac"])
    #expect(macBookCategory.breadcrumbs == ["Catalog", "Mac", "MacBook"])
    #expect(macBookPro.breadcrumbs == ["Catalog", "Mac", "MacBook", "MacBook Pro"])
    #expect(macBookAir.breadcrumbs == ["Catalog", "Mac", "MacBook", "MacBook Air"])
}
