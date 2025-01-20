import Testing

@testable import AppleStoreFacade

extension KataSolution {
    @Test func testSendMail() async {
        let mailResult = await NotificationFacade.sendMail(text: "Notification test")

        switch mailResult {
        case .success(let response):
            #expect(response.notificationType == .mail)
            #expect(response.message == "Notification sent")
        case .failure(let error):
            Issue.record(error)
        }
    }

    @Test func testSendMessage() async {
        let messageResult = await NotificationFacade.sendMessage(text: "Notification test")

        switch messageResult {
        case .success(let response):
            #expect(response.notificationType == .message)
            #expect(response.message == "Notification sent")
        case .failure(let error):
            Issue.record(error)
        }
    }

    @Test func testSendPushNotification() async {
        let pushResult = await NotificationFacade.sendPushNotification(text: "Notification test")

        switch pushResult {
        case .success(let response):
            #expect(response.notificationType == .pushNotification)
            #expect(response.message == "Notification sent")
        case .failure(let error):
            Issue.record(error)
        }
    }

    @Test func testBatchSending() async {
        let results = await NotificationFacade.batchSend(text: "Notification test")

        for result in results {
            switch result {
            case .success(let response):
                #expect(response.message == "Notification sent")
            case .failure(let error):
                Issue.record(error)
            }
        }
    }

    @Test func testManualBatchSending() async {
        let results = await withTaskGroup(of: NotificationFacade.NotificationResult.self) { group in
            group.addTask { await NotificationFacade.sendMail(text: "Notification test") }
            group.addTask { await NotificationFacade.sendMessage(text: "Notification test") }
            group.addTask { await NotificationFacade.sendPushNotification(text: "Notification test") }

            var results: [NotificationFacade.NotificationResult] = []
            for await result in group {
                results.append(result)
            }
            return results
        }

        #expect(results.count == 3)

        for result in results {
            switch result {
            case .success(let response):
                #expect(response.message == "Notification sent")
            case .failure(let error):
                Issue.record(error)
            }
        }
    }
}
