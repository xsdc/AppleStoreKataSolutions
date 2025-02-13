
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
        guard let index = products.firstIndex(where: { $0.id == id }) else { return }
        products[index].quantity = quantity
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
        !redoStates.isEmpty
    }

    var isAbleToUndo: Bool {
        !undoStates.isEmpty
    }
    
    func redo() {
        guard isAbleToRedo else { return }
        
        undoStates.append(bag.save())
        
        if let lastRedoState = redoStates.popLast() {
            bag.restore(from: lastRedoState)
        }
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
        undoStates.append(bag.save())
        redoStates.removeAll()
        bag.updateProduct(withID: id, quantity: quantity)
    }
}
