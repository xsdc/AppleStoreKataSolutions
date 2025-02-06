import Testing

@testable import IteratorKataCode

@Test func testTask1() {
    let watchNode = CategoryNode(category: Category(name: "Watch"))

    let macNode = CategoryNode(category: Category(name: "Mac"))
    macNode.next = watchNode

    let iPadNode = CategoryNode(category: Category(name: "iPad"))
    iPadNode.next = macNode

    let iPhoneNode = CategoryNode(category: Category(name: "iPhone"))
    iPhoneNode.next = iPadNode

    let linkedListCatalog = LinkedListCatalog(head: iPhoneNode)
    let linkedListIterator = linkedListCatalog.makeIterator()

    guard let category = linkedListIterator.next() else { Issue.record("Category expected"); return  }

    #expect(category.name == "iPhone")

    guard let category = linkedListIterator.next() else { Issue.record("Category expected"); return  }

    #expect(category.name == "iPad")

    guard let category = linkedListIterator.next() else { Issue.record("Category expected"); return  }

    #expect(category.name == "Mac")

    guard let category = linkedListIterator.next() else { Issue.record("Category expected"); return  }

    #expect(category.name == "Watch")
}

@Test func testTask2() {
    let categories = ["iPhone", "iPad", "Mac", "Watch"]
    let arrayCatalog = ArrayCatalog(categories: categories)
    let arrayIterator = arrayCatalog.makeIterator()

    guard let category = arrayIterator.next() else { Issue.record("Category expected"); return }
    #expect(category.name == "iPhone")

    guard let category = arrayIterator.next() else { Issue.record("Category expected"); return }
    #expect(category.name == "iPad")

    guard let category = arrayIterator.next() else { Issue.record("Category expected"); return }
    #expect(category.name == "Mac")

    guard let category = arrayIterator.next() else { Issue.record("Category expected"); return }
    #expect(category.name == "Watch")

    guard let category = arrayIterator.next() else { Issue.record("Category expected"); return }
    #expect(category.name == "iPhone")

    guard let category = arrayIterator.next() else { Issue.record("Category expected"); return }
    #expect(category.name == "iPad")
}

@Test func testArrayCatalogIterator() {
    let categories = ["iPhone", "iPad", "Mac", "Watch"]
    let arrayCatalog = ArrayCatalog(categories: categories)
    let arrayIterator = arrayCatalog.makeIterator()

    #expect(arrayCatalog.categories.count == 4)

    guard let category = arrayIterator.next() else { Issue.record("Category expected"); return  }

    #expect(category.name == "iPhone")

    guard let category = arrayIterator.next() else { Issue.record("Category expected"); return  }

    #expect(category.name == "iPad")

    guard let category = arrayIterator.next() else { Issue.record("Category expected"); return  }

    #expect(category.name == "Mac")

    guard let category = arrayIterator.next() else { Issue.record("Category expected"); return  }

    #expect(category.name == "Watch")
}

@Test func testDictionaryCatalogIterator() {
    let categoryDictionary = [
        "1": "iPhone",
        "2": "iPad",
        "3": "Mac",
        "4": "Watch"
    ]
    let dictionaryCatalog = DictionaryCatalog(categories: categoryDictionary)
    let dictionaryIterator = dictionaryCatalog.makeIterator()

    #expect(dictionaryCatalog.categories.count == 4)

    guard let category = dictionaryIterator.next() else { Issue.record("Category expected"); return  }

    #expect(category.name == "iPhone")

    guard let category = dictionaryIterator.next() else { Issue.record("Category expected"); return  }

    #expect(category.name == "iPad")

    guard let category = dictionaryIterator.next() else { Issue.record("Category expected"); return  }

    #expect(category.name == "Mac")

    guard let category = dictionaryIterator.next() else { Issue.record("Category expected"); return  }

    #expect(category.name == "Watch")
}
