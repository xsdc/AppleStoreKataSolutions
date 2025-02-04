import Testing

@testable import FacadeKataCode

@Test func testTask1() async {
    let result = await NotificationFacade.sendMail(text: "Notification test")

    switch result {
    case .success(let response):
        #expect(response.notificationType == .mail)
        #expect(response.message == "Notification sent")
    case .failure(let error):
        Issue.record(error)
    }
}

@Test func testTask2() async {
    let result = await NotificationFacade.sendMessage(text: "Notification test")

    switch result {
    case .success(let response):
        #expect(response.notificationType == .message)
        #expect(response.message == "Notification sent")
    case .failure(let error):
        Issue.record(error)
    }
}

@Test func testTask3() async {
    let result = await NotificationFacade.sendPushNotification(text: "Notification test")

    switch result {
    case .success(let response):
        #expect(response.notificationType == .pushNotification)
        #expect(response.message == "Notification sent")
    case .failure(let error):
        Issue.record(error)
    }
}

@Test func testTask4() async {
    let results = await NotificationFacade.batchSend(text: "Notification test")
    
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

@Test func testTask5() async {
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
