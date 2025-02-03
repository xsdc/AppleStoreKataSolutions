
// Component

protocol PriceProviding {
    var price: Double { get }
}

// Concrete Component

class MacBookProProduct: PriceProviding {
    var price: Double {
        return 5000.00
    }
}

class VisionProProduct: PriceProviding {
    var price: Double {
        return 3500.00
    }
}

// Decorator

class PriceDecorator: PriceProviding {
    private let product: PriceProviding

    init(product: PriceProviding) {
        self.product = product
    }

    open var price: Double {
        return product.price
    }
}

// Concrete Decorator

class StoragePriceDecorator: PriceDecorator {
    enum StorageOption: Double {
        case gb256 = 100.00
        case gb512 = 300.00
        case tb1 = 500.00
    }

    private let storageOption: StorageOption

    init(product: PriceProviding, storageOption: StorageOption) {
        self.storageOption = storageOption
        super.init(product: product)
    }

    override var price: Double {
        return super.price + storageOption.rawValue
    }
}

class AppleCarePriceDecorator: PriceDecorator {
    override var price: Double {
        return super.price + 200.00
    }
}
