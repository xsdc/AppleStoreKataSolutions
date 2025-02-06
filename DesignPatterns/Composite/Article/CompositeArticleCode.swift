
// Component

protocol BreadcrumbProviding {
    var breadcrumbs: [String] { get }
}

// Leaf

class Product: BreadcrumbProviding {
    let name: String
    let price: Double
    private var parent: Category?

    init(name: String, price: Double) {
        self.name = name
        self.price = price
    }

    var breadcrumbs: [String] {
        if let parent = parent {
            return parent.breadcrumbs + [name]
        }
        else {
            return [name]
        }
    }

    func setParent(_ parent: Category) {
        self.parent = parent
    }
}

// Composite

class Category: BreadcrumbProviding {
    let name: String
    private var children: [BreadcrumbProviding] = []
    private var parent: Category?

    init(name: String, parent: Category?) {
        self.name = name
        self.parent = parent
    }

    var breadcrumbs: [String] {
        if let parent = parent {
            return parent.breadcrumbs + [name]
        } else {
            return [name]
        }
    }

    func addChild(_ child: BreadcrumbProviding) {
        children.append(child)
    }
}
