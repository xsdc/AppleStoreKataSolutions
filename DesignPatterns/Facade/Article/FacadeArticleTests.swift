import Testing

@testable import FacadeArticleCode

class MockNotificationFacade: NotificationFacade {
    var testState: (text: String, notificationType: NotificationType)?
    
    override func send(text: String) {
        testState = (text, notificationType)
    }
}

@Test func testNotificationSentViaMail() {
    let notificationFacade = MockNotificationFacade(notificationType: .mail)
    notificationFacade.send(text: "Send mail!")
    
    #expect(notificationFacade.testState?.text == "Send mail!")
    #expect(notificationFacade.testState?.notificationType == .mail)
}

@Test func testNotificationSentViaMessage() {
    let notificationFacade = MockNotificationFacade(notificationType: .message)
    notificationFacade.send(text: "Send message!")
    
    #expect(notificationFacade.testState?.text == "Send message!")
    #expect(notificationFacade.testState?.notificationType == .message)
}
