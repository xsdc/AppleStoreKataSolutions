
// Component

protocol AnalyticsIdentifiable {
    var analyticsIdentifier: String { get }
}

protocol BreadcrumbProviding {
    var breadcrumbs: [String] { get }
}

// Composite

class Category: BreadcrumbProviding {
    let id: String
    let name: String
    private var children: [BreadcrumbProviding] = []
    private var parent: Category?

    init(id: String, name: String, parent: Category?) {
        self.id = id
        self.name = name
        self.parent = parent
    }

    var analyticsIdentifier: String {
        // Task 1
        return ""
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


// Leaf

class Product: BreadcrumbProviding {
    let id: String
    let name: String
    let price: Double
    private var parent: Category?

    init(id: String, name: String, price: Double) {
        self.id = id
        self.name = name
        self.price = price
    }

    var analyticsIdentifier: String {
        // Task 2
        return ""
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
