// In addition to the current concrete visitors, add a sales tax visitor that calculates the sales tax for a product.
// The sales tax should be a variable initialised with the class.
// Write tests to verify the sales tax visitor for the `MacBookProProduct` and `VisionProProduct`.
// Test the new visitor with 10% and 15% sales tax rates. (Two tests)
// Include previous tests.

struct Kata {
    
    // Visitor
    
    protocol Visitor {
        associatedtype VisitorResult
        func visit(_ product: Product) -> VisitorResult
    }
    
    // Concrete Visitor
    
    class SalesTaxVisitor {
        // Kata
    }
    
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
    
    // Element
    
    protocol Product {
        var id: String { get }
        var price: Double { get }
    }

    protocol VisitorAccepting {
        func accept<V: Visitor>(_ visitor: V) -> V.VisitorResult
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
    }
}
