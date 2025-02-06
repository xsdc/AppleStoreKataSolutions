import Testing

@testable import CompositeKataSolutionCode

@Test func testTask1() {
    let rootCategory = Category(id: "rootCategory", name: "Catalog", parent: nil)
    let macCategory = Category(id: "macCategory", name: "Mac", parent: rootCategory)
    let macBookCategory = Category(id: "macBookCategory", name: "MacBook", parent: macCategory)

    #expect(rootCategory.analyticsIdentifier == "rootCategory")
    #expect(macCategory.analyticsIdentifier == "macCategory")
    #expect(macBookCategory.analyticsIdentifier == "macBookCategory")
}

@Test func testTask2() {
    let rootCategory = Category(id: "rootCategory", name: "Catalog", parent: nil)
    let macCategory = Category(id: "macCategory", name: "Mac", parent: rootCategory)
    let macBookCategory = Category(id: "macBookCategory", name: "MacBook", parent: macCategory)

    let macBookPro = Product(id: "MBP246", name: "MacBook Pro", price: 1299.99)
    macBookPro.setParent(macBookCategory)

    let macBookAir = Product(id: "MBA246", name: "MacBook Air", price: 999.99)

    macBookCategory.addChild(macBookPro)
    macBookCategory.addChild(macBookAir)

    #expect(rootCategory.analyticsIdentifier == "rootCategory")
    #expect(macCategory.analyticsIdentifier == "macCategory")
    #expect(macBookCategory.analyticsIdentifier == "macBookCategory")
    #expect(macBookPro.analyticsIdentifier == "MBP246-macBookCategory")
    #expect(macBookAir.analyticsIdentifier == "MBA246")
}

@Test func testHierarchy() {
    let rootCategory = Category(id: "0", name: "Catalog", parent: nil)
    let macCategory = Category(id: "Mac", name: "Mac", parent: rootCategory)
    let macBookCategory = Category(id: "MacBook", name: "MacBook", parent: macCategory)

    let macBookPro = Product(id: "MBP246", name: "MacBook Pro", price: 1299.99)
    macBookPro.setParent(macBookCategory)

    let macBookAir = Product(id: "MBA246", name: "MacBook Air", price: 999.99)
    macBookAir.setParent(macBookCategory)

    macBookCategory.addChild(macBookPro)
    macBookCategory.addChild(macBookAir)

    #expect(rootCategory.breadcrumbs == ["Catalog"])
    #expect(macCategory.breadcrumbs == ["Catalog", "Mac"])
    #expect(macBookCategory.breadcrumbs == ["Catalog", "Mac", "MacBook"])
    #expect(macBookPro.breadcrumbs == ["Catalog", "Mac", "MacBook", "MacBook Pro"])
    #expect(macBookAir.breadcrumbs == ["Catalog", "Mac", "MacBook", "MacBook Air"])
}
