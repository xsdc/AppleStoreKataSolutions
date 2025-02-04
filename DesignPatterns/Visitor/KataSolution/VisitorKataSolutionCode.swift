
// Visitor

protocol Visitor {
    associatedtype VisitorResult
    func visit(_ product: Product) -> VisitorResult
}

protocol AsyncVisitor {
    associatedtype VisitorResult
    func visit(_ product: Product) async -> VisitorResult
}

// Concrete Visitor

class EducationDiscountVisitor: Visitor {
    typealias VisitorResult = Double
    private let discountPercentage = 0.25

    func visit(_ product: Product) -> Double {
        product.price * discountPercentage
    }
}

class EmployeeDiscountVisitor: Visitor {
    typealias VistorResult = Double
    private let discountPercentage = 0.5

    func visit(_ product: Product) -> Double {
        product.price * discountPercentage
    }
}

class DescriptionVisitor: Visitor {
    typealias VisitorResult = String

    func visit(_ product: Product) -> String {
        "Product with ID \(product.id) costs $\(product.price)"
    }
}

class SalesTaxVisitor: Visitor {
    typealias VisitorResult = Double
    private var salesTax: Double

    init(salesTax: Double) {
        self.salesTax = salesTax
    }

    func visit(_ product: Product) -> Double {
        product.price * salesTax
    }
}

class StockCheckVisitor: AsyncVisitor {
    typealias VisitorResult = Result<Bool, Error>
    private let storeCode: String
    
    init(storeCode: String) {
        self.storeCode = storeCode
    }
    
    func visit(_ product: Product) async -> Result<Bool, Error> {
        return .success(false)
    }
}

// Element

protocol Product {
    var id: String { get }
    var price: Double { get }
}

protocol VisitorAccepting {
    func accept<V: Visitor>(_ visitor: V) -> V.VisitorResult
    func accept<V: AsyncVisitor>(_ visitor: V) async -> V.VisitorResult
}

// Concrete Element

struct MacBookProProduct: Product, VisitorAccepting {
    let id: String
    let price: Double

    init(id: String, price: Double) {
        self.id = id
        self.price = price
    }

    func accept<V: Visitor>(_ visitor: V) -> V.VisitorResult {
        visitor.visit(self)
    }
    
    func accept<V: AsyncVisitor>(_ visitor: V) async -> V.VisitorResult {
        await visitor.visit(self)
    }
}

struct VisionProProduct: Product, VisitorAccepting {
    let id: String
    let price: Double

    init(id: String, price: Double) {
        self.id = id
        self.price = price
    }

    func accept<V: Visitor>(_ visitor: V) -> V.VisitorResult {
        visitor.visit(self)
    }
    
    func accept<V: AsyncVisitor>(_ visitor: V) async -> V.VisitorResult {
        await visitor.visit(self)
    }
}
