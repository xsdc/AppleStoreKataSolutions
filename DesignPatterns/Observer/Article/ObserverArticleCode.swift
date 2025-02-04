import Foundation

struct Product: Equatable, Identifiable, Codable {
    let id: UUID
    let name: String
    let price: Double
}

// Subject

protocol ObserverManaging {
    func attachObserver(_ observer: Observer)
    func detachObserver(_ observer: Observer)
}

protocol ObserverNotifier {
    func notifyObservers()
}

typealias ObserverManagingNotifier = ObserverManaging & ObserverNotifier

// Concrete Subject

class WebSocketBagNotifier: ObserverManagingNotifier {
    private var observers: [Observer] = []
    private var products: [Product] = []

    func addProduct(_ product: Product) {
        self.products.append(product)
        notifyObservers()
    }

    func attachObserver(_ observer: Observer) {
        observers.append(observer)
    }

    func detachObserver(_ observer: Observer) {
        // Remove observer from the list
    }

    func notifyObservers() {
        observers.forEach { $0.notificationReceivedWithObject(self.products) }
    }
}

// Observer

protocol Observer {
    func notificationReceivedWithObject(_ object: Any)
}

// Concrete Observer

class BagIconViewModel: Observer {
    var badgeCount: Int = 0
    private let notifier: ObserverManagingNotifier

    init(notifier: ObserverManagingNotifier) {
        self.notifier = notifier
        self.notifier.attachObserver(self)
    }

    func notificationReceivedWithObject(_ object: Any) {
        if let products = object as? [Product] {
            self.badgeCount = products.count
        }
    }

    deinit {
        notifier.detachObserver(self)
    }
}

class BagListViewModel: Observer {
    var products: [Product] = []
    private let notifier: ObserverManagingNotifier

    init(notifier: ObserverManagingNotifier) {
        self.notifier = notifier
        self.notifier.attachObserver(self)
    }

    func notificationReceivedWithObject(_ object: Any) {
        if let products = object as? [Product] {
            self.products = products
        }
    }

    deinit {
        notifier.detachObserver(self)
    }
}
