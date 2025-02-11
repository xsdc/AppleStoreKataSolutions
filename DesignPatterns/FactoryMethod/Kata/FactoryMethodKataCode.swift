
// Product

protocol ShippingMethod {
    var title: String { get }
    var deliveryDateEstimation: String { get }
    func shippingCost(forWeight: Double) -> Double
}

// Concrete Product

struct InStorePickupMethod: ShippingMethod {
    let title = "In-Store Pickup"

    var deliveryDateEstimation: String {
        return "Same day"
    }

    func shippingCost(forWeight weight: Double) -> Double {
        return 0
    }
}

struct StandardShippingMethod: ShippingMethod {
    let title = "Standard Shipping"

    var deliveryDateEstimation: String {
        return "3-5 business days"
    }

    func shippingCost(forWeight weight: Double) -> Double {
        return 0
    }
}

struct ExpressShippingMethod: ShippingMethod {
    let title = "Express Shipping"
    let baseShippingCost: Double

    var deliveryDateEstimation: String {
        return "1-2 business days"
    }

    func shippingCost(forWeight weight: Double) -> Double {
        return baseShippingCost * weight
    }
}

struct InternationalShippingMethod: ShippingMethod {
    let title = "International Shipping"
    let baseShippingCost: Double

    var deliveryDateEstimation: String {
        return "7-14 business days"
    }

    func shippingCost(forWeight weight: Double) -> Double {
        return baseShippingCost * weight
    }
}

// Creator

class ShippingMethodFactory {
    enum ShippingMethodType {
        case express, international, standard, inStorePickup, drone
    }

    static func makeShippingMethod(_ method: ShippingMethodType) -> ShippingMethod? {
        switch method {
        case .drone:
            return nil
        case .standard:
            return StandardShippingMethod()
        case .inStorePickup:
            return InStorePickupMethod()
        case .express:
            return ExpressShippingMethod(baseShippingCost: 5)
        case .international:
            return InternationalShippingMethod(baseShippingCost: 10)
        }
    }
}
