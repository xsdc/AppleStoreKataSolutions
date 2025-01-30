import Testing

@testable import StrategyArticleCode

@Test func testApplePayPaymentStrategy() async {
    let applePayStrategy = ApplePayPaymentStrategy(appleId: "4321")
    let applePayCheckout = Checkout(paymentStrategy: applePayStrategy)
    let result = await applePayCheckout.processPayment(amount: 72000.00)

    switch result {
    case .success(let message):
        #expect(message == "Payment processed with Apple Pay for 72000.0")
    case .failure(let error):
        Issue.record(error)
    }
}

@Test func testCreditCardPaymentStrategy() async {
    let creditCardStrategy = CreditCardPaymentStrategy(creditCardNumber: "1234567890")
    let creditCardCheckout = Checkout(paymentStrategy: creditCardStrategy)
    let result = await creditCardCheckout.processPayment(amount: 64000.00)

    switch result {
    case .success(let message):
        #expect(message == "Payment processed with credit card for 64000.0")
    case .failure(let error):
        Issue.record(error)
    }
}
