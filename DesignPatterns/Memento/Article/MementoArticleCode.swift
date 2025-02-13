
struct Product {
   let id: String
   let name: String
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
}

// Caretaker

class BagManager {
    private var bag: Bag
    private var undoStates: [BagState] = []

    init(bag: Bag = Bag()) {
        self.bag = bag
    }

    var isAbleToUndo: Bool {
        !undoStates.isEmpty
    }

    func undo() {
        guard let lastUndoState = undoStates.popLast() else { return }
        bag.restore(from: lastUndoState)
    }

    func removeProduct(withID id: String) {
        undoStates.append(bag.save())
        bag.removeProduct(withID: id)
    }
}
