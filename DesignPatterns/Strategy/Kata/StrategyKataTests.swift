import Testing

@testable import StrategyKataCode

@Test func testTask1A() async {
    let applePayStrategy = ApplePayPaymentStrategy(appleId: "4321") as? NewPaymentStrategy
    let applePayCheckout = NewCheckout(paymentStrategy: applePayStrategy)
    let result = await applePayCheckout.processPayment(amount: 72000.00)

    switch result {
    case .success(let message):
        #expect(message == "Payment processed with Apple Pay for 72000.0")
    case .failure(let error):
        Issue.record(error)
    case .none:
        break
    }
    
    #expect(applePayCheckout.paymentStrategy is NewPaymentStrategy)
}

@Test func testTask1B() async {
    let creditCardStrategy = CreditCardPaymentStrategy(creditCardNumber: "1234567890") as? NewPaymentStrategy
    let creditCardCheckout = NewCheckout(paymentStrategy: creditCardStrategy)
    let result = await creditCardCheckout.processPayment(amount: 64000.00)

    switch result {
    case .success(let message):
        #expect(message == "Payment processed with credit card for 64000.0")
    case .failure(let error):
        Issue.record(error)
    case .none:
        break
    }
    
    #expect(creditCardCheckout.paymentStrategy is NewPaymentStrategy)
}

@Test func testTask2() async {
    let giftCardStrategy = GiftCardPaymentStrategy(id: "871263492814") as? LegacyPaymentStrategy
    let giftCardCheckout = LegacyCheckout(paymentStrategy: giftCardStrategy)
    let result = await giftCardCheckout.processPayment(amount: 1000.00)

    switch result {
    case .success(let message):
        #expect(message == "Payment processed with gift card for 1000.0")
    case .failure(let error):
        Issue.record(error)
    case .none:
        break
    }
    
    #expect(giftCardCheckout.paymentStrategy is LegacyPaymentStrategy)
}
