
// Strategy

protocol PaymentStrategy {
    func pay(amount: Double) async -> Result<String, Error>
}

// Concrete Strategy

struct ApplePayPaymentStrategy: PaymentStrategy {
    let appleId: String

    func pay(amount: Double) async -> Result<String, Error> {
        return .success("Payment processed with Apple Pay for \(amount)")
    }
}

struct CreditCardPaymentStrategy: PaymentStrategy {
    let creditCardNumber: String

    func pay(amount: Double) async -> Result<String, Error> {
        return .success("Payment processed with credit card for \(amount)")
    }
}

// Context

struct Checkout {
    let paymentStrategy: PaymentStrategy

    func processPayment(amount: Double) async -> Result<String, Error> {
        return await paymentStrategy.pay(amount: amount)
    }
}
