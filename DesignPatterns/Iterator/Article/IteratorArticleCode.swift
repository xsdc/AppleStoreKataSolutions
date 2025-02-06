
struct Category {
    let name: String
}

// Iterator

protocol CatalogIterator {
    func next() -> Category?
}

// Concrete lterator

class ArrayCatalogIterator: CatalogIterator {
    private let categories: [String]
    private var index = 0

    init(categories: [String]) {
        self.categories = categories
    }

    func next() -> Category? {
        guard index < categories.count else { return nil }
        let category = Category(name: categories[index])
        index += 1
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
