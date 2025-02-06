
// Strategy

protocol NewPaymentStrategy {
    func pay(amount: Double) async -> Result<String, Error>?
}

protocol LegacyPaymentStrategy {
    func payWithAmount(_ amount: Double) async -> Result<String, Error>?
}

// Concrete Strategy

struct ApplePayPaymentStrategy: NewPaymentStrategy {
    let appleId: String

    func pay(amount: Double) async -> Result<String, Error>? {
        return .success("Payment processed with Apple Pay for \(amount)")
    }
}

struct CreditCardPaymentStrategy: NewPaymentStrategy {
    let creditCardNumber: String

    func pay(amount: Double) async -> Result<String, Error>? {
        return .success("Payment processed with credit card for \(amount)")
    }
}

struct GiftCardPaymentStrategy: LegacyPaymentStrategy {
    let id: String

    func payWithAmount(_ amount: Double) async -> Result<String, Error>? {
        return .success("Payment processed with gift card for \(amount)")
    }
}

// Context

struct NewCheckout {
    let paymentStrategy: NewPaymentStrategy?

    func processPayment(amount: Double) async -> Result<String, Error>? {
        return await paymentStrategy?.pay(amount: amount)
    }
}

struct LegacyCheckout {
    let paymentStrategy: LegacyPaymentStrategy?

    func processPayment(amount: Double) async -> Result<String, Error>? {
        return await paymentStrategy?.payWithAmount(amount)
    }
}
