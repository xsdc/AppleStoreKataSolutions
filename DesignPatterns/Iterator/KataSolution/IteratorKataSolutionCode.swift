
struct Category {
    let name: String
}

class CategoryNode {
    let value: Category
    var next: CategoryNode?

    init(category: Category) {
        self.value = category
    }
}

// Iterator

protocol CatalogIterator {
    func next() -> Category?
}

// Concrete lterator

class LinkedListCatalogIterator: CatalogIterator {
    private var currentNode: CategoryNode?

    init(categoryHead: CategoryNode?) {
        self.currentNode = categoryHead
    }

    func next() -> Category? {
        guard let node = currentNode else { return nil }
        currentNode = node.next
        return node.value
    }
}

class ArrayCatalogIterator: CatalogIterator {
    private let categories: [String]
    private var index = 0

    init(categories: [String]) {
        self.categories = categories
    }

    func next() -> Category? {
        guard !categories.isEmpty else { return nil }

        let category = Category(name: categories[index])
        index += 1

        if index >= categories.count {
            index = 0
        }

        return category
    }
}

class DictionaryCatalogIterator: CatalogIterator {
    private let categories: [String]
    private var index = 0

    init(categories: [String: String]) {
        self.categories = categories
            .sorted { $0.key < $1.key }
            .map { $0.value }
    }

    func next() -> Category? {
        guard index < categories.count else { return nil }
        let category = Category(name: categories[index])
        index += 1
        return category
    }
}

// Aggregate

protocol CatalogCollection {
    func makeIterator() -> CatalogIterator
}

// Concrete Aggregate

struct LinkedListCatalog: CatalogCollection {
    let head: CategoryNode?

    init(head: CategoryNode?) {
        self.head = head
    }

    func makeIterator() -> CatalogIterator {
        return LinkedListCatalogIterator(categoryHead: head)
    }
}

struct ArrayCatalog: CatalogCollection {
    let categories: [String]

    init(categories: [String]) {
        self.categories = categories
    }

    func makeIterator() -> CatalogIterator {
        return ArrayCatalogIterator(categories: categories)
    }
}

class DictionaryCatalog: CatalogCollection {
    let categories: [String: String]

    init(categories: [String: String]) {
        self.categories = categories
    }

    func makeIterator() -> CatalogIterator {
        return DictionaryCatalogIterator(categories: categories)
    }
}
