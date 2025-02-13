
struct Product {
    let id: String
    let name: String
    var quantity: Int
}

// Memento

struct BagState {
    let products: [Product]
}

// Originator

class Bag {
    private(set) var products: [Product]

    init(products: [Product] = []) {
        self.products = products
    }

    func save() -> BagState {
        BagState(products: products)
    }

    func restore(from state: BagState) {
        products = state.products
    }

    func removeProduct(withID id: String) {
        products.removeAll { $0.id == id }
    }
    
    func updateProduct(withID id: String, quantity: Int) {
        // Task 2
    }
}

// Caretaker

class BagManager {
    private(set) var bag: Bag
    private var redoStates: [BagState] = []
    private var undoStates: [BagState] = []

    init(bag: Bag = Bag()) {
        self.bag = bag
    }
    
    var isAbleToRedo: Bool {
        // Task 1
        return false
    }

    var isAbleToUndo: Bool {
        !undoStates.isEmpty
    }
    
    func redo() {
        // Task 1
    }

    func undo() {
        guard isAbleToUndo else { return }
        
        redoStates.append(bag.save())
        
        if let lastUndoState = undoStates.popLast() {
            bag.restore(from: lastUndoState)
        }
    }

    func removeProduct(withID id: String) {
        undoStates.append(bag.save())
        redoStates.removeAll()
        bag.removeProduct(withID: id)
    }
    
    func updateProduct(withID id: String, quantity: Int) {
        // Task 2
    }
}
